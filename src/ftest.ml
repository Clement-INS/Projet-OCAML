open Gfile
open Tools
open Ford
open Printf

let print_bfs l =
  let rec loop li =
    match li with
    | [] -> ()
    | (a,b,c)::rest -> printf "(%i,%i,%i), \n" a b c;
      loop rest
  in
  match l with
  | None -> printf "no path between nodes\n"; ()
  | Some (ls) -> (loop ls);;

let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf
        "\n ✻  Usage: %s infile source sink outfile\n\n%s%!" Sys.argv.(0)
        ("    🟄  infile  : input file containing a graph\n" ^
         "    🟄  source  : identifier of the source vertex (used by the ford-fulkerson algorithm)\n" ^
         "    🟄  sink    : identifier of the sink vertex (ditto)\n" ^
         "    🟄  outfile : output file in which the result should be written.\n\n") ;
      exit 0
    end ;

  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)

  let infile = Sys.argv.(1)
  and source = int_of_string Sys.argv.(2)
  and dest = int_of_string Sys.argv.(3)
  and outfile = Sys.argv.(4)

  in

  (* Open file *)
  let graph = from_file infile in
  let (res,flow_max) = algo_ford graph source dest in
  Printf.printf "Max flow: %i\n" flow_max;
  let () = export outfile res in

  ();;




