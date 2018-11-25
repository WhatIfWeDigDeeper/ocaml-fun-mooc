(* Reading lines from standard input 
https://www.fun-mooc.fr/courses/course-v1:parisdiderot+56002+session03/courseware/W5/W5S6/
*)

(* 1. Study the code, to understand what is going on,
compare with the example shown in the course, 
and then fix this code.

let read_lines =
  let sl = ref [] in
  let rec aux () =
    try
      sl := read_line () :: !sl ;
      aux ()
    with
      End_of_file -> List.rev !sl in
  fun () -> aux () ;;
*)
(* val read_lines : unit -> string list = <fun> *)
(* let read_lines () =
  let sl = ref [] in
  let rec aux () =
    try
      sl := read_line () :: !sl ;
      aux ()
    with
      End_of_file ->
        (
        temp = List.rev !sl;
        sl = ref [];
        temp; 
        )
  fun () -> aux () ;; *)

let read_lines () =
  let sl = ref [] in
  let rec aux () =
    try
      sl := read_line () :: !sl ;
      aux ()
    with
      End_of_file -> List.rev !sl
  in
  let result = aux() in
  sl := [];
  result;;

