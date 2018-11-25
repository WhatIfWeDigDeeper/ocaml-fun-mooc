(* Rotating the contents of an array
https://www.fun-mooc.fr/courses/course-v1:parisdiderot+56002+session03/courseware/W5/W5S4/
*)

(* 1. perfect example *)
let rotate a =
  let n = Array.length a in 
  if n > 1
    then
      (let v = a.(0) in
      for i = 0 to n-2 do
        a.(i) <- a.(i+1)
      done;
      a.(n-1)<-v)
  else
    ()
;;

(* 2. Define

    rotate_by: 'a array -> int -> unit 
    
adding a parameter that allows to rotate by n positions. 
For instance, rotate_by [|1;2;3;4|] 3 should yield [|4;1;2;3|].
*)

let rotate_by a n = 
    for _=1 to (abs n) do
        rotate a
    done;;