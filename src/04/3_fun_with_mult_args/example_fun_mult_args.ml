(* return.ml *)
let f1 = function n -> (function x -> n+x);;

(f1 17) 73;;

f1 17 73;;

let f2 = fun n x -> n+x;;

f2 17 73;;

(f2 17) 73;;

(* eval.ml *)
type expr =
  | Var of string
  | Add of expr * expr;;

let rec eval = fun environment expr -> match expr with
  | Var x -> List.assoc x environment
  | Add(e1,e2) -> (eval environment e1)
                     + (eval environment e2);;

eval [("x",2); ("y",5)]
  (Add (Var "x", Add (Var "x", Var "y")));;

let rec eval =
  function environment -> 
    function expr -> match expr with
      | Var x -> List.assoc x environment
      | Add(e1,e2) -> (eval environment e1)
                          + (eval environment e2);;

eval [("x",2); ("y",5)]
  (Add (Var "x", Add (Var "x", Var "y")));;

let rec eval = function environment -> function
  | Var x -> List.assoc x environment
  | Add(e1,e2) -> (eval environment e1)
                     + (eval environment e2);;

eval [("x",2); ("y",5)]
  (Add (Var "x", Add (Var "x", Var "y")));;

let rec eval environment = function
  | Var x -> List.assoc x environment
  | Add(e1,e2) -> (eval environment e1)
                     + (eval environment e2);;

eval [("x",2); ("y",5)]
  (Add (Var "x", Add (Var "x", Var "y")));;