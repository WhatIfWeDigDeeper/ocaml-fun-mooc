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
