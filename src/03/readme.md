# Module 3 Algebraic Data Types

## 1. Tagged Values

### sum type: disjoint union of types

```ocaml
type query_result =
| Error
| NewDatabase of database
| FoundContact of contact * int

(* form *)
type some_type_identifier =
| SomeTag of some_type
| TagInPascalCase of some_type
| DistinctTag of some_type
```

### tags

- Tags are also called constructors
- uses as marker or label for different cases of the union
- several cases are possible and must provide an expression for each case
- a case `SomeTag (some_expression, some_expression)`
- a branch `some_pattern -> some_expression`
- pattern matching

```ocaml
let f x = match x with
    | some_pattern -> some_expression
    | some_pattern -> some_expression

let engine db query = match query with
    | Insert contact -> insert db contact
    | Delete contact -> delete db contact
    | Search name -> search db name;;

(* syntactic sugar *)
let f = function
    | some_pattern -> some_expression
    | some_pattern -> some_expression

let engine db query = function
    | Insert contact -> insert db contact
    | Delete contact -> delete db contact
    | Search name -> search db name;;
```

Pattern matching performs a dynamic test on the tag

- a tag if constructor with no argument, `None` below,
- a heap-allocated block starting with a tag, `Single` one argument, `Pair` two arguments below.

```ocaml
type data = None | Single of int | Pair of int * int;;
```

## 2. Recursive Types

a list is either

- an empty list
- a head and the rest of the list
- stored as linked list [SomeElementTag|value|pointerToNextItem->][someelemtag|value|emptylist]

`i::r`

## 3. Tree-like values

```ocaml
type database =
    | NoContact
    | DataNode of database * contact * database;;

let search db name =
    let rec traverse = function
        | NoContact -> Error
        | DataNode (left, contact, right) ->
            if contact.name = name
                then FoundContact contact
            else if name < contact.name
                then traverse left
            else
                traverse right
        in
        traverse db;;

let insert db contact =
    let rec traverse t = match t with
        | NoContact -> DataNode (NoContact, contact, NoContact)
        | DataNode (left, contact', right) ->
            if contact.name = contact'.name
                then t
            else if contact.name < contact'.name
                then DataNode (traverse left, contact', right)
            else
                DataNode (left, contact', traverse right)
    in
    NewDatabase (traverse db);;
```

- shares nodes on insertion, like immutable data

## 4. case study

"The right type declarations helps implement the right program."

type-directed

```ocaml
let rec all_characters_are states = function
    | [] -> true
    | character :: cs -> is_one_of character.state states && all_characters_are states cs
;;

(* can be replaced with higher order function *)
let all_characters_are states = List.for_all (is_one_of states);;
```

## 5. Polymorphic algebraic datatypes

- List only contains **polymorphic functions**
- maximizes code reuse

```ocaml
type 'a option =
    | None
    | Some of 'a;;

let o1 = Some 42;;

let o2 = None;;
```

type parameters are represented with `'a`

to instantiate, _(some_type, ... some_type ) some_type_identifier_

## 6. Advanced topics

SNIPPETS FOR OCAML
SNIPPETS FOR ALGORITHMS in cs
