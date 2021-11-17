open Gfile
open Tools

let () =


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(2)
  and outfile2 = Sys.argv.(3)

  in

  (* Open file *)
  let graph = from_file infile in

  (* Rewrite the graph that has been read. *)
  let int_graph = gmap graph int_of_string in
  let () = write_file outfile (gmap (gmap graph (fun x -> (int_of_string x)+1)) string_of_int) in
  (*let () = write_file outfile (gmap (add_arc int_graph 0 3 6) string_of_int) in*)

  let () = export outfile2 (from_file outfile) in
  ();;

