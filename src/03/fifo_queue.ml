(* front @ List.rev back = sequence of elements in queue *)

type queue = int list * int list

(* 1. Write a function
    is_empty : queue -> bool
such that is_empty q is true if and only if q has no element.
*)
let is_empty (front, back) = match front, back with
  | [], [] -> true
  | _, _ -> false;;

(* 2. Write a function
    enqueue : int -> queue -> queue 
such that enqueue x q is the queue as q 
except that x is at the end of the queue.

<- front back <-
[]  []
[1] [1]
2[1] [1]
[2:1][2:1]
*)
let enqueue x (front, back): queue = 
    (front, x :: back);;

(* 3. Write a function
    split : int list -> int list * int list 
such that split l = (front, back)
where l = back @ List.rev front
    and the length of back and front is List.length l / 2 or List.length l / 2 + 1
split [-4:3;-1] = front 1 or 2, back 2 or 2

[1,2,3,4] -> [4,3],[2,1]
b [1] [2,1]
f [3] [4:3]

*)
type split_data = {
    count: int;
    half: int;
    front: int list;
    back: int list
}

let rec split_rec (l: int list) (acc: split_data): queue = match l with
    | [] -> (acc.front, List.rev acc.back)
    | x :: xs ->
        if (acc.count < acc.half)
            then split_rec xs ({
                count= acc.count + 1;
                half=acc.half;
                back=(x :: acc.back);
                front=acc.front
            })
        else
            split_rec xs ({
                count= acc.count + 1;
                half=acc.half;
                front= (x :: acc.front);
                back=acc.back
            })

let split (l: int list): queue =
    let len = List.length l in
    let half = len / 2 in 
    let init_data = {
        count = 0;
        half = half;
        front = [];
        back = []
    } in
    let result = split_rec l init_data in result;;

(* 4. Write a function
    dequeue : queue -> int * queue
such that dequeue q = (x, q') where 
    x is the front element of the queue q and 
    q' corresponds to remaining elements. 
This function assumes that q is non empty.
*)

let rec rec_dequeue ((front, back): queue): (int * queue) = match front, back with 
    | x :: xs, ys -> (x, (xs, ys))
    | [], y :: ys -> rec_dequeue ((List.rev (y::ys)), [])
    | [], [] -> (0, ([], []));;

let dequeue (front, back): (int * queue) = rec_dequeue (front, back);;
