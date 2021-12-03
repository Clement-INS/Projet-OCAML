open Graph

val somme: (string*int*id) list -> int

val list_diff: (string*int*id) list -> int -> (string*int*id) list

val nodes_graph: (string*int*id) list -> 'a graph

val arcs_update: int graph -> (string*int*id) list -> int graph

val add_src_dest_nodes: int graph -> id -> int graph

val add_src_dest_arcs: int graph -> (string*int*id) list -> id -> int graph

val dest: (string*int*id) list -> id

val ford_initial_graph: (string*int*id) list -> int graph