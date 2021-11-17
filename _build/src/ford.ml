open Graph
open Tools

type info_arc = {
  mutable flow: int;
  capacity: int;
}

let init_Ford (gr:int graph) = gmap gr (fun lb -> { flow = 0;
                                                    capacity = lb});;

let to_string gr = gmap gr (fun inf -> (string_of_int inf.flow));;