open Graph
open Tools

type info_arc = {
  flow: int;
  capacity: int;
}

let nb_nodes gr = n_fold gr (fun x i -> x+1) 0;;

let bfs a b c =
    let h = Hashtbl.create (nb_nodes a) in
    let rec help gr id1 id2 =   
        if not (Hashtbl.mem h id1) then Hashtbl.add h id1 id1;
        if node_exists gr id1 && node_exists gr id2 then 
            let rec loop l =
                match l with
                    | [] -> None
                    | (i, lb)::_ when i = id2 && lb > 0 -> Some [(id1,id2,lb)]
                    | (i,lb)::rest ->   if not (Hashtbl.mem h i) && lb > 0 then
                                            let l1 = help gr i id2 in
                                            match l1 with
                                                | None -> loop rest
                                                | Some l2 -> Some ((id1,i,lb)::l2)
                                        else
                                            loop rest
            in
                let arcs = out_arcs gr id1 in
                    loop arcs
        else
            None
    in
help a b c;;

let rec find_flow_update l =
    match l with
        | None -> 0
        | Some [] -> 0
        | Some ((_,_,x)::rest) ->   let result = find_flow_update (Some rest) in
                                    if result < x && result > 0 then result else x;;

let rec graph_ecart_update gr l x =
    match l with
        | [] -> gr
        | (i1,i2,lb)::rest -> graph_ecart_update (add_arc (add_arc gr i1 i2 (-x)) i2 i1 x) rest x;;

let convert_graph_ecart_flow graph_initial graph_ecart = e_fold graph_initial (fun g id1 id2 capa ->
                                                                                    let fl = match find_arc graph_ecart id1 id2 with 
                                                                                                     | None -> capa
                                                                                                     | Some x -> capa-x
                                                                                        in
                                                                                        new_arc g id1 id2 ({flow = fl ; capacity = capa}) 
                                                                                    ) (clone_nodes graph_initial);;

let to_string_graph_ecart gr = gmap gr string_of_int;;

let to_string_flow_graph gr = gmap gr (fun {flow = fl; capacity = capa} -> (string_of_int fl)^("/")^(string_of_int capa));;

