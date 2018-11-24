(* 1. Write a function
    
    print_int_list : int list -> unit

that takes a list of integers as input, 
and prints all the elements of the list,
each on its own line.

let rec print_int_list l =
  "Replace this string with your implementation." ;;
*)
let rec print_int_list l = match l with
  | [] -> print_newline()
  | h::r -> let num = print_int h in
      let nl = print_newline() in
      let result = (print_int_list r) in result
;;

(* 2. Write a function

    print_every_other : int -> int list -> unit

that takes a value k and a list of integers as input,
and prints the elements of the list that are in 
positions multiple of k, each on its own line. 
Note: the first element of a list is at the position 0, not 1.

let print_every_other k l =
  "Replace this string with your implementation." ;;
*)
(* print_every_other : int -> int list -> unit *)
let print_every_other k l =
    let loop = List.fold_left 
        (fun acc elem ->
            if acc mod k = 0
                then
                    let num = print_int elem in
                    let nl = print_newline() in
                    let counter = acc + 1 in counter
                else
                    let result = acc + 1 in result    
        )
        0
        l in 
    let final = print_newline() in final
;;



(* 3 Write a function

    print_list : ('a -> unit) -> 'a list -> unit

that takes a printer of values of some type 'a 
and a list of such values as input, 
and prints all the elements of the list, 
each on its own line.


let rec print_list print l =
  "Replace this string with your implementation." ;;
*)
(* print_list : ('a -> unit) -> 'a list -> unit *)
let rec print_list print l = match l with
    | [] -> print_newline()
    | h::r -> let single = print h in
        let nl = print_newline() in
        let result = print_list print r in result;;
