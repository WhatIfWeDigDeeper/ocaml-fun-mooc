type point2d = { x: int; y: int};;

let origin = { x = 0; y = 0};;

let from_tuple (x, y) = { x; y };;

let a = from_tuple (4, 2);;

let b = from_tuple (10, 5);;

(* sample type: box *)

type box = {
  left_upper_corner: point2d;
  right_upper_corner: point2d;
};;

let the_box = { left_upper_corner = a; right_upper_corner = b };;

(* pattern of point, destructured as x *)
let get_min_x { left_upper_corner = { x }} = x;;

(* exercises *)
(*
1. Write a function move : point -> dpoint -> point
such that move p dp is the point p whose coordinates
have been updated according to dp.
(x is now x +. dx, y is now y +. dy, z is now z +. dz.
*)
type point  = { x : float; y : float; z : float };;
type dpoint = { dx : float; dy : float; dz : float };;
type physical_object = { position : point; velocity : dpoint };;


let move (p: point) (dp: dpoint): point = {
  x = p.x +. dp.dx;
  y = p.y +. dp.dy;
  z = p.z +. dp.dz
};;


(*
2. Write a function next : physical_object -> physical_object
such that next o is the physical object o at time t + dt.
The position of next o is the position of o moved according to its velocity vector.
*)

let next (obj: physical_object): physical_object =
  let movedPosition = move obj.position obj.velocity in
  let result = { position = movedPosition; velocity = obj.velocity } in result;;

(*
3. Suppose that these objects are spheres whose radius is 1.0. Write a function
will_collide_soon : physical_object -> physical_object -> bool
that tells if at the next instant, the two spheres will intersect.
*)
let will_collide_soon (p1: physical_object) (p2: physical_object): bool =
  let nxtp1 = next p1 in
  let nxtp2 = next p2 in
  let result = nxtp1.position.x = nxtp2.position.x ||
               nxtp1.position.y = nxtp2.position.y ||
               nxtp1.position.z = nxtp2.position.z in result;;


(* Time on Planet Shadokus 
   On planet Shadokus, 
   a year has 5 months, 
   each month has 4 days, 
   each day has 3 hours and 
   each hour has 2 minutes. 
*)

(* 1. A date is well-formed 
   if its year index is >= 1, 
   its month index is >= 1 and <= 5, 
   its day index is >= 1 and <= 4, 
   its hour index is >= 0 and <= 2, and 
   its minute index is >= 0 and <= 1. 
*)



type date = {
  year: int;
  month: int;
  day: int;
  hour: int;
  minute: int
};;

let the_origin_of_time: date =
  { year = 1; month = 1; day = 1;
    hour = 0; minute = 0 }

let wellformed (dt: date): bool = 
  dt.year >= 1 &&
  (dt.month >= 1 && dt.month <=5) &&
  (dt.day >= 1 && dt.day <= 4) &&
  (dt.hour >= 0 && dt.hour <= 2) &&
  (dt.minute >= 0 && dt.minute <= 1);;

(*
2. On planet Shadokus, the origin of time is the discovery of the Big-Lambda-Machine,
a magical computer that evaluates the infinite lambda-term of time. 
It is defined by value the_origin_of_time of the given prelude. Write a 
function next : date -> date which 
computes the date which comes one minute after the input date.
*)
(*
let months = { 1; 2; 3; 4; 5 };;
type days = { 1, 2, 3, 4 };;
type hours = { 0, 1, 2 };;
type minutes = { 0, 1 };;
*)

let next (dt: date): date = 
  let min = dt.minute + 1 in
  let hh = if (min = 2) then (dt.hour + 1) else dt.hour in
  let dd = if (hh = 3) then (dt.day + 1) else dt.day in
  let mm = if (dd = 5) then (dt.month + 1) else dt.month in
  let yr = if (mm = 6) then (dt.year + 1) else dt.year in
  let result = {
    year = yr;
    month = if (mm = 6) then 1 else mm;
    day = if (dd = 5) then 1 else dd;
    hour = if (hh = 3) then 0 else hh;
    minute = if (min = 2) then 0 else min
  } in result;;

(* 
3. In this computer, the time is represented by an integer that 
counts the number of minutes since 1/1/1 0:0 = the origin of time. 
Write a function
  of_int : int -> date 
  that converts such an integer into a date
*)

  let rec next_date (minutes: int) (dt: date): date = 
    if minutes = 0 then dt else next_date (minutes -1) (next dt)

  let of_int (minutes: int): date = next_date minutes the_origin_of_time

