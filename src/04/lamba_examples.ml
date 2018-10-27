(* lambda *)
function x -> x+1;;

function y -> [ [y+2; y+3]; [y; y*y]];;

(function x -> 2*x) 5;;


(* binding of identifier *)
let double x = 2*x;;

double 3;;

let double = (function x -> 2*x);;

double 3;;

let rec length = function
  | [] -> 0
  | _ :: r -> 1+ length r
;;

length [17; 42; 73];;

(* pattern *)
type expr = 
  | Int of int
  | Add of expr * expr

let rec eval = function
  | Int n -> n
  | Add(e1,e2) -> (eval e1) + (eval e2);;

eval (Add (Add (Int 2, Int 5), Int 7));;