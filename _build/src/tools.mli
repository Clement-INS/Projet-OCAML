open Graph

(** Create a new graph with the same nodes and no edge*)
val clone_nodes: 'a graph -> 'b graph

(** Map f on each edge of the graph *)
val gmap: 'a graph -> ('a -> 'b) -> 'b graph

(** Create an edge between two nodes with value x if it doesn't exist or add x to its label *)
val add_arc: int graph -> id -> id -> int -> int graph


