type 'a clist =
  | CSingle of 'a
  | CApp of 'a clist * 'a clist
  | CEmpty

let example =
  CApp (CApp (CSingle 1,
              CSingle 2),
        CApp (CSingle 3,
              CApp (CSingle 4, CEmpty)))
;;

(* 1. Write a function
    to_list : 'a clist -> 'a list
which computes the 'a list that contains the same elements
as the input 'a clist, in the same order.
*)
let rec to_list (cl: 'a clist): 'a list = match cl with
    | CEmpty -> []
    | CSingle x -> [x]
    | CApp (cl1, cl2) -> to_list cl1 @ to_list cl2
;;

(* 2. Write a function
    of_list : 'a list -> 'a clist
which computes the 'a clist that contains the same elements
as the input 'a list, in the same order.
*)
let rec of_list (l: 'a list): 'a clist = match l with
    | [] -> CEmpty
    | x :: xs -> CApp (CSingle x, of_list xs)
;;

(* 3. Write a function
    append : 'a clist -> 'a clist -> 'a clist
such that:
    1. append CEmpty l = append l CEmpty = l
    2. append l1 l2 = CApp (l1, l2) otherwise
*)

let append (l1: 'a clist) (l2: 'a clist): 'a clist = match l1, l2 with
    | CEmpty, l -> l
    | l, CEmpty -> l
    | l1', l2' -> CApp (l1', l2')
    ;;

(* 4. Write a function
    hd : 'a clist -> 'a option
that returns Some x where x is the first element 
of the input 'a clist,
if it is not empty, and returns None otherwise.
*)
let rec hd (l: 'a clist): 'a option = match l with
    | CEmpty -> None
    | CSingle x -> Some x
    | CApp (x1, x2) ->
        if x1 = CEmpty
            then hd x2
        else
            hd x1
;;

(* 5. Write a function
    tl : 'a clist -> 'a clist option
that returns Some l where l is the input sequence
without its first element, if this input sequence is not empty,
or returns None otherwise.
*)
let tl (l: 'a clist): 'a clist option = match l with
    | CEmpty -> None
    | CSingle _ -> Some CEmpty
    | CApp(_, x2) -> Some x2
;;