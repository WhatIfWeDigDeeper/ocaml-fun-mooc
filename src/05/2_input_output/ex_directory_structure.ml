type filesystem =
  (string * node) list
and node =
  | File
  | Dir of filesystem
  | Symlink of string list

(* 1. Write a function

    print_path: string list -> unit
    
that prints a relative path (the argument of a Symlink) 
and pretty prints it as shown in the example display, 
using slashes ('/') as separator.

let rec print_path path =
  "Replace this string with your implementation." ;;
*)
(* print_path: string list -> unit *)
let rec print_path path = match path with
    | [] -> print_newline()
    | [x] -> let last = print_string x in last
    | h::r -> 
        let exec = print_string h in
        let slash = print_char '/' in
        let result = print_path r in result
;;

(* 2. As you can see in the example, 
the depth of a file in the filesystem 
(the number of nested folders that are its ancestors) 
is represented by a sequence of vertical lines. 
Write a function

    print_file: int -> string -> unit
    
that prints a file name, with the given number of "| " in front of it.

let rec print_file lvl name =
  "Replace this string with your implementation." ;;
*)
(* print_file: int -> string -> unit *)
let rec print_delim lvl delim =
    if lvl <= 0
        then let ending = print_string "" in ending
    else
        let d = print_string delim in
        let result = print_delim (lvl -1) delim in result
;;

let rec print_file lvl name = 
    let delims = print_delim lvl "| " in
    let result = print_string name in result;;

(* 3. Write a similar function

    print_symlink: int -> string -> string list -> unit
    
that prints the link name,
with the given number of "| " in front of it, 
and the relative path (preceded by an arrow " -> ").

let rec print_symlink lvl name path =
  "Replace this string with your implementation." ;;
*)
(* print_symlink: int -> string -> string list -> unit *)
let print_symlink lvl name path = 
    let f = print_file lvl name in
    let arrow = print_string " -> " in
    let result = print_path path in result
;;

(* 4. Write a similar function

    print_dir: int -> string -> unit

that prints the dir name,
with the given number of "| " in front of it, 
and the prepended '/'.

let rec print_dir lvl name =
  "Replace this string with your implementation." ;;
*)
let print_dir lvl name =
    let delims = print_delim lvl "| " in
    let slash = print_char '/' in
    let result = print_string name in result
;;

(* 5. Write a function 

    print_filesystem: filesystem -> unit
    
that traverses the filesystem,
producing the same display as in the example. 
You will probably need an auxiliary, recursive function, 
and you will have to use the previous answers.

let print_filesystem root =
  (* This pre-completed structure is only here to help you.
     If it confuses you, don't hesitate to change it. *)
  let rec print_filesystem lvl items =
    "Replace this string with your implementation." in
  print_filesystem 0 root ;;
*)
(* print_filesystem: filesystem -> unit *)
let print_filesystem root =
  let rec print_filesys lvl items = match items with
    | [] -> print_newline()
    | (name, nd)::r -> match nd with
        | File ->
            let pf = print_file lvl name in
            let fnl = print_newline() in
            let fresult = print_filesys lvl r in fresult
        | Dir dir ->
            let pd = print_dir lvl name in
            let dnl = print_newline() in
            let dnoderec = print_filesys (lvl+1) dir in
            let dresult = print_filesys lvl r in dresult
        | Symlink syms ->
            let ps = print_symlink lvl name syms in
            let snl = print_newline() in
            let sresult = print_filesys lvl r in sresult
    in 
  print_filesys 0 root ;;


(* 6. Write a function

    resolve: string list -> string list -> string list
    
It takes as parameters:
  1. The full path from the root to a symlink, 
    including its name. In the given example, 
    that could be for instance
    [ "indexes" ; "photos_april.html" ].
  2. The relative path for this symlink. Here, that would be
  [ ".." ; "photos" ; "april" ; "index.html" ].

The function returns the full path from the root
to the target of the symlink. Here, we should get
    [ "photos" ; "april" ; "index.html" ].
Note that it may not be as easy as it seems, 
so you may think about it before plunging into the code.

let rec resolve sym path =
  (* This pre-completed structure is only here to help you.
     If it confuses you, don't hesitate to change it. *)
  let rec resolve acc path =
    "Replace this string with your implementation."  in
  resolve (List.tl (List.rev sym)) path ;;
*)
(* resolve: string list -> string list -> string list *)
let rec resolve (sym: string list) (path: string list): string list =
  let rec res (acc:string list) (path: string list) = match path with
    | [] -> acc
    | h::r when h = ".." -> res acc r
    | h::r -> [h]@(res (acc) r)
  in
  res (List.tl (List.rev sym)) path ;;
(* [ "indexes" ; "photos_april.html" ] 
   [ "photos_april.html"; "indexes" ;  ]
   res [ "indexes" ] [ ".." ; "photos" ; "april" ; "index.html" ]
*)


(* 7. Write a function
    
    file_exists : filesystem -> string list -> bool
    
that tells if a file exists in the filesystem.
The path is the full absolute path to the file,
and the target must be a File, not a Dir or a Symlink.

let rec file_exists root path =
  "Replace this string with your implementation." ;;
*)
(* file_exists : filesystem -> string list -> bool *)
let rec file_exists (root: filesystem) (path: string list): bool = fasel;;
  

(* 8. Update your function

    print_filesystem: filesystem -> unit

so that it replaces the printed relative path
by "INVALID" when the symlink cannot be resolved to an existing file.
*)
(* move print_filesystem here for exercise 8 *)