# Data Types

### strings

^ = concat strings

```ocaml
"hello" ^ ", " ^ "world";;

String.length "test";;
String.get "test" 1;;
int_of_string "3";;
float_of_string "3.5";;
```

## Expressions

```ocaml
(* combine expressions with other constructs *)
(if 6=3+3 then 3<4 else 8>7) && 68.8 > 33.1;;
```

### Currying

```ocaml
let alphabet_position = String.get "abcdefghijklmnopqrstuvwxyz";;
alphabet_position 0;;
- : char = 'a'
alphabet_position 25;;
- : char = 'z'
```

```polymorphic

```

### Definitions

may redefine global definition, but original still reachable.

```ocaml
(* local *)
let x = 4+5 in 2*x;;

let x = 2*10 in x;

(* simultaneous definitions *)
let x1 = 10 and y = x+1 in x*y;;
val x1 : int = 10
val x2 : int = 100

(* sequential definitions *)
let x = 2 in
  let y = x+1 in x*y;;
```

### Functions

**Lexical scoping** uses identifier visible at the moment of function definition

**Dynamic scoping** uses identifier visible at the moment of function invocation

```ocaml
let increment x = x+1;;

let increment_twice x = increment (increment x);;
```
