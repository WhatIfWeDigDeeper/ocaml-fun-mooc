(* squarecubes.ml
https://www.fun-mooc.fr/asset-v1:parisdiderot+56002+session03+type@asset+block/squarecubes.ml
*)
let cubes n = Array.init n (fun i -> i*i*i);;

let sqrti n =  truncate (sqrt (float n));;

let issquare n = let s = sqrti n in s*s =n;;

let squarecubes n =
  let c = cubes n in
  for i = 0 to n-1 do
    if issquare c.(i) then 
       (print_int c.(i);
        print_string " ")
  done
;;

squarecubes 100;;

(* arraymutables.ml
https://www.fun-mooc.fr/asset-v1:parisdiderot+56002+session03+type@asset+block/arraymutables.ml
*)
let a = [|0;1;2;3;4|];;

a.(0);;

a.(0) <- 100;;

a.(0);;

a;;


let rotate a =
  let n = Array.length a in 
  let v = a.(0) in
  for i = 0 to n-2 do
    a.(i) <- a.(i+1)
  done;
  a.(n-1)<-v;;

let x = Array.init 10 (fun i -> i);;

x;;

rotate x;;

x;;

rotate x;;

x;;