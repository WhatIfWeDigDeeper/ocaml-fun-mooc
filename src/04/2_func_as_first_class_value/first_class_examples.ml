(* lists *)
let fl = [(function x -> x+1);(function x -> 2*x)];;

(List.hd fl) 17;;

(* funcs as args to other funcs *)
let apply_twice f x = f (f x);;

apply_twice (function x -> 2*x) 1;;

let rec apply_n_times f n x =
  if n <= 0
  then x
  else apply_n_times f (n-1) (f x);;

apply_n_times (function x -> 2*x) 10 1;;

(* func as result *)
let compose f g = (function x -> f(g x));;

compose (function x->x+1) (function x->2*x);;

(compose (function x->x+1) (function x->2*x)) 10;;

(* type error float v int 
compose (function x-> x+1) (function x -> x *. 3.14);;
*)

(* associative *)
let double = function x -> 2*x;;

(*
double double 5;;
*)

double (double 5);;

