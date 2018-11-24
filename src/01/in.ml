let x = 4+5;;

(*let x1 = 10 and y = x+1 in x*y;;*)

(* multiply 3 times to achieve x^8 *)
let x_power_8 =
            let x1 = x*x in
            let x2= x1*x1 in
            let x3= x2*x2 in x3;;

(* concatenate word 5 times with comma that results in 9 words *)
let word = "test";;
let sentence = 
    let c1 = word ^ "," in
    let c2 = c1 ^ c1 in
    let c3 = c2 ^ c2 in
    let c4 = c3 ^ c3 in
    let c5 = c4 ^ word in c5;;

