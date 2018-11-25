(* refs.ml 
https://www.fun-mooc.fr/asset-v1:parisdiderot+56002+session03+type@asset+block/refs.ml
*)
let i = ref 0;;

i;;

i := !i + 1;;

i;;

(* log2int.ml
https://www.fun-mooc.fr/asset-v1:parisdiderot+56002+session03+type@asset+block/log2int.ml
*)
let log2int n = 
  let count = ref 0 and v = ref n in 
  while !v > 1 do
    count := !count + 1;
    v := !v/2
  done;
  !count;;

log2int 16;;
log2int 1024;;
log2int 1000000;;

(* readIntList.ml
https://www.fun-mooc.fr/asset-v1:parisdiderot+56002+session03+type@asset+block/read_intlist.ml
*)
(* hide *)
let read_int () = int_of_string (read_line())
;;
(* show *)

(* read a list of integers, and stop *)
(* when a non integer is entered     *)

(* read_intlist : unit -> int list  *)
let read_intlist (): int list =
  (* a reference to hold the results *)
  let l = ref [] in
  (* the reading loop *)
  let doread() =
   try
    while true do
      l := (read_int ()):: !l
    done
   with _ -> ()
  in
    doread();
    List.rev !l
;;