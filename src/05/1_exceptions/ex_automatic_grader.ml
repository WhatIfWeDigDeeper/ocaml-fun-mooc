

type report = message list
and message = string * status
and status = Successful | Failed

type 'a result = Ok of 'a | Error of exn

let exn_to_string = Printexc.to_string

(* 1. For each question, we call both your function 
and a reference function on a list of randomly sampled test cases,
and observe the results. We also have to handle the case 
where a function raises an exception instead of producing a result. 
Sometimes, we even expect your function to raise an exception, 
and want to compare it to the exception raised by the reference function. 
For this, we use the 'a result type given in the prelude. 
Define a function

    exec: ('a -> 'b) -> 'a -> 'b result
    
that calls the given function on the given argument,
and returns Ok with the result if everything went well, 
and Error with the exception raised, if there was one.

let exec f x =
  "Replace this string with your implementation." ;;

*)
let exec (f: 'a -> 'b) (x: 'a): 'b result = 
    try
        Ok (f x) 
    with
        err -> Error err
   ;;


(* 2. To be able to provide you with the nice error reports,
we use an intermediate type for producing reports, similar to the one given in the prelude. 
Define a function compare with the following signature.

    compare : 'a result -> 'a result -> ('a -> string) -> message

This function will take first the user function's result 
and then the reference function's result. 
It also takes a printer compatible with the return type,
to display the results as in one the following cases.

("got correct value 13", Successful)
("got unexpected value 13", Failed)
("got correct exception Exit", Successful)
("got unexpected exception Exit", Failed)

You must respect the exact wording for your solution to be accepted.
To display exceptions, you can use the provided exn_to_string function.

let compare user reference to_string =
  "Replace this string with your implementation." ;;
*)
let compare (user: 'a result) (reference: 'a result) (to_string: 'a -> string): message = match user, reference with
    | (Ok x, Ok y) when x = y -> ("got correct value " ^ (to_string x), Successful)
    | (Ok wrong, (Ok _ | Error _)) -> ("got unexpected value " ^ (to_string wrong), Failed)
    | (Error uerr, Error expected) when uerr = expected
        -> ("got correct exception " ^ (exn_to_string uerr), Successful)
    | (Error wrong_err, _)
        -> ("got unexpected exception " ^ (exn_to_string wrong_err), Failed)
;;

(* 3. Then we define random samplers 
for each type of data that will be passed to your function. 
For a given type 'a, a random sampler simply has type unit -> 'a, 
an imperative function that returns a new value of type 'a 
every time you give it a unit. 
Define a function test with the following signature.

    test : ('a -> 'b) -> ('a -> 'b) -> (unit -> 'a) -> ('b -> string) -> report

This function must proceed to exactly 10 tests,
calling the sampler each time, and return the list of messages.
For each sample, you will exec the user function (the first parameter), 
then exec the reference function, and compare the results.
It will then return the list containing the 10 comparison messages.
Your solution must respect the constraint that
the first call to the sampler corresponds to the first message of the list,
the second to the second, etc. 
Be cautious about not reversing the list. 
And since the sampler is an imperative, remember to use let ... in constructs
if necessary, to force the order of evaluation.

test : ('a -> 'b) -> ('a -> 'b) -> (unit -> 'a) -> ('b -> string) -> report
let test user reference sample to_string =
  "Replace this string with your implementation." ;;
*)

let test
    (user:  ('a -> 'b))
    (reference: ('a -> 'b))
    (sample: (unit -> 'a))
    (to_string: ('b -> string)): report =
  let final_result = 
    List.fold_left
      (fun acc _ -> 
         let sample_val = sample() in
         let user_result =
           try Ok (exec user sample_val) with user_err -> Error user_err in
         let ref_result =
           try Ok (exec reference sample_val) with ref_err -> Error ref_err in
         let compare_result = 
           (compare
              user_result
              ref_result
              (function v -> match v with
                  | Ok v1 -> to_string v1
                  | Error err1 -> exn_to_string err1
              )
           )
         in
         let result = acc@[compare_result] in result
      )
      []
      [1;2;3;4;5;6;7;8;9;10]
  in final_result 
;;

(* 1,2,4,8,16,23,28, _ *)
(* x..+1 
0 + 1 = 1
1 + 1 = 2
1 + 2 + 1 = 4
1 + 2 + 4 + 1 = 8
1 + 2 + 4 + 8 + 1 = 16
1 + 2 + 4 + 8 + 1 + 16 = 32 
*)
