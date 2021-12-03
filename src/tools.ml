(* Yes, we have to repeat open Graph. *)
open Graph
open Printf

(* assert false is of type ∀α.α, so the type-checker is happy. *)
let clone_nodes (gr:'a graph) = (n_fold gr (fun g id -> new_node g id) empty_graph);;

let gmap gr f = e_fold gr (fun g i1 i2 a -> new_arc g i1 i2 (f a)) (clone_nodes gr);;

let add_arc gr n1 n2 n =
  if node_exists gr n1 && node_exists gr n2 then
    match find_arc gr n1 n2 with
    | None -> new_arc gr n1 n2 n
    | Some x -> new_arc gr n1 n2 (n+x)
  else
    failwith "Nodes doesn't exist";;

