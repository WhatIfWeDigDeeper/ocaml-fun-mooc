(* https://www.fun-mooc.fr/courses/course-v1:parisdiderot+56002+session03/courseware/W5/W5S3/ *)

(*
To try your function, the prelude defines sample images and image builders. 
For instance, the image disk 5 5 5 would be displayed as the 
following ASCII art,
when rendered between coordinates 0 <= x <= 10 and 0 <= y <= 10.
*)

type image = int -> int -> bool ;;

let all_white = fun x y -> false ;;

let all_black = fun x y -> true ;;

let checkers = fun x y -> y/2 mod 2 = x/2 mod 2 ;;

let square cx cy s = fun x y ->
  let minx = cx - s / 2 in
  let maxx = cx + s / 2 in
  let miny = cy - s / 2 in
  let maxy = cy + s / 2 in
  x >= minx && x <= maxx && y >= miny && y <= maxy
;;

let disk cx cy r = fun x y ->
  let x' = x - cx in
  let y' = y - cy in
  (x' * x' + y' * y') <= r * r
;;

type blend =
  | Image of image
  | And of blend * blend
  | Or of blend * blend
  | Rem of blend * blend
;;

(* 1. Define a higher order function

    display_image: int -> int -> image -> unit
    
that takes an integer width, another one height,
a function which takes an x and a y,
and renders (prints) the boolean function as a series of lines,
using two nested for loops. 
Each line corresponds to a y, the first line printed being for y = 0,
the last one for y = height. 
In each line, the first character printed must be for x = 0,
the last one for x = width.
When the function result is true, a sharp ('#') must be displayed,
and a space otherwise. 
let display_image width height f_image =
  "Replace this string with your implementation." ;;
*)
(* display_image: int -> int -> image -> unit *)
let display_image width height f_image = 
    for y=0 to height do
        for x=0 to width do
            if (f_image x y) = true
            then
                print_char '#'
            else
                print_char ' '
        done;
        print_newline();
    done;;

(* 2. Now, we want to blend images to compose complex images
from simple ones. For this, we will use the blend type given the prelude. 
If we take two functions f and g, we have that:
    - Image f
        is the blended image looking exactly like f.
    - And (Image f, Image g)
        is the blended image that is black only where
        both f and g are both black.
    - Or (Image f, Image g)
        is the blended image that is black wherever
        either f or g or both are black.
    - Rem (Image f, Image g)
        is the blended image that is black wherever
        f is black and g is not.

Write a recursive

    render : blend -> int -> int -> bool
    
function, that tells, for a given x and y
the boolean color of the point, considering the given blended image.

let rec render blend x y = "your implementation." ;;
*)
(* render : blend -> int -> int -> bool *)
let rec render blend x y = match blend with
    | Image f -> f x y
    | And (f1, f2) ->
        if (render f1 x y = true)
            && (render f2 x y = true)
        then
            true
        else
            false
    | Or (f3, f4) ->
        if (render f3 x y = true) || (render f4 x y = true)
        then
            true
        else
            false
    | Rem (f5, f6) ->
        if (render f5 x y = true) && (render f6 x y = false)
        then
            true
        else
            false
;;
            

(* 3. Define a function

    display_blend: int -> int -> blend -> unit
    
that takes a width, another one height, a blended image,
and displays it by combining the two previous functions. 
As an example, the blend display_blend 10 10 (Rem (Image all_black, Image (disk 5 5 5))) would be displayed as the following ASCII art.

let display_blend width height blend ="your implementation." ;;
*)
(* display_blend: int -> int -> blend -> unit *)
let display_blend width height blend =
    display_image width height (fun x y -> render blend x y)
;;
