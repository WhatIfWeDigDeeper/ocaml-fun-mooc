let p = [|1;2;3|];;

let square x = x * x;;

let squares n = Array.init n square;;

let s1 = squares 5;;

let s2 = squares 10;;

(* exercises *)



(* 1
    Write a function
    min : int array -> int 
    that returns the minimal element of a.

let rec recursive_min a v = 
    if Array.length a = 0
        then v
    else if Array.length a = 1
        then
            if a.(0) < v
                then a.(0)
            else
                v
    else        
        if a.(0) < v
            then recursive_min (Array.sub a 1 (Array.length a -1)) a.(0)
        else
            recursive_min (Array.sub a 1 (Array.length a - 1)) v;;
*)

type min_data = {
  index: int;
  location: int;
  value: int
};;

let rec recursive_min (a: int array) (data: min_data): min_data = 
    if Array.length a = 0
        then data
    else if Array.length a = 1
        then
            if a.(0) < data.value
                then { index = data.index; location=data.index; value = a.(0) }
            else
                data
    else        
        if a.(0) < data.value
            then recursive_min (Array.sub a 1 (Array.length a -1)) { index = data.index + 1; location=data.index; value = a.(0) }
        else
            recursive_min (Array.sub a 1 (Array.length a - 1)) { index = data.index + 1; location=data.location; value = data.value };;


let min a = (recursive_min a { index=0; location=0;value=100000000}).value;;

(* 2
    Write a function 
    min_index : int array -> int 
    that returns the index of the minimal element of a.
*)
let min_index a = (recursive_min a {index=0; location=0; value=100000000}).location;;


(* SEARCH FOR STRINGS IN ARRAYS *)

(* 1. Write a function
    is_sorted : string array -> bool
    which checks if the values of the input array 
    are sorted in strictly increasing order, 
    implying that its elements are unique (use String.compare).
*)
type sort_data = {
    prev: string;
    index: int;
}

let rec is_recursively_sorted (a: string array) (sortData: sort_data): bool = 
    if (sortData.index > Array.length a -1)
        then true
    else
        let current = Array.get a sortData.index in
        let result = 
            if current < sortData.prev
                then false
            else
                is_recursively_sorted a { prev=current; index= sortData.index + 1 }
            in result;;

let is_sorted (a: string array): bool = 
    if Array.length a <= 1
        then true
    else
        is_recursively_sorted a { prev=Array.get a 0; index=1 };;

is_sorted [|"123";"234";"345"|];;
is_sorted [|"123";"354";"345"|];;

(* 2. 
Using the binary search algorithm, an element can be found very quickly 
in a sorted array. 
Write a function

find : string array -> string -> int

such that find arr word is the index of the word in the sorted array arr 
if it occurs in arr or -1 if word does not occur in arr. 
The number or array accesses will be counted,
to check that you obtain the expected algorithmic complexity.
Beware that you really perform the minimal number of accesses.
For instance, if your function has to test the contents of a cell twice, 
be sure to put the result of the access in a variable,
and then perform the tests on that variable.
*)

type search_data = {
  item: string;
  low: int;
  high: int;
};;


let rec bin_search (arr: string array) (data: search_data) : int = 
    let top = data.high in 
    let mid = data.low + ((top - data.low) / 2) in
    let midWord = 
        if (mid <= (Array.length arr -1))
            then Array.get arr mid
        else
            "" in
    let compareResult =
        if data.low > top
            then -1
        else if midWord = data.item
            then mid
        else
            if data.item > midWord
                then bin_search arr { item=data.item; low=mid+1; high=top } 
            else
                 bin_search arr { item=data.item; low=data.low; high=(mid-1) }
        in compareResult;;


let find dict word = bin_search dict { item=word; low=0; high=((Array.length dict)-1)};;

find [|"123";"234";"345";"456"|] "456";;
find [|"123";"234";"345";"456"|] "457";;
(*0, 3, mid=1 | low=2, high=3, mid=2, low=3,high=3, mid=3; low= *)

find [|"123";"234";"345";"456"|] "123";;