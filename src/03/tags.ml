type contact = {
    name: string;
    phone_number: int * int * int * int
};;

type query = 
 | Insert of contact
 | Delete of contact
 | Search of string;;

let luke = { name = "Luke"; phone_number = (1,2,3,4)}

let q1 = Insert luke;;

let q2 = Search "Luke";;

let q3 = Delete luke;;

type color = Black | Gray | White;;

let batman_color = Black;;

(* Black < Gray < White 
   Is c2 lighter than c1?
*)
let lighter c1 c2 = match (c1, c2) with
    | (Black, Black) -> false
    | (White, White) -> false
    | (Gray, Gray) -> false
    | (Black, _) -> true
    | (_, White) -> true
    | (White, Black) -> false
    | (White, Gray) -> false
    | (Gray, Black) -> false;;


