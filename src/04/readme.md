# Higher Order Functions

## Functional Expressions

- `function idParameter -> expression`
- type `t1 -> t2`
- `let f x = e` is abbreviation for `let f = function x -> e`
- `let` uniform way of defining an identifier
- general form

```ocaml
function | pattern1 -> expression1 | patternN -> expressionN
```

`function x -> exp` is just a special case with one pattern

## Functions as First-Class Values

- functions are just values
- part of structured data
- funcs associate to the left

## Functions with Multiple Arguments

## Partial Function Application

```ocaml
let f1 = fun x y -> expr
```

is the same as

```ocaml
let f2 = function x -> (function y -> expr)
```

## Mapping Functions on Lists

```ocaml
let rec mappy f l = function
    | [] -> []
    | head::rest -> (f head)::(mappy f rest)
;;
```

turn operator into a function by writing it as `(+) a b`

Multiplication is a special case as we have to disambiguate between the start of a comment, so need to surround with spaces `( * )`

## Folding Functions on Lists

- mapping a unary function over a list, each element in isolation (can be parallelized - map reduce)
- folding combines all elements of a list using a binary operator

### fold right

starting at left or beginning of list and moving right

`List.fold_right: ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b`

`List.fold_right f [a1; a2; ..] acc`

natural order of list f applied to a1, f applied to a2...

- fn can be applied to empty list so `acc` gives opportunity to specify default.
- Give starting value: multiply 1, Sum 0
- Can implement a concat operation by specify another list as the start

```ocaml
let rec fold_right f l b = match l with
  | [] -> b
  | h::r -> f h (fold_right f r b);;

fold_right (+) [1;2;3;4] 0;;
-- 0 + 1 + 2 + 3 + 4 = 10

fold_right ( * ) [1;2;3;4] 1;;
-- 1 * 1 * 2 * 3 * 4 = 24
```

### Fold Left

List.fold_left: ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a

### comparisons

`fold_left` seems to be more useful since last argument is a list so can create curried function that takes list so can be pipelined

```ocaml
fold_right f l acc
fold_right (+) [1;2;3;4] 0;;

fold_left f acc l
fold_left (+) 0 [1;2;3;4];;

(* fold_left can reverse concatenate lists *)
List.fold_left (fun x y -> y::x) [] [1;2;3;4;5];;
[5;4;3;2;1]

(* fold_right can not as it would give type error *)

List.fold_right (fun x y -> y::x) [1;2;3;4] [];;
(* or simplified *)
> []::1;;
Error: This expression has type int but an expression was expected of type 'a
```

```ocaml

let rec fold_right f l acc = match l with
  | [] -> acc
  | h::r -> f h (fold_right f r acc);;

(* unwind recursion, accumulator used at end or start of unwind *)
fold_right (+) [1;2;3;4] 0;;
-- fold_right (+) 1 (fold_right (+) [2;3;4] 0) // h=1, acc=0 -- (+) 1 (fold_right (+) [2;3;4] 0)
-- fold_right (+) 2 (fold_right (+) [3;4] 0)   // h=2, acc=0 -- (+) 2 (fold_right (+) [3;4] 0)
-- fold_right (+) 3 (fold_right (+) [4] 0)     // h=3, acc=0 -- (+) 3 (fold_right (+) [4] 0)
-- fold_right (+) 4 (fold_right (+) [] 0)      // h=4, acc=0 -- (+) 4 (fold_right (+) [] 0)
-- unwinds to
-- 0
-- + 4 0
-- + 3 4
-- + 2 7
-- + 1 9
-- 10

let rec fold_left f acc = function
  | [] -> acc
  | h::r -> fold_left f (f acc h) r;;

(* accumulates as it goes - tail recursion *)
fold_left (+) 0 [1;2;3;4];;
-- fold_left (+) (+ 0 1) [2;3;4] // acc=0, h=1 -- fold_left (+) 1 [2;3;4]
-- fold_left (+) (+ 1 2) [3;4]   // acc=1, h=2 -- fold_left (+) 3 [3;4]
-- fold_left (+) (+ 3 3) [4]     // acc=3, h=3 -- fold_left (+) 6 [4]
-- fold_left (+) (+ 6 4) []      // acc=6, h=4 -- fold_left (+) 10 []
-- [] -> 10                    // acc=10, h=[] -- 10

```
