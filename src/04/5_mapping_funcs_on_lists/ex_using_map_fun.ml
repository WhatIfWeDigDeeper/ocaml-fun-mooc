type 'a tree =
    Node of 'a tree * 'a * 'a tree
  | Leaf of 'a;;

(* 1. Using the function map from the module List, write a function
    
    wrap : 'a list -> 'a list list
    
that transforms a list of elements 'a
into a list of singleton lists. 
For instance,
    wrap [1;2;3] is equal to [[1];[2];[3]]
*)
let wrap l = List.map (fun x -> [x])
;;

(* 2. Consider the definition of the type tree given in the prelude.
It represents binary trees carrying data items, on its internal nodes, and on its leaves. 
Write a function

    tree_map : ('a -> 'b) -> 'a tree -> 'b tree

such that tree_map f t yields a tree of the same structure as t,
but with all its data values x replaced by f x 
For example, suppose a function
    string_of_int : int -> string,
that takes an integer and generates the string that represent this integer.
Applied to tree_map and a tree of integers (i.e. of type int tree),
it would yield a tree of strings (i.e. of type string tree).

let rec tree_map f = function _ ->
  "Replace this string with your implementation." ;;
*)
let rec tree_map (f: 'a -> 'b): 'a tree -> 'b tree = function
  | Leaf a -> Leaf (f a)
  | Node (t1, a, t2) ->  
    Node ( (tree_map f t1), f a, (tree_map f t2) )
;;
