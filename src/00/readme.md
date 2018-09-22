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
# combine expressions with other constructs
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
