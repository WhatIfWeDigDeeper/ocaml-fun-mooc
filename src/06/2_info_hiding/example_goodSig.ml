(* goodSignature.ml
https://www.fun-mooc.fr/asset-v1:parisdiderot+56002+session03+type@asset+block/goodSignature.ml
*)
module NaturalsGood : sig
  (* Invariant: A value of type t is a positive integer. *)
  type t
  val zero : t
  val succ : t -> t
  val pred : t -> t
end = struct
  type t = int
  let zero = 0
  (* The functions maintain the invariant. *)
  let succ n = if n = max_int then 0 else n + 1
  let pred = function 0 -> 0 | n -> n - 1
end;;
open NaturalsGood
let rec add : t -> t -> t = fun x y ->
  if x = zero then y else succ (add (pred x) y);;

(* this is not allowed now 
let i_break_the_abstraction = pred (-1)
*)

