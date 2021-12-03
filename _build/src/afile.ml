open Printf

let from_file_money path =

  let infile = open_in path in

  (* Read all lines until end of file. *)
  let rec loop list =
    try
      let line = input_line infile in

      (* Remove leading and trailing spaces. *)
      let line = String.trim line in

      let list2 =
        (* Ignore empty lines *)
        if line = "" then list

        else
          try Scanf.sscanf line "%s %d %d"
                (fun name paid id -> List.append list [(name,paid,id)])
          with e ->
            Printf.printf "Cannot read in line - %s:\n%s\n%!" (Printexc.to_string e) line ;
            failwith "from_file"
      in      
      loop list2

    with End_of_file -> list (* Done *)
  in

  let final_list = loop [] in

  close_in infile ;
  final_list;;

