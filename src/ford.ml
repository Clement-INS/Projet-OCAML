open Graph
open Tools

let bfs a b c =
    let h = Hashtbl.create 100 in
    let rec help gr id1 id2 =   
        if not (Hashtbl.mem h id1) then Hashtbl.add h id1 id1;
        if node_exists gr id1 && node_exists gr id2 then 
            let rec loop l =
                match l with
                    | [] -> None
                    | (i, lb)::_ when i = id2 -> Some [(id1,id2,lb)]
                    | (i,lb)::rest ->   if not (Hashtbl.mem h i) then
                                            let l1 = help gr i id2 in
                                            if l1 = None then
                                                loop rest
                                            else
                                                let Some l2 = l1 in
                                                    Some ((id1,i,lb)::l2)
                                        else
                                            loop rest
            in
                let arcs = out_arcs gr id1 in
                    loop arcs
        else
            None
    in
help a b c;;