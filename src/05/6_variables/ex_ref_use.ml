exception Empty ;;

(* 1. Define

    swap : 'a ref -> 'a ref -> unit

that swaps the contents of two references.
*)
let swap (ra: 'a ref) (rb: 'a ref): unit = 
  let temp_a = ref !ra in 
  ra := !rb;
  rb := !temp_a;
;;

(* Define

    update : 'a ref -> ('a -> 'a) -> 'a
    
that calls a function on the contents of a reference, 
updates it with the result, and returns the old value. 
For instance let r = ref 6 in update r (function x -> x + 1) 
should return 6 and set the reference to 7.
let update r f =
*)
let update (r: 'a ref) (f: ('a -> 'a)): 'a =
    let old = !r in
    r := f !r;
    let result = old in result;;

(* Define

    move: 'a list ref -> 'a list ref -> unit

that removes the top argument from the first list 
and puts it on top of the second list. 
If the first list is empty, it should raise Empty.
*)
let move (l1: 'a list ref) (l2: 'a list ref): unit =
    if List.length !l1 = 0
        then raise Empty
    else (
        l2 := (List.hd !l1) :: !l2;
        l1 := List.tl !l1;
    )
;;

(* A common pattern is to use a reference 
to perform a computation in an imperative way, 
but to keep it in a local definition, 
completely invisible from outside the function implementation. 
Define

    reverse: 'a list -> 'a list
    
that has a type and an observable behaviour that 
look like the ones of a purely functional function, 
but that use a reference internally to perform the computation.
It takes a list, and returns a copy of the list whose elements
are in reverse order. 
The only functions you can call, except from locally defined functions, 
are (!), (:=), ref, and move that you just defined. 
And you are not allowed to use pattern matching.
*)
let reverse (l: 'a list): 'a list  =
    let l2 = ref [] in
    let l1 = ref l in 
    let _ =
        try
            while true do
                move l1 l2;
            done;
        with _ -> () in
    !l2
;;