type operation =
    Op of string * operation * operation
  | Value of int;;

type env = (string * (int -> int -> int)) list;;

let initial_env = [
  ("add", fun x y -> x + y);
  ("sub", fun x y -> x - y);
  ("mul", fun x y -> x * y);
  ("div", fun x y -> x / y)]
;;

(* 1.
let rec lookup_function n = function _->
  "Replace this string with your implementation"
*)
let rec lookup_function (n:string) = function
  | [] -> invalid_arg "lookup_function"
  | [(n1, f)] when n = n1 -> f
  | (n2, f1)::xs -> if n = n2 then f1 else lookup_function n xs
;;

(* 2.
Another useful feature would be to add 
functions to a given environment.
Write the function
    add_function : string -> (int -> int -> int) -> env -> env 
that takes an environment e,
a name for the function n
and a function f, 
and returns a new environment
that contains the function f that is associated to the name n. 
let add_function name op env =
  "Replace this string with your implementation"
*)
let add_function name op env = (name, op) :: env;;

(* 3. Create a variable
  my_env: env
that is the initial environment plus a function associated to the name "min" 
that takes two numbers and returns the lowest. 
You cannot use the already defined Pervasives.min function, 
nor any let .. in. 
Take advantage of lambda expressions!
*)
let my_env = add_function "min" (fun x y -> if x < y then x else y) initial_env;;

(* 4. Now that we have correctly defined the operations to use the environment, 
we can write the function that computes an operation. 
Write a function
  compute: env -> operation -> int
that takes an environment and an operation description, and computes this operation. The result is either:
  Directly the value.
  An operation that takes two computed values and a function from the environment.
*)
let rec compute (env: env) (op: operation): int = match op with
  | Value v -> v
  | Op (n, op1, op2) -> (lookup_function n env) (compute env op1) (compute env op2)
;;

(* 5. Let's be a bit more efficient 
and use the over-application: suppose a function id: 'a -> 'a, 
then id id will also have type 'a -> 'a, 
since the 'a is instantiated with 'a -> 'a . 
Using that principle, we can apply id to itself infinitely 
since it will always return a function. 
Write a function 

  compute_eff : env -> operation -> int
  
that takes an environment and an operation, and computes it. 
However, you cannot use let inside the function!

let rec compute_eff env = function _ ->
  "Replace this string with your implementation"
*)
let rec compute_eff (env: env) (op: operation): int = match op with
  | Value v -> v
  | Op (n, op1, op2) -> 
    if op1 = op2
      then
        (fun lf x -> lf x x) (lookup_function n env) (compute_eff env op1)
      else
        (lookup_function n env) (compute_eff env op1) (compute_eff env op2)
;;
