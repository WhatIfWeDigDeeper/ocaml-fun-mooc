(* 1.
Write a function
    find : string array -> string -> int option
such that find a w = Some idx if a.(idx) = w and find a w = None 
if there is no such index.
*)


let find (a:string array) (w: string): int option =
    let rec recursive_find (a: string array) (idx: int): int option =
        if idx >= Array.length a
            then None
        else
            if (Array.get a idx) = w
                then Some idx
            else
                recursive_find a (idx + 1) in
    let result = recursive_find a 0 in result;;

(* 2.
Sometimes, when a value of type t is missing, a default value should be used. 
Write a function
    default_int : int option -> int
such that: default_int None = 0 and default_int (Some x) = x.
*)
let default_int (value: int option): int = match value with
    | None -> 0
    | Some x -> x;;

(* 3.
Write a function
    merge : int option -> int option -> int option
such that:
    merge None None = None
    merge (Some x) None = merge None (Some x) = Some x
    merge (Some x) (Some y) = Some (x + y)
*)
let merge (a: int option) (b: int option): int option = match a, b with
    | None, None -> None
    | Some x, None -> Some x
    | None, Some y -> Some y
    | Some x, Some y -> Some (x + y);;
