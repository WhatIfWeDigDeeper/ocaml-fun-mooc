let rec gcd (n: int) (m: int) : int =
    if m = 0
        then n 
    else
        gcd m (n mod m)

let rec multiple_upto n r =
    if (r < 2)
        then false
    else
        if (n mod r) = 0 
            then true
        else
            multiple_upto n (r -1);;

let is_prime n =
    if n = 1
        then false
    else
        not (multiple_upto n (n -1));;