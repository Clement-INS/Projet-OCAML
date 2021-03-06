open Graph


type info_arc

(** Return a path with starting and destination id of each edge with its label between two nodes if a path exists*)
val bfs: int graph -> id -> id -> (id*id*int) list option

(** Return the value of the max label in the list *)
val find_flow_update: (id*id*int) list option -> int

(** Return the new "graphe d'écart" knowing a path and the changing flow value *)
val graph_ecart_update: int graph -> (id*id*int) list option -> int -> int graph

(** Create a flow graph given an ecart graph *)
val convert_graph_ecart_flow: int graph -> int graph -> info_arc graph

(** Convert ecart graph to string graph *)
val to_string_graph_ecart: int graph -> string graph

(** Convert flow graph to string graph *)
val to_string_flow_graph: info_arc graph -> string graph

(** Return the maximal flow of the graph *)
val max_flow: info_arc graph -> id -> int

(** Execute the ford-Fulkerson algorithm *)
val algo_ford: string graph -> id -> id -> string graph * int


