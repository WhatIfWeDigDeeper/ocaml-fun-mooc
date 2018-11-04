(* 1. Define a function
    last_element: 'a list -> 'a
that returns the last element of a list.
Your function may return (invalid_arg "last_element")
when the list is empty.

    let rec last_element = function _ ->
*)
let rec last_element = function
    | [] -> (invalid_arg "last_element")
    | [x] -> x
    | _ :: xs -> last_element xs;;

(* 2. Write a function
    is_sorted: 'a list -> bool
that takes a list l as argument, and that checks that
the list is sorted in increasing order according
to the polymorphic comparison operator <

let rec is_sorted = function _ ->
  "Replace this string with your implementation." ;;
*)

let rec is_sorted = function
    | ([_] | []) -> true
    | [x;y] -> (x < y)
    | x :: ((y :: _) as ys) ->
        if (x < y)
            then is_sorted ys
        else
            false
;;