(* badSignature.ml
https://www.fun-mooc.fr/asset-v1:parisdiderot+56002+session03+type@asset+block/badSignature.ml
*)
module NaturalsBad : sig
  (* Invariant: A value of type t is a positive integer. *)
  type t = int
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
(* break *)
open NaturalsBad
let rec add : t -> t -> t = fun x y ->
  if x = zero then y else succ (add (pred x) y);;
let i_break_the_abstraction = pred (-1);;
