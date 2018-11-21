# Imperative Features

## Getting & Handling Exceptions

- exceptions are constructors of a special sum type `exn`
- can define new exceptions
- can extend
- exceptions cannot be polymorphic
- raise stops computation immediately
- very efficient, unlike other languages

```ocaml
exception E
raise E;;

try

with
    | e1 -> exp1
    | e2 -> exp2
```

## Getting Information In & Out

typical input or result of function with side effects is the `unit` type

```ocaml
();;
- : unit = ()

print_int 12345;;
12345- : unit = ()

read_line;;
- : unit -> string = <fun>

(* waits for user input and press enter on standard input *)
read_line();;
test
- : string = "test"
```

`read_line()` or `read_line ()` is a function that takes one argument of the unit type.

Other functions
```ocaml
print_char
print_string
print_float
print_newline



## Sequences & Iterations

## Mutable Arrays

## Mutable Record Fields

## Variables, aka References
