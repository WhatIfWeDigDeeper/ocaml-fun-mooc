type 'a bt =
  | Empty
  | Node of 'a bt * 'a * 'a bt ;;

(* 1. Write a function
    height : 'a bt -> int
that computes the height of a tree.

height (Node (Node (Node (Empty, -1, Empty), -2, Node (Empty, -1, Empty)), 0,
    Node (Node (Empty, 2, Empty), 2, Node (Empty, -1, Empty))))  ;;

                            (N, 0, N)
               (N, -2, N)            (N, 2, N)               
        (E, -1, E),  (E, -1, E)   (E, 2, E)    (E, -1, E)

*)
let rec height (t: 'a bt) = match t with
  | Empty -> 0 
  | Node (Empty, _, right) -> 1 + height right
  | Node (left, _, _) -> 1 + height left;;
  
(* 2. A tree is balanced if, for all internal node n, its two subtrees have the same height.
Write a function
    balanced : 'a bt -> bool
that tells if a tree is balanced.
*)
let balanced (t: 'a bt): bool  = match t with
    | Empty -> true
    | Node (left, _, right) -> height left = height right;;
