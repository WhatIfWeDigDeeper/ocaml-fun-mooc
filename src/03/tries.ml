(* given prelude *)
type trie = Trie of int option * char_to_children
    and char_to_children = (char * trie) list

let empty =
  Trie (None, []);;

let example =
  Trie (None,
	[('i', Trie (Some 11,
                     [('n', Trie (Some 5, [('n', Trie (Some 9, []))]))]));
	 ('t',
	  Trie (None,
		[('e',
		  Trie (None,
			[('n', Trie (Some 12, [])); ('d', Trie (Some 4, []));
			 ('a', Trie (Some 3, []))]));
		 ('o', Trie (Some 7, []))]));
	 ('A', Trie (Some 15, []))]);;

let single = Trie (None, [('c', Trie (Some 15, []))]);;

(* 1. Write a function
    children_from_char : char_to_children -> char -> trie option
such that
    1. children_from_char m c = Some t
        if (c, t) is the first pair in m with c as a first component;
    2. children_from_char m c = None
        if no such pair exists in m.
*)
let rec children_from_char (m: char_to_children) (c: char): trie option = 
    match m with
        | [] -> None
        | (ch, t)::xs ->  
            if ch = c
                then Some t
            else 
                children_from_char xs c;;

(* 2. Write a function
    update_children : char_to_children -> char -> trie -> char_to_children
such that
    1. children_from_char (update_children m c t) c = Some t ;
    2. children_from_char (update_children m c t) c' = children_from_char m c' for c <> c';
    3. If children_from_char m c = Some t
        then List.length (update_children m c t') = List.length m.

go through list of m, and if find c, then update t.
*)
let rec update_children (m: char_to_children) (c: char) (t: trie): char_to_children = match m with
  | [] -> []
  | (ch, t')::xs ->
    if ch = c
        then (c, t) :: xs
    else 
        (ch, t') :: update_children xs c t;;



  (* | (c', Trie (y, [])) :: xs -> 
    if (c' = c)
        then (c, t) :: xs
    else
        (c', Trie (y, [])) :: update_children xs c t
  | (c2, Trie (x, t2)) :: xs ->
      if (c2 = c)
        then (c, t) :: xs
      else
        (c2, Trie (x, t2)) :: update_children t2 c t;; *)

        



(* let rec update_children (m: char_to_children) (c: char) (t: trie): char_to_children = 
    match m with
        | [] -> []
        | (c', empty) -> if (c = c') then (c, t) else (c', empty)
        | (c2, t2) :: xs ->
            if (c2 = c)
                then (c, t) :: xs
            else
                match t2 with
                    | Trie (x, ys) -> (c2, (update_children ys c t)) *)

(*
 char_to_children = [(char, trie)]
 trie (int option, char_to_children)

:: update_children xs c t

let update_children (m: char_to_children) (c: char) (t: trie): char_to_children = 
    let rec process_children_recursive (lc: char_to_children): char_to_children = match lc with
        | [] -> []
        | (c', t')::xs ->
            if (c' = c)
                then (c, t) :: xs
            else
                (c', t') :: process_children_recursive xs
    in process_children_recursive m;; *)


(* 3 Write a function
    lookup : trie -> string -> int option
such that lookup trie w = Some i
if i is the value of the key w in trie 
    and lookup trie w = None 
if w is not a key of trie. 
To look for a key in a trie, iterate over the characters of the key from left to right. 
Given the current character c and the current node of the trie n,
look for the children n for character c. 
If such a children exists, continue with that trie 
    and the remainder of the key. 
If no such children exists, the key is not in the trie. 
When the characters of the key are entirely consumed, 
    look at the root of the current trie. 
If there is an integer, this is the value you are looking for. 
If there is no integer, the key not in the trie.
*)

let rec search_trie (trie: trie) (c: char):  match trie with
    | [] -> []
    | (x, children) -> 

let rec children_from_char (m: char_to_children) (c: char): trie option = 
    match m with
        | [] -> None
        | (ch, t)::xs ->  
            if ch = c
                then Some t
            else 
                children_from_char xs c;;


let lookup (trie: trie) (w: string) = match w with
    | [] -> []
    | c::cs -> 


(* 4. Write a function
    insert : trie -> string -> int -> trie
such that lookup (insert trie w k) w = Some k 
    and lookup (insert trie w k) w' = lookup trie w' for w <> w'.
*)
let insert trie w v =
  "Replace this string with your implementation." ;;