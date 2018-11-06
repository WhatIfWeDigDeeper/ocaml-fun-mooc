(* 1. Define a function
    ccr: float -> float -> float -> float -> float
that takes as arguments a, b, c and s, 
and returns the radius of circumscribed circle 
as described above.
let ccr = fun a -> fun b -> fun c -> fun s ->
  "Replace this string with your implementation." ;;
*)

let ccr =
    fun a -> 
        let acc1 = (cos (a /. 2.))
    in fun b ->
        let acc2 = acc1 *. (cos (b /. 2.))
    in fun c ->
        let acc3 = acc2 *. (cos (c /. 2.))
    in fun s -> let result = s /. (acc3 *. 8.)
    in result;;

(* let ccr =
    fun a -> 
        let side1 = 2. *. (cos (a /. 2.))
    in fun b ->
        let side2 = 2. *. (cos (b /. 2.)) in
        let acc2 = side1 *. side2
    in fun c ->
        let side3 = 2. *. (cos (c /. 2.)) in
        let acc3 = acc2 *. side3
    in fun s -> let result = s /. acc3
    in result;; *)

