(* color is a synonym *)
(* type NAME = other-type *)
type color = int;;

let red : color = 0;;
let white : color = 1;;
let blue : color = 2;;

type positive = int;;

(* be careful *)
(* ok by type checker, positive is synonym for int*)
let semantic_err_not_caught: positive = -1;; 

let abs' (x: int) : positive = if (x < 0) then (-x) else x;;

(* FORM *)
(* let f (x : some-type): some-type = some-expression *)
(* wrap expression with parens *)
(* let f x = ( some-expression: some-type )  *)