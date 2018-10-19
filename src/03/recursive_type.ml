type int_list = 
    | EmptyList
    | SomeElement of int * int_list;;

let rec length_int_list = function
| EmptyList -> 0
| SomeElement(_, l) -> 1 + length_int_list l;;

let rec length = function
| [] -> 0
| _ :: xs -> 1 + length xs;;

let three = length [1;2;3];;

let rec rev_inefficient = function
| [] -> []
| x :: xs -> rev_inefficient xs @ [x];;

(* linear, tail recursion *)
let rec rev_aux acc = function
| [] -> acc
| x :: xs -> rev_aux (x :: acc) xs;;

let rev l = rev_aux [] l;;

let l = rev [1;2;3];;

let rec uniq = function
    | [] -> []
    | [x] -> [x]
    | x :: x' :: xs ->
        if x = x'
            then uniq(x' :: xs)
        else
            x :: uniq(x' :: xs);;
let l1 = uniq [1;2;2;3;4;3];;

