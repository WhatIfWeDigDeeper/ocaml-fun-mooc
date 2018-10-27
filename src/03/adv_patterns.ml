type e = EInt of int | EMul of e * e | EAdd of e * e;;

(* 1. Factorize the pattern matching of function
    simplify using or-patterns.
It should boil down to three cases.

let simplify = function
  | EMul (EInt 1, e) -> e
  | EMul (e, EInt 1) -> e
  | EMul (EInt 0, e) -> EInt 0
  | EMul (e, EInt 0) -> EInt 0
  | EAdd (EInt 0, e) -> e
  | EAdd (e, EInt 0) -> e
  | e -> e

*)
let simplify = function
  | EMul (EInt 0, e) | EMul (e, EInt 0) -> EInt 0
  | EMul (EInt 1, e) | EMul (e, EInt 1) | EAdd (EInt 0, e) | EAdd (e, EInt 0)
  | e -> e
  
(* 2. The only_small_lists function
takes a list as input and returns this list
only if it contains two or less elements, 
otherwise the empty list is returned. 
Rewrite this function using or-patterns and an as-pattern.
It should boil down to two cases.

let only_small_lists = function
  | [] -> []
  | [x] -> [x]
  | [x;y] -> [x;y]
  | _ -> []

*)
let only_small_lists = function
  | ([x] | [x;_]) as two_or_less -> two_or_less
  | ([] | _) -> []
;;

(* 3. Turn the third case of
    no_consecutive_repetition
into two distinct cases,
dropping the if construct in favor of a when clause.

let rec no_consecutive_repetition = function
  | [] -> []
  | [x] -> [x]
  | x :: y :: ys ->
      if x = y then
        no_consecutive_repetition (y :: ys)
      else
        x :: (no_consecutive_repetition (y :: ys))
*)
let rec no_consecutive_repetition = function
  | [] -> []
  | [x] -> [x]
  | x :: y :: ys  when x = y -> no_consecutive_repetition (y :: ys)
  | x :: y :: ys -> x :: (no_consecutive_repetition (y :: ys))