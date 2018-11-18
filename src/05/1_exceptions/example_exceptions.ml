(* headexc.ml *)
exception Empty_list;;

(* define a head function that uses the exception *)
let head = function
    a::r -> a
  | []   -> raise Empty_list;;

(* let's test *)
head ['a';'b'];;
head [];;

(* trywith *)
(* multiplying all values of an integer list             *)
(* think of a 1 million element list with a 0 at the end *)

let rec multl = function
   [] -> 1
  | a::rest -> if a = 0 then 0 else a * (multl rest)
;;
(* break *)

(* use exceptions to return as soon as we see a zero *)

exception Zero;;

let multlexc l = 
  let rec aux = function 
      [] -> 1
    | a::rest -> if a = 0 then raise Zero else a * (aux rest)
  in
  try aux l with Zero -> 0;;

    
(* errorexc.ml *)
(* division by zero *)
3/0;;

(* out of bound access to mutable data structures *)

let v = [|1;2;3|];;
v.(0);;
v.(3);;

(* incomplete pattern matching *)

let drop = function
  | a::rest -> rest;;
drop [1;2;3;4;5];;
drop [];;
