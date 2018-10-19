(* 1. Write a function
    mem : int -> int list -> bool
such that mem x l is true if and only if x occurs in l.
*)
let rec mem (x:int) (l:int list): bool = match x, l with
    | _, [] -> false
    | x, y::ys -> if x = y then true else mem x ys;;

(* 2. Write a function
    append : int list -> int list -> int list
such that append l1 l2 is the concatenation of l1 and l2.

[1,2,3], [4,5,6] -> [1,2,3,4,5,6]

*)
let rec append (l1:int list) (l2:int list): int list = match l1, l2 with
    | xs, [] -> xs
    | [], ys -> ys
    | x::xs, ys -> x :: (append xs ys)

(* 3. Write a function
    combine : int list -> int list -> (int * int) list 
such that combine l1 l2 is the list of pairs obtained by joining the elements of l1 and l2.
This function assumes that l1 and l2 have the same length.
For instance, combine [1;2] [3;4] = [(1, 3); (2, 4)].
*)
let rec combine l1 l2 = match l1, l2 with
    | x::xs, y::ys -> (x, y):: combine xs ys
    | _, _ -> [];;

(* 4. Write a function
    assoc : (string * int) list -> string -> int option
such that 
    assoc l k = Some x
        if (k, x) is the first pair of l
        whose first component is k. 
If no such pair exists, assoc l k = None.
// get associated int from tuple if k matches string in tuple
*)
let rec assoc (l: (string*int) list) (k: string): int option = match l, k with
    | (first,x)::xs, k -> if (first = k) then Some x else assoc xs k
    | [], _ -> None;;
