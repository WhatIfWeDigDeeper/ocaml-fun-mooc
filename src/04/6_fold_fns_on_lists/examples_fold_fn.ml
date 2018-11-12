(* foldright.ml *)
let rec fold_right f l b = match l with
  | [] -> b
  | h::r -> f h (fold_right f r b);;

(* returns same list *)
fold_right (fun x y -> x::y) [1;2;3;4] [];;

fold_right (+) [1;2;3;4] 0;;

fold_right ( * ) [1;2;3;4] 1;;

let concat = fold_right (fun x y -> x::y);;

concat [1;2;3;4] [5;6;7;8];;

(* foldleft *)
(* defined in library as List.fold_left *)
let rec fold_left f b = function
  | [] -> b
  | h::r -> fold_left f (f b h) r;;

fold_left (+) 0 [1;2;3;4];;

let reverse = fold_left (fun x y -> y::x) [];;

reverse [1;2;3;4;5];;

(* innerproduct.ml *)
(* inner product of vectors *)
(* product [a1,a2,a3] [b1,b2,b3] = a1*b1 + a2*b2 + a3*b3 *)
let product v1 v2 =
  List.fold_left (+) 0 (List.map2 ( * ) v1 v2);;

product [2;4;6] [1;3;5];;

(* counting.ml *)
(* count elements of l satisfying p *)
let countif p l = List.fold_left
  (fun counter element -> 
    if p element then counter+1 else counter)
  0
  l
;;

countif (function x -> x>0) [3;-17;42;-73;-256];;

(* can't use fold_right *)
let countif' p l = List.fold_right
  (fun counter element -> 
    if p element then counter+1 else counter)
  l
  0
;;

countif' (function x -> x>0) [3;-17;42;-73;-256];;
(* gives wrong value *)
3