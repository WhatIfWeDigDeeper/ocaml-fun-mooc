type int_ff = int -> int

(* 1. Write a function
    compose : ('a -> 'a) list -> ('a -> 'a)
that takes as argument a list l of functions,
and that returns the function that is the composition
of the functions in l. For instance,
    compose [f;g;h] x = f (g (h x)).
Or with concrete functions,
    compose [(fun x -> x+1);(fun x -> 3*x);(fun x -> x-1)] 2 = 4.

let rec compose = function _ ->
  "Replace this string with your implementation." ;;

let rec compose = function _ ->
[f:g] = (function x -> f(g(x)))
*)

(* let rec compose' fns x = match fns, x with
    | [g], x -> g (x)
    | f :: fs, x -> f ((compose' fs), x)
;; *)



(* [f;g;h] x = (function x -> f (g (h x)) ) *)

(* let compose f g = (function x -> f(g x));; *)

(*
let rec compose = function _ ->
[f:g] = (function x -> f(g(x)))
*)


let compose = function x ->
  let rec aux = function
    | [] -> (invalid_arg "compose")
    | [g] -> g (x)
    | f::fs -> f (aux fs)
  in aux;;

let rec compose' = function
    | [] -> (invalid_arg "compose")
    | [g] -> g ()
    | f::fs -> f (compose' fs)

(* let compose = function x ->
  let rec aux = function
    | [] -> (invalid_arg "compose")
    | [g] -> g (x)
    | f::fs -> f (aux fs)
  in aux *)




(* 2. Write a function
  fixedpoint : (float -> float) -> float -> float -> float
that takes a function f of type float -> float
and two floating-point arguments start and delta.
The function fixedpoint applies repetitively f
to the result of its previous application,
starting from start, until it reaches a value y 
where the difference between y and (f y) is smaller 
than delta. In that case it returns the value of y. 
For instance, 
fixedpoint cos 0. 0.001 yields approximately 0.739 

let rec fixedpoint f start delta =
  "Replace this string with your implementation." ;;
*)
let rec fixedpoint (f: float -> float) (start: float) (delta: float): float =
  let y = f (start) in
  let z = f (y) in
  let res =
    if z < y
    then if (y -. z) < delta then y else fixedpoint f y delta
    else
    if (z -. y) < delta then y else fixedpoint f y delta
  in res;;
