(* stack.ml 
https://www.fun-mooc.fr/asset-v1:parisdiderot+56002+session03+type@asset+block/stack.ml
*)
module Stack : sig
  type 'a t = 'a list
  val empty : 'a t
  val push : 'a -> 'a t -> 'a t
  val pop : 'a t -> ('a * 'a t) option
end = struct
  type 'a t = 'a list
  let empty = []
  let push x s = x :: s
  let pop = function
    | [] -> None
    | x :: xs -> Some (x, xs)
end;;



