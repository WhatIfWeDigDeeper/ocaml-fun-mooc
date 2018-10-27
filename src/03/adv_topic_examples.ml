type euro = Euro of float;;

type dollar = Dollar of float;;

let euro_of_dollar (Dollar d) = Euro (d /. 1.33);;

let x = Dollar 4.;;

let y = Euro 5.;;

(*
let invalid_comparison = ( x < y );;
*)

let valid_comparision = (euro_of_dollar x < y);;

(* OR matches *)
let remove_zero_or_one_head = function
    | 0 :: xs -> xs
    | 1 :: xs -> xs
    | l -> l;;

let remove_zero_or_one_head' = function
    | 0 :: xs | 1 :: xs -> xs
    | l -> l;;

let remove_zero_or_one_head'' = function
    | (0 | 1) :: xs -> xs
    | l -> l;;

(* named match in branch *)
let rec duplicate_head_at_the_end = function
    | [] -> []
    | (x :: _) as l -> l @ [x];;

let l = duplicate_head_at_the_end [1;2;3];;


(* guard *)
let rec push_max_at_the_end = function
    | ([] | [_]) as l -> l
    | x :: ((y :: _) as l) when x <= y ->
        x :: push_max_at_the_end l
    | x :: y :: ys ->
        y :: push_max_at_the_end (x :: ys);;

let l = push_max_at_the_end [3;2;1];;

