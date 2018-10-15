## Types as documentation

day = {0,1,2,3,4,5,6}

```ocaml
(* must pass a valid day *)
is_weekend : day -> bool
```

## Tuples

```ocaml
type point 2D = int * int;

let origin: point2D = (0, 0);
```

### Pattern matching

Identify a pattern
`let x = 6 * 3 in x` can be read as "I observe the value of 6 multiplied by 3 by naming it 'x'"

`let (x, _) = (6 * 3, 2) in x`
"I observe the first component of this tuple (6\*3,2) by naming it 'x'"

### Equality

`=` is structural equality
`==` physical equality, pointing to same location in memory

## Records

## Arrays

- single type
- Heap allocated block.
- not very convenient for pattern matching

```ocaml
let p = [|1;2;3|];;
let size = 10;;
let val = 4;;
(* make array of size with initial value *)
Array.make size val;;

(* init array with fn *)
let ary = Array.init size fn;;

Array.length ary;;

(* index into array *)
ary.(0);;
```
