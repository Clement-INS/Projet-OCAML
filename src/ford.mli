open Graph

(** Return a path with starting and destination id of each edge with its label between two nodes if a path exists*)
val bfs: int graph -> id -> id -> (id*id*int) list option

(** Return the value of the max label in the list *)
val find_flow_update: (id*id*int) list option -> int

(** Return the new "graphe d'écart" knowing a path and the changing flow value *)
val graph_ecart: int graph -> (id*id*int) list -> int -> int graph