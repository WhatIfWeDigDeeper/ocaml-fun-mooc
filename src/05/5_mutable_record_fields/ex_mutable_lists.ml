type 'a xlist =
  { mutable pointer : 'a cell }
and 'a cell =
  | Nil
  | List of 'a * 'a xlist ;;

let nil () =
  { pointer = Nil } ;;

let cons elt rest =
  { pointer = List (elt, rest) } ;;

exception Empty_xlist ;;

(* 1. Define

    head : 'a xlist -> 'a
    
that returns the first element of the list if it exists, or fails with Empty_xlist. 
This function does not modify the list.
let head l = "your implementation." ;;
*)
let head (l: 'a xlist): 'a = match l.pointer with
    | Nil -> raise Empty_xlist
    | List (l1, _) -> l1;;

(* 2. Define

    tail : 'a xlist -> 'a xlist
    
that returns the list without its first element
if it exists, or fails with Empty_xlist. 
This function does not modify the list.
let tail l = "Your implementation." ;;
*)

let tail l = match l.pointer with
    | Nil -> raise Empty_xlist
    | List (_, l2) -> l2;;

(* 3. Define

    add : 'a -> 'a xlist -> unit
    
that modifies the list in place 
to add an element at the front.

let add a l = "Your implementation." ;;
*)
let add (a: 'a) (l: 'a xlist): unit = match l.pointer with
    | Nil -> l.pointer <- List (a, nil())
    | List (_, _) as l2 -> l.pointer <- List (a, {pointer = l2});;


(* 4. Define

    chop : 'a xlist -> unit
    
that modifies the list to remove its front element,
or fails with Empty_xlist.

let chop l = "Your implementation." ;;
*)
let chop (l: 'a xlist): unit = match l.pointer with
    | Nil -> raise Empty_xlist
    | List(_, l2) -> l.pointer <- l2.pointer;;

(* 5. Define

    append : 'a xlist -> 'a xlist -> unit

a destructive concatenation operation that modifies
the last pointer of the first list to point 
to the beginning of the second list.

let rec append l l' = "Your implementation." ;;
*)
let rec append (l: 'a xlist) (l': 'a xlist): unit = match l.pointer with
    | Nil -> l.pointer <- l'.pointer;
    | List(_, l2) -> append l2 l'
;;


(* 6. Define

    filter : ('a -> bool) -> 'a xlist -> unit

a destructive filter operation on lists that
removes from the list all elements that do not satisfy
the boolean predicate passed as parameter.

let rec filter p l = "Your implementation." ;;
*)
let rec filter (p: 'a -> bool) (l: 'a xlist): unit = match l.pointer with
    | Nil -> ();
    | List(x, l2) -> 
        if (p x)
            then filter p l2
        else
            (
                l.pointer <- l2.pointer;
                filter p l2;
            )
;;
