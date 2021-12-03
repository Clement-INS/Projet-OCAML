open Afile
open Graph

let rec somme l =
  match l with
  | [] -> 0
  | (_,x,_)::rest -> x + (somme rest);;

let list_diff l amount =
  let n = List.length l in
  let due = amount/n in
  let rec loop l1 = 
    match l1 with
    | [] -> []
    | (n,x,id)::rest -> (n,x - due,id)::loop rest
  in
  loop l;;

let nodes_graph l = List.fold_left (fun g (_,_,id) -> new_node g id) empty_graph l;;

let rec arcs_update g l =
  match l with
  | [] -> g
  | (_,_,id)::rest -> let rec loop l1 gr =
                        match l1 with
                        | [] -> gr
                        | (_,_,id1)::ls -> loop ls (new_arc (new_arc gr id id1 max_int) id1 id max_int)
    in
    arcs_update (loop rest g) rest;;

let add_src_dest_nodes gr n = new_node (new_node gr 0) (n);;

let add_src_dest_arcs gr l dest = List.fold_left (fun g (_,diff, id) -> if diff < 0 then new_arc g 0 id (-diff) else if diff > 0 then new_arc g id dest diff else g) gr l;;

let dest l = (List.length l)+1;;

let ford_initial_graph list =
  let list_updated = list_diff list (somme list) in
  let graph = arcs_update (nodes_graph list) list_updated in
  let dst = dest list in
  add_src_dest_arcs (add_src_dest_nodes graph dst) list_updated (dst);;