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
```

## Sequences & Iterations

### Sequences

```ocaml
let _ = print_int 1 in let _ = print_int 2 in print_int 3;;

(* more concise all types unit, returns last expr *)
print_int 1; print_int 2; print_int 3;;

if x>5 then
    begin
        print_int 1;
        print_int 2;
    end;;
```

### iterations

print all integers from 1 to 10

### recursive

```ocaml
(* recursive *)
let foreach start_i end_i f =
    let rec aux =
        function n -> if n <= end_i
                      then (f n; aux (n+1))
                      else ()
    in aux start_i;;

foreach 1 10 (fun i -> print_int i);;
```

### for loops

```ocaml
(* more concise
  - can't modify i, can't exit
  - type of for loop is unit
  - type of loop body is unit
*)
for i=1 to 10 do
    print_int i
done;;

(* can also go backwards *)
for i=10 downto 1 do
    print i
done;;
```

### while loops

```ocaml
while condition do
    expression_of_unit
done;;
```

To avoid warnings of not returning unit type can use `ignore;;`

## Mutable Arrays

use the "update" `<-` operator

```ocaml
(* result type is unit *)
a.(0) <- 100;;
```


## Mutable Record Fields

## Variables, aka References

```

```
