(*
  ocaml
  # #use "src/02/typed_db.ml"

The code of the mini-database example is given in the prelude.
*)

(* A phone number is a sequence of four integers. *)
type phone_number = int * int * int * int;;

(* A contact has a name and a phone number. *)
type contact = {
  name         : string;
  phone_number : phone_number
};;

(* Here is a dumb contact. *)
let nobody = { name = ""; phone_number = (0, 0, 0, 0) };;

(* A database is a collection of contacts. *)
type database = {
  number_of_contacts : int;
  contacts : contact array;
};;

(* [make n] is the database with no contact and at most [n] contacts
    stored inside. *)
let make (max_number_of_contacts): database =
  {
    number_of_contacts = 0;
    contacts = Array.make max_number_of_contacts nobody
  };;

(* Queries are represented by a code and a contact.
   - If the code is 0 then the contact must be inserted.
   - If the code is 1 then the contact must be deleted.
   - If the code is 2 then we are looking for a contact
     with the same name in the database. *)
type query = {
  code    : int;
  contact : contact;
}

type db_result = bool * database * contact;;

let insert_code = 0;;
let delete_code = 1;;
let search_code = 2;;

let search (db) (contact): db_result =
  let rec aux idx =
    if idx >= db.number_of_contacts then
      (false, db, nobody)
    else if db.contacts.(idx).name = contact.name then
      (true, db, db.contacts.(idx))
    else
      aux (idx + 1)
  in
  aux 0;;

let insert (db) (contact): db_result =
  if db.number_of_contacts >= Array.length db.contacts then
    (false, db, nobody)
  else
    let (status, db, _) = search db contact in
    if status then (false, db, contact) else
      let cells i =
	      if i = db.number_of_contacts then contact else db.contacts.(i)
      in
      let db' = {
          number_of_contacts = db.number_of_contacts + 1;
          contacts = Array.init (Array.length db.contacts) cells
        }
      in
      (true, db', contact);;

let delete (db) (contact): db_result =
  let (status, db, contact) = search db contact in
  if not status then (false, db, contact)
  else
    (* Array.init -> int -> (int -> a) -> a array *)
    let cells i =
      if db.contacts.(i).name = contact.name then
        nobody
      else
        db.contacts.(i) in
          let db' = {
            number_of_contacts = db.number_of_contacts - 1;
            contacts = Array.init (Array.length db.contacts) cells
          } in (true, db', contact);;

(* Engine parses and interprets the query. *)
let engine db { code ; contact } =
  if code = 0 then insert db contact
  else if code = 1 then delete db contact
  else if code = 2 then search db contact
  else (false, db, nobody);;

let insert_code = 0;;
let delete_code = 1;;
let search_code = 2;;

let proof_of_bug  =
  let db_proof = make 5 in
  let firstContact = { name = "first"; phone_number = (0, 0, 0, 1) } in
  let secondContact = { name = "second"; phone_number = (0, 0, 1, 0) } in
  let _ = engine (db_proof) { code = insert_code; contact = firstContact } in
  let _ = engine db_proof { code = insert_code; contact = secondContact } in
  let _ = engine db_proof { code = delete_code; contact = firstContact } in
  let status, _, _ = engine db_proof { code = search_code; contact = secondContact } in
  let result = (status = false) in result;;

(*
  1. You may have noticed that there is an error in the implementation
  of our database. This error leads to not finding users that should 
  be in the database (because they have been added at some point, 
  and not deleted since) after certain sequences of queries. 
  Find the bug and give a sequence of operations proof_of_bug 
  of type query array that exhibits it when executed one after 
  the other on an initially empty database. 
  The failure must be triggered by the last query.
*)
let proof = [|
  { code=0; contact={name="t1";phone_number=(0,0,1,0)}};
  { code=0; contact={name="t2";phone_number=(0,0,0,1)}};
  { code=1; contact={name="t1";phone_number=(0,0,1,0)}};
  { code=2; contact={name="t2";phone_number=(0,0,0,1)}}
  |];;

(*
  2. To fix this bug, write a new version of delete that 
  enforces the following invariant on the database, 
  which is expected by the other functions. 

  All the contacts of a database db (and no others) should be stored 
  in the array db.contacts between 
  indexes 0 and db.number_of_contacts - 1 (inclusive).

// filter out contact and concatenante array
*)

let find_index (ary) (predicate: contact -> bool): int =
  let rec aux idx =
    if idx >= Array.length ary -1 then
      -1
    else
      if predicate (Array.get ary idx)
        then idx
      else
        aux (idx + 1)
  in aux 0;;

let is_match (c1: contact) (c2: contact): bool =
  let result = c1.name = c2.name in result;;

let find_contact_index (contacts) (contact): int =
  let predicate = is_match (contact) in
  let found_contact_index = find_index (contacts) predicate in found_contact_index;;

let delete (db: database) (contact: contact): db_result =
  let found_index = find_contact_index db.contacts contact in
  let result =
    if (found_index = -1)
      then (false, db, contact)
    else
      let ary1 = Array.sub db.contacts 0 (found_index) in
      let ary2 = Array.sub db.contacts (found_index + 1) (Array.length db.contacts - found_index -1) in
      let ary3 = Array.append ary1 ary2 in
      let updated_result = (true, {
        number_of_contacts = db.number_of_contacts -1;
        contacts = Array.append ary3 (Array.make 1 nobody)},
        contact)
      in updated_result
    in result;;

(*
3. Write a new function
     update : database -> contact -> (bool * database * contact) 
  that either changes the number of an existing person or 
  inserts a new contact. It should return true and the updated 
  database if any of these two options succeeded, or false with 
  the untouched database. The returned contact is not important,
  it is here just so the function has the same signature as the others.

let update (db) (contact): db_result =

*)
let update (db) (contact): db_result =
  let _, post_del_db, _ = delete db contact in
  let insert_result = insert post_del_db contact in insert_result;;

(*
  4. Write an updated engine function that does an update 
  when given a query with code 3, and uses your updated delete function.
*)

let engine db { code ; contact } =
  if code = 0 then insert db contact
  else if code = 1 then delete db contact
  else if code = 2 then search db contact
  else if code = 3 then update db contact
  else (false, db, nobody);;
