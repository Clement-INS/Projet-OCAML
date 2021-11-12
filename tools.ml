(* Yes, we have to repeat open Graph. *)
open Graph

(* assert false is of type ∀α.α, so the type-checker is happy. *)
let clone_nodes (gr:'a graph) = (n_fold gr (fun g id -> new_node g id) empty_graph);;

let gmap gr f = e_fold gr (fun g i1 i2 a -> f a) empty_graph

let add_arc gr n1 n2 n =
    match find_arc gr n1 n2 with
        | None -> new_arc gr n1 n2 n
        | Some x -> new_arc gr n1 n2 (n+x);;

        