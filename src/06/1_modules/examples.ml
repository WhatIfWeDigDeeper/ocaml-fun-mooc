(* stackImplementation.ml
https://www.fun-mooc.fr/asset-v1:parisdiderot+56002+session03+type@asset+block/stackImplementation.ml
*)
module Stack = struct
  type 'a t = 'a list
  let empty = []
  let push x s = x :: s
  let pop = function
    | [] -> None
    | x :: xs -> Some (x, xs)
end;;
(* break *)
let s = Stack.empty;;
let s = Stack.push 1 s;;
let x, s =
  match Stack.pop s with
    | None -> assert false
    | Some (x, s) -> (x, s);;
let r = Stack.pop s;;

(* tree.ml
https://www.fun-mooc.fr/asset-v1:parisdiderot+56002+session03+type@asset+block/tree.ml
*)
module Forest = struct
  type 'a forest = 'a list
  module Tree = struct
      type 'a tree = Leaf of 'a | Node of 'a tree forest
  end
end;;
open Forest.Tree
let t = Leaf 42;;