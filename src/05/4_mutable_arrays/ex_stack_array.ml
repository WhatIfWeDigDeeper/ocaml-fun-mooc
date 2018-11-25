(* Implementing a stack with an array
https://www.fun-mooc.fr/courses/course-v1:parisdiderot+56002+session03/courseware/W5/W5S4/
*)

type stack = int array
exception Full
exception Empty

(* 1. Define a function

    create : int -> stack

that creates a new stack of the given maximum capacity.
let create size = "your implementation." ;;
*)
(* create : int -> stack *)
let create size = Array.init (size+1) (fun _ -> 0);;

(* 2. Define a function

    push : stack -> int -> unit
    
that adds an element as the top of the stack.
The function must fail with the exception Full given in the prelude if nothing can be added to the stack.

let push buf elt = "your implementation.";;
*)
let push (buf: stack) (elt: int): unit =
    if buf.(0) = (Array.length buf) -1
        then
            raise Full
    else
        (buf.(buf.(0)+1) <- elt;
        buf.(0) <- buf.(0) + 1)
;;

(* 3. Define a function

    append : stack -> int array -> unit
    
that adds an array of integers as the top of the stack.
The first element of the array must be at the top of the stack,
the others in order, up to the last element,
which will be the lowest in the stack.
In other words, the last element of the array should be pushed first, etc. 
The function must fail with the exception Full given in the prelude
if some elements could not fit in the stack.
But in this case, it should still fill the stack with as many elements as possible.
let append buf arr = "your implementation.";
*)
let append (buf:stack) (arr:int array): unit = 
    for i = ((Array.length arr) -1) downto 0 do
        push buf (arr.(i))
    done;;

(* 4. Define a function

    pop : stack -> int
    
that takes an element as the top of the stack,
removes it from the stack, and return it. 
The function must fail with the exception Empty
given in the prelude if nothing can be taken from the stack.
*)
let pop (buf:stack): int = 
    if buf.(0) = 0
        then raise Empty
    else
        (
            let position = buf.(0) in
            buf.(0) <- position - 1;
            let result = buf.(position) in result
        )
;;