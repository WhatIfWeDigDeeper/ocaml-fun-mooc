(* 1. Write a function

    filter : ('a -> bool) -> 'a list -> 'a list
    
that takes a predicate p (a function returning a boolean) 
and a list l and returns all the elements of l 
that satisfy p (for which p returns true).

let filter p l =
  "Replace this string with your implementation";;

*)
let filter p l = List.fold_left (fun acc elem -> if (p elem) then elem::acc else acc) [] l
;;

(* gm - will reverse list
let pos_filter = filter (fun x -> x > 0)
pos_filter [(-1);4;(-90);0;50];;
- : int list = [50; 4]
*)

(* 2. Define, using List.fold_right, a function

    partition : ('a -> bool) -> 'a list -> 'a list * 'a list
    
that takes a predicate p and a list l, 
and that partitions l by p. 
It returns a pair of two lists (lpos,lneg), 
where lpos is the list of all elements of l 
that satisfy p, and 
lneg is the list of all elements that do not satisfy p.

let partition p l =
  "Replace this string with your implementation";;

let partition (p: 'a -> bool) (l: 'a list): ('a list, 'a list) = 

*)
let partition p l = 
    List.fold_right
        (fun elem acc -> match acc with
            | (pos, neg) -> 
            if (p elem) then ((elem::pos), neg) 
            else (pos, elem::neg)) 
    l 
    ([],[])
;;

(* 3. One way of sorting a list is as follows:
The empty list is already sorted.
If the list l has a head h and a rest r, 
  then a sorted version of l can be obtained in three parts:
    1. first a sorted version of all elements of r that are smaller or equal to h,
    2. then h,
    3. then a sorted version of all elements of r that are greater than h.
Write a function

    sort:'a list-> 'a list

that implements this algorithm, 
using the function partition of the previous question.
This sorting algorithm is also known as Quicksort
where the pivot is always the first element of the list.

let rec sort = function _ ->
  "Replace this string with your implementation";;
*)
let rec sort = function
    | ([]|[_]) as ls -> ls
    | h::r -> let (less, greater) = (partition (fun x -> x <= h) r) in
        let result = (sort less) @ [h] @ (sort greater) in result
;;


(*
let rec sort = function
    | ([]|[_]) as ls -> ls
    | h::r -> let (less, greater) = (partition (fun x -> x <= h) r) in
        let low: 'a list = (sort less) in
        let hi: 'a list = (sort greater) in
        let result = (low @ [h]) @ hi in result;;
*)

  