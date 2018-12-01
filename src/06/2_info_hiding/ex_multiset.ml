(* multiset 
A multiset is like a set, with the difference that a value 
can appear more than once.
*)
module type MultiSet_S = sig

  (* A multi-set of type ['a t] is a collection of values of
     type ['a] that may occur several times. *)
  type 'a t

  (* [occurrences s x] return the number of time [x] occurs
     in [s]. *)
  val occurrences : 'a t -> 'a -> int

  (* The empty set has no element. There is only one unique
     representation of the empty set. *)
  val empty : 'a t

  (* [insert s x] returns a new multi-set that contains all
     elements of [s] and a new occurrence of [x]. Typically,
     [occurrences s x = occurrences (insert s x) x + 1]. *)
  val insert : 'a t -> 'a -> 'a t

  (* [remove s x] returns a new multi-set that contains all elements
     of [s] minus an occurrence of [x] 
     (if [x] actually occurs in [s]). Typically, 
     [occurrences s x = occurrences (remove s x) x -1]
     if [occurrences s x > 0]. 
   *)
  val remove : 'a t -> 'a -> 'a t

end;;

(* 1. Implement a module MultiSet that implements the signature MultiSet_S.

module MultiSet = struct
  (* your implementation. *)
end ;;
*)
module MultiSet : MultiSet_S = struct
   type 'a t = 'a list
   let occurrences (xs: 'a t) (x: 'a): int = 0;;
   let empty = [];;
   let insert (xs: 'a t) (x: 'a): 'a t = xs;;
   let remove (xs: 'a t) (x: 'a): 'a t = xs;;
end ;;


(* 2. Define a function

    letters: string -> char MultiSet.t 
    
(where MultiSet is the module defined in the previous question). 
This function produces a multiset in which all characters are associated 
to the times they appear in the input string.

let letters word = "your implementation." ;;
*)


(* 3. Define a function

    anagram: string -> string -> bool
    
that uses the previous function to tell if two words have the same multiset of characters.

let anagram word1 word2 =
  "your implementation." ;;
*)
