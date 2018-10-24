type exp =
  | EInt of int
  | EAdd of exp * exp
  | EMul of exp * exp

let example =
  EAdd (EInt 1, EMul (EInt 2, EInt 3))

(* 1. Write the expression
    2 * 2 + 3 * 3 
in a variable my_example.
 *)
let my_example = EAdd ((EMul (EInt 2, EInt 2)), (EMul (EInt 3, EInt 3)));;

(* 2. Write a function
    eval : exp -> int
that computes the value of an arithmetic expression. 
The evaluation rules are:
    1. If the expression is an integer x, the evaluation is x.
    2. If the expression is lhs + rhs and lhs evaluates to x
    and rhs evaluates to y, then the evaluation is x + y.
    3. If the expression is lhs * rhs and lhs evaluates to x
    and rhs evaluates to y, then the evaluation is x * y.
 *)
let eval (e: exp): int =
    let rec calc = function
        | EInt x -> x
        | EAdd (x, y) -> (calc x) + calc(y)
        | EMul (x, y) -> (calc x) * calc(y)
    in calc e;;

(* 3. If an expression is of the form
    a * b + a * c then
    a * (b + c) 
is a factorized equivalent expression. 
Write a function
    factorize : exp -> exp
that implements this transformation on its input exp
if it has the shape a * b + a * c 
    or does nothing otherwise.
 *)
let factorize (e: exp): exp = match e with
    | EAdd ((EMul (a, b)), (EMul (a', c))) -> 
        if a = a'
            then (EMul (a, (EAdd (b, c))))
        else e
    | _ -> e;;

(* 4. Write the reverse transformation of factorize,
    expand : exp -> exp
which turns an expression of the shape
    a * (b + c) 
into 
    a * b + a * c.
 *)
let expand (e: exp): exp = match e with
    | EMul (a, (EAdd (b, c))) -> (EAdd ((EMul (a, b)), (EMul (a, c))))
    | _ -> e;;

(* 5. Implement a function
    simplify: exp -> exp
which takes an expression e and:
    1. If e is of the shape e * 0 or 0 * e, returns the expression 0.
    2. If e is of the shape e * 1 or 1 * e, returns the expression e.
    3. If e is of the shape e + 0 or 0 + e, returns the expression e.
    and does nothing otherwise.
 *)
let simplify (e: exp): exp = match e with
    | EMul (_, EInt 0) -> EInt 0
    | EMul (EInt 0, _) -> EInt 0
    | EMul (a, EInt 1) -> a
    | EMul (EInt 1, b) -> b
    | EAdd (a, EInt 0) -> a
    | EAdd (EInt 0, b) -> b
    | _ -> e;;
