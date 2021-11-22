open Graph
open Tools

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

let rec graph_ecart gr l x =
    match l with
        | [] -> gr
        | (i1,i2,lb)::rest -> graph_ecart (add_arc (add_arc gr i1 i2 (-x)) i2 i1 x) rest x;;
        (**)