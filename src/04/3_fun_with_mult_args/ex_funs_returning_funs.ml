(* 1. Rewrite
    equal_on_common : 'a list -> 'a list -> bool
by using nested function .. -> constructions. 
Using the match .. with construction or tuple patterns is forbidden.
You can (and must) only call the operators && and =, and the 
function equal_on_common recursively.

let rec equal_on_common l1 l2 = match l1,l2 with
  | [],_ -> true
  | _,[] -> true
  | h1::r1,h2::r2 -> h1=h2 && equal_on_common r1 r2

*)

(*
let rec equal_on_common = function
            | [],_ -> true
            | _,[] -> true
            | h1::r1,h2::r2 -> (h1=h2) && equal_on_common r1 r2;; 
            
let st = equal_on_common [1;2;3] [2;3;4]

            && ((equal_on_common r1) r2)
;;
*)

let rec equal_on_common =
    function l1 -> function
        | [] -> true
        | _ -> function l2 -> function
            | [] -> true
            | h1::r1,h2::r2 -> 
                h1=h2 && equal_on_common r1 r2
