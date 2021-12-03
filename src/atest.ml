open Afile
open Argent
open Tools
open Graph
open Gfile
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
  if Array.length Sys.argv <> 3 then
    begin
      Printf.printf
        "\n ✻  Usage: %s infile source sink outfile\n\n%s%!" Sys.argv.(0)
        ("    🟄  infile  : input file containing names and money\n" ^
         "    🟄  outfile : output file in which the result should be written.\n\n") ;
      exit 0
    end ;

  (* Arguments are : infile(1) outfile(2) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(2)

  in

  (* Open file *)

  let list = from_file_money infile in
  let graph = gmap (ford_initial_graph list) string_of_int in 
  let dst = dest list in
  let (res,flow_max) = algo_ford graph 0 dst in
  Printf.printf "Max flow: %i\n" flow_max;
  let () = export outfile res in
  ();;




