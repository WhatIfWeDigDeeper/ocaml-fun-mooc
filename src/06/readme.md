# Modules

- an abstraction is a concept that can be understood instrinsically, without precise knowledge of its implementation
- good architectures are made out of layers of abstractions


## Structuring software with modules

Modules as a namespace, `List.length` or `open List` then can use just `length`

To define a module:

```ocaml
module SomeModuleIdentifier =
struct
    (* a series of definitions *)
end
```

- modules can be aliased if needed, `module SomeModuleId = SomeOtherModuleId`
- modules can contain other modules, referenced as A.B if module B is contained within module A.
- type of a module is called a **signature** or **interface**
- developer should force a specific signature (interface contract)

### Signature

```ocaml
sig
    (* sequence of declarations of the form *)
    val some_id : some_type
    type some_type_id = some_type_definition
    exception SomeException of some_type
end
```

## Information hiding

## Case study: a module for dictionaries

## Functors

## Modules as compilation units

