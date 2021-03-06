module type DictSig = sig
  type ('key, 'value) t
  val empty : ('key, 'value) t
  val add : ('key, 'value) t -> 'key -> 'value -> ('key, 'value) t
  exception NotFound
  val lookup : ('key, 'value) t -> 'key -> 'value
  val remove : ('key, 'value) t -> 'key -> ('key, 'value) t
end ;;

(* The following code is the program explained during the video sequence except that we have modified the interface DictSig a little bit. Now, it is possible to remove a key from a dictionary.

Update the code to have it accepted by the type-checker.
*)

module Dict : DictSig = struct
  type ('key, 'value) t =
    | Empty
    | Node of ('key, 'value) t * 'key * 'value * ('key, 'value) t

  let empty = Empty

  let rec add d k v =
    match d with
    | Empty -> Node (Empty, k, v, Empty)
    | Node (l, k', v', r) ->
        if k = k' then Node (l, k, v, r)
        else if k < k' then Node (add l k v, k', v', r)
        else Node (l, k', v', add r k v)

  exception NotFound

  let rec lookup d k =
    match d with
    | Empty ->
        raise NotFound
    | Node (l, k', v', r) ->
        if k = k' then v'
        else if k < k' then lookup l k
        else lookup r k

  let rec remove dict key =
    match dict with
    | Empty -> raise NotFound
    | Node (left, key', val', right) ->
      if key = key' then Empty
      else if key < key' then Node (remove left key, key', val', right)
      else Node (left, key', val', remove right key)

end ;;

let d = Dict.empty in
let d = Dict.add d "Eggplant" 5 in
let d = Dict.add d "Zucchini" 3 in
let d = Dict.remove d "Eggplant" in
d