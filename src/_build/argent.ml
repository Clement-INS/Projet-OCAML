open Afile

let rec somme l =
  match l with
  | [] -> 0
  | (_,x)::rest -> x+somme rest;;

let list_diff l amount =
  let n = List.length l in
  let due = amount/n in
  let rec loop l1 = 
    match l1 with
    | [] -> []
    | (n,x)::rest -> (n,x - due)::loop rest
  in
  loop l;;

let rec print_list l =
  match l with
  | [] -> ()
  | (n,x)::rest -> Printf.printf "%s %d \n%!" n x;
    print_list rest;;

let a = from_file "../annexe/exemple.txt" in
print_list (list_diff a (somme a));;