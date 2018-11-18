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

## Sequences & Iterations

## Mutable Arrays

## Mutable Record Fields

## Variables, aka References
