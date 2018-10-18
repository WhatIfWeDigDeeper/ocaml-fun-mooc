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

## 3. Tree-like values

## 4. cast study

## 5. Polymorphic algebraic datatypes

## 6. Advanced topics
