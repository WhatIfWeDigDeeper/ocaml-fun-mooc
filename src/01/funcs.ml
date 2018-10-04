let multiple_of n d = if (n > 0) then (d mod n = 0) else false;;

let mof n d = 

if (n = 0) then false else (d mod n = 0);;


let integer_square_root n = int_of_float(sqrt (float_of_int n));;


(* is n a multiple of d? n * x = d *)
(*   4   2  true  *)
(*  13   2  false *)
(*  -1   1  true  *)
(*   0  -2  true  *)
(*   1   0  false *)
(*  -3  -3  true  *)
let mof n d =
    if (n = 0) then false
    else if (d = 0) then true
    else if (n = 0 && d = 0) then false
    else if (n = d) then true
    else if (n < 0 && d < 0) then d mod n = 0
    else if (n < 0) then (abs n) mod (abs d)
    else (abs d) mod (abs n);;

let last_character str = String.get str ((String.length str)-1)

let string_of_bool truth = if (truth) then "true" else "false"

let rec factorial n = match n with
    | 1 -> 1
    | _ -> n * factorial (n - 1)

let rec even x = if (x = 0) then true else odd(x -1)
  and odd y = if (y=0) then false else even(y - 1)

(* is n a multiple of d? n * x = d *)
(* (-1) 1 = true *)
(* 4 2 = true *)
(* 4 -8 = (4*-2)true *)
(* 0 (-2) = true *)
(* 10 15 30, 10x = 15y *)
let mof n d = match n, d with
    | _, 0 -> true
    | 0, _ -> false
    | n, d -> if (n < 0) then d mod (n*(-1)) = 0 else d mod n = 0;;


let multiple_of n d =
  if (n = 0) then true
  else if (d = 0) then false
  else if (n = 0 && d = 0) then false
  else if (n = d) then true
  else if (abs n) > (abs d) then (abs n) mod (abs d) = 0
  else (abs d) mod (abs n) = 0;;


(* final *)
let multiple_of n d =
  if (n = 0) then true
  else if (d = 0) then false
  else ((abs n) mod (abs d)) = 0;;
  