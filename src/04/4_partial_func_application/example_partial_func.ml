(* partial *)
let f1 = fun x y z -> x + y * z;;

let f2 = f1 1;;

let f3 = f2 2;;

f3 4;;

(* reduction *)
let f1 = fun x y -> (x / 0) + y;;

let f2 = f1 17;;

f2 42;;

(* list egal *)
let egal l1 l2 = List.sort compare l1 = List.sort compare l2;;

let f = egal [783; 42; 17];;

f [17;42;783];;
 
let egalp l1 =
  let l1sorted = List.sort compare l1 
  in function l2 -> l1sorted = List.sort compare l2;; 

let f = egalp [783; 42; 17];;

f [17;42;783];;


