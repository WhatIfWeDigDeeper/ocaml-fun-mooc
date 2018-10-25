type ('a, 'b) either = 
    | Left of 'a
    | Right of 'b;;

type square = { dimension: int };;

type circle = { radius: int };;

type shape = (square, circle) either;;

let a_shape = Left { dimension = 42 };;

let another_shape = Right { radius = 10 };;


(* binary search tree *)

type 'a bst = 
    | Empty
    | Node of 'a bst * 'a * 'a bst;;

let rec insert x = function
    | Empty -> Node (Empty, x, Empty)
    | Node (l, y, r) ->
        if x = y then Node (l, y, r)
        else if x < y then Node (insert x l, y, r)
        else Node (l, y, insert x r);;

let rec find_max = function
    | Empty -> assert false
    | Node (_, x, Empty) -> x
    | Node (_, x, r) -> find_max r;;

let rec delete x = function
    | Empty -> Empty
    | Node (l, y, r) -> 
        if x = y then join l r
        else if x < y then Node (delete x l, y, r)
        else Node (l, y, delete x r)
and join l r = match l, r with
    | Empty, r -> r
    | l, Empty -> l
    | l, r -> let m = find_max l in Node (delete m l, m, r);;

type contact = { name: string; phone_number: int }

type database = contact bst;;


(* parameterized types *)

type ('a, 'b) t = 'a * 'b * 'a;;

(* arity must match - this is error *)
type u = (int, bool, string) t;;

