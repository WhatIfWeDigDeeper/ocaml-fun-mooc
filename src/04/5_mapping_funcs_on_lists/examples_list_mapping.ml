(* map.ml *)

(* defined in library as List.map *)
let rec map f = function
  | [] -> []
  | h::r -> (f h)::(map f r);;

map (function x -> x*x) [1;2;3;4;5];;

(* map2.ml *)
(* defined in library as List.map2 *)
let rec map2 f l1 l2 = match (l1,l2) with
  | [],[] -> []
  | h1::r1,h2::r2 -> (f h1 h2)::(map2 f r1 r2)
  | _ -> raise (Invalid_argument "List.map2");;

map2 (fun x y -> x+y) [1;2;3] [10;20;30];;

(* vectorsum.ml *)
let vsum = List.map2 (+);;

vsum [1;2;3] [10;20;30];;

(* matrixsum.ml *)
let msum = List.map2 (List.map2 (+));;

msum [ [1;2]; [3;4]] [[10;20]; [30;40]];;


(* powerset.ml *)
let rec sublists = function
  | [] -> [ [] ]
  | h::r ->
      let rp = sublists r in 
	rp@(List.map (function l -> h::l) rp);;
      
sublists [1;2;3];;