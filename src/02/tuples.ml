
(* ---------------Tuples---------------*)

let a = (3 * 6, 4 * 6);;

(* destructuring *)
let (x, _) = a;;


(* Excercises *)

(*
  Write a function exchange of type int -> int 
  that takes an integer x between 10 and 99 and 
  returns an integer which is x 
  whose digits have been exchanged. 
  For instance, exchange 73 = 37.
*)
let exchange k =
  if (k < 10 || k > 99)
  then k
  else
    let str = string_of_int k in
    let c1 = String.get str 0 in
    let c2 = String.get str 1 in
    let reversed_string = (String.make 1 c2) ^ (String.make 1 c1) in
    let result = int_of_string reversed_string in result;;

(*
  If you multiply my grand-son age by four, you know how old I am.
  Now, if you exchange the two digits of our ages then you have
  to multiply by three my age to get the age of my grand-son

  is_valid_answer of type int * int -> bool
  such that is_valid_answer (grand_father_age, grand_son_age)
  returns true if and only if grand_father_age and grand_son_age 
  verify the constraints of the puzzle.
*)

let is_valid_answer ((grand_father_age: int), (grand_son_age: int)): bool =
  let quad_gs = (grand_son_age * 4) in
  let rev_gf = exchange grand_father_age in
  let rev_gs = exchange grand_son_age in
  let result = (rev_gf * 3 = rev_gs) &&  (quad_gs = grand_father_age) in result;;



(*
Write a function find : (int * int) -> (int * int) 
that takes a pair (max_grand_father_age, min_grand_son_age) and 
returns a solution (grand_father_age, grand_son_age) to the problem, 
where min_grand_son_age <= grand_son_age < grand_father_age <= max_grand_father_age
or (-1, -1) if there was no valid answer in the given range.
*)

type grand_age = int * int;;
let rec find (answer: grand_age): grand_age =
  if is_valid_answer answer
  then answer
  else
    let max_grand_father_age, min_grand_son_age = answer in
    let grand_son_age = min_grand_son_age + 1 in
    let grand_father_age = max_grand_father_age -1 in
    let result =
      if (min_grand_son_age <= grand_son_age
          && grand_son_age < grand_father_age
          && grand_father_age <= max_grand_father_age)
      then
        find (grand_son_age, grand_father_age)
      else
        ((-1),(-1)) in result;;


let rec find (min_grand_son_age, max_grand_father_age): grand_age =
  if is_valid_answer (min_grand_son_age, max_grand_father_age)
  then (min_grand_son_age, max_grand_father_age)
  else
    let grand_son_age = min_grand_son_age + 1 in
    let grand_father_age = max_grand_father_age -1 in
    let result =
      if (min_grand_son_age <= grand_son_age
          && grand_son_age < grand_father_age
          && grand_father_age <= max_grand_father_age)
      then
        find (grand_son_age, grand_father_age)
      else
        ((-1),(-1)) in result;;


