open Graph

val nb_nodes: 'a graph -> int

val bfs: int graph -> id -> id -> (id*id*int) list option

val graph_ecart: int graph -> (id*id*int) list option -> int graph