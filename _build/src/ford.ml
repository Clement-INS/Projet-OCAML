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
                    | (i, lb)::_ when i = id2 -> Some [(id1,id2,lb)]
                    | (i,lb)::rest ->   if not (Hashtbl.mem h i) then
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

(*let graph_ecart gr l =
    let g = clone_nodes gr in
    e_iter gr (fun i1 i2 lb =
                match L)*)