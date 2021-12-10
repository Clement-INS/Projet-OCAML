open Graph

(** In (string*int*id) the string represent the name of the person, the id the number of the node and the int represent monney *)

(** Compute the total ammount of monney that was spent by the group *)
val somme: (string*int*id) list -> int

(** Return the list with the amount of monney due by everyone, if it's negative it means you have to payback, otherwise others have to pay you back *)
val list_diff: (string*int*id) list -> int -> (string*int*id) list

(** Create an empty graph with 1 node per person *)
val nodes_graph: (string*int*id) list -> 'a graph

(** Add arcs between each nodes with max_int capacity *)
val arcs_update: int graph -> (string*int*id) list -> int graph

(** Add a source and destination node *)
val add_src_dest_nodes: int graph -> id -> int graph

(** Add arcs from source to every Node corresponding to person who has to payback
 and nodes from every person who will be pay back by others to the destination node *)
val add_src_dest_arcs: int graph -> (string*int*id) list -> id -> int graph

(** Return the id of the destination node *)
val dest: (string*int*id) list -> id

(** Call every upper function to create a graph that can be used by the ford algortihm to solve the monney problem *)
val ford_initial_graph: (string*int*id) list -> int graph