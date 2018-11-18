(* 1. Using List.fold_left, write a function

    for_all : ('a -> bool) -> 'a list -> bool

It takes as argument a list l of type 'a list, 
and a predicate p of type 'a -> bool. 
It must return true if and only if 
all elements of l satisfy the predicate p.

let for_all p l =
  "Replace this string with your implementation."
*)

let for_all p l = 
    List.fold_left 
        (fun acc elem -> if acc && (p elem) then true else false)
        true
        l
;;
  
(* 2. Using List.fold_left, write a function

    exists : ('a -> bool) -> 'a list -> bool
    
It takes as argument a list l of type 'a list, 
and a predicate p of type 'a -> bool. 
It must returns true if at least one element of l 
satisfies the predicate p.

let exists p l =
  "Replace this string with your implementation."
*)
let exists p l =
    List.fold_left (fun acc elem -> if acc || (p elem) then true else acc)
    false
    l;;

(* 3. Write a function

  sorted : ('a -> 'a -> int) -> 'a list -> bool
  
using List.fold_left that checks that a list of elements l of type 'a is sorted, 
according to an ordering function 
  cmp of type 'a -> 'a -> int. 
The ordering function returns:

  1 (or any positive number) if the first element is greater than the second,
  -1 (or any negative number) if the first element is lesser than the second,
  and 0 otherwise.

For the fold_left part, you can use the type 'a option as the accumulator:
  at each iteration of fold_left, if the list if sorted until now,
  the acccumulator is either Some v, 
    where v is the previous element, or None otherwise. 
Remember, the empty list is sorted, so you can use the list 
with at least one element to check using fold_left.

let sorted cmp l =
  "Replace this stirng with your implementation."
*)

let isLessOrNone (cmp: 'a -> 'a -> int) = function (acc: 'a option)
  -> function (elem: 'a) 
    -> match acc with
      | Some prev ->
          if ((cmp prev elem) = 1)
              then None 
          else
              Some elem
      | None -> None
;;

let sorted (cmp: 'a -> 'a -> int) (l: 'a list): bool = match l with
  | [] -> true
  | h::r -> 
      let parse_fn = something cmp in
      let folded = (List.fold_left
        parse_fn
        Some h
        r
      ) in 
      let result = folded <> None in result
;;


let sorted2 cmp l = match l with
  | ([]|[_]) -> true
  | h::r -> 
    (List.fold_left
            (fun acc elem -> match acc with
              | None -> None
              | Some prev ->
                if (cmp prev elem) = 1
                  then None 
                else Some elem
            )
          Some h
          r) <> None
;;

let isLessOrNone (acc: 'a option) (el: 'a): 'a option =
  if acc = None
    then acc
  else
    if (cmp prev elem) = 1
      then None 
    else Some elem
;;

let sorted3 cmp l = match l with
  | ([]|[_]) -> true
  | h::r -> 
    (List.fold_left
            (fun acc elem ->
              if acc = None
                then None
              else
                if (cmp prev elem) = 1
                  then None 
                else Some elem
            )
          Some h
          r) <> None
;;

let my_compare = fun a b -> if a < b then -1 else if a = b then 0 else 1;;


let isSequencedOrNone (cmp: 'a -> 'a -> int) =
  fun (acc: 'a option) (elem: 'a) -> match acc with
    | Some prev ->
        if ((cmp prev elem) = 1)
        then None 
        else
          Some elem
    | None -> None
;;