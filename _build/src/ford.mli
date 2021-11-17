open Graph

type info_arc = {
  mutable flow: int;
  capacity: int;
}
(*Convert int graph to int*int graph where all first int are 0 and correspond to the capacity
  and the second to the flow of the edge*)
val init_Ford: int graph -> info_arc graph

(*Convert an info_arc graph to a string graph with only the flows*)
val to_string: info_arc graph -> string graph