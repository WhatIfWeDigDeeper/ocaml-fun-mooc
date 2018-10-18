type index = Index of int

(* 
1. Write a function
    read : int array -> index -> int 
such that read a (Index k) returns the k-th element of a. 

# read [|1;2;3;4|] (Index 2);;
  - : int = 3
*)
let read (a: int array) (i: index): int = match i with
    | Index i -> Array.get a i;;

(* 
2. Write a function 
    inside : int array -> index -> bool 
such that inside a idx is true if and only if idx is a valid index for the array a.
*)
let inside (a: int array) (i: index): bool = match i with
    | Index i -> (i >= 0 && i <= (Array.length a -1));;

(* 3. 
Write a function
    next : index -> index
such that next (Index k) is equal to Index (k + 1).
*)
let next (index): index = match index with
    | Index index -> Index (index + 1);;

type min_data = {
  current_index: index;
  min_location: index;
  min_value: int
};;

(* 4. 
Consider a non empty array of integers a, write a function
    min_index : int array -> index
that returns the index of the minimal element of a.
*)
let rec find_min (a: int array) (acc: min_data): index = 
        if  not (inside a (acc.current_index))
            then (acc.min_location)
        else
            let current_value = read a (acc.current_index) in
            let result =
                if current_value < acc.min_value
                    then find_min a {
                            min_location = acc.current_index;
                            min_value = current_value;
                            current_index = (next acc.current_index)
                        }
                else
                    find_min a {
                        min_location = acc.min_location;
                        min_value= acc.min_value;
                        current_index=(next acc.current_index)
                    } in result;;


let min_index (a: int array): index = 
    find_min a {
        current_index = Index 0;
        min_location = Index 0;
        min_value = 1000000000
    };;
