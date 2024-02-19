open Operations

let version = "0.0.0"
let help = "
  Usage: wc --help | --version | [OPTION]... FILE
  Options:
    -c                    print the byte counts
    -l                    print the newline counts
    -w                    print the word counts
    -m                    print the character counts
    --help                display this help and exit
    --version             output version information and exit
"

let rec parse_args args =
  let op = { byte_count = false; newline_count = false; word_count = false; character_count = false; file = "" } in
  match args with
    | [] -> Error "No file specified"
    | ["--help"] -> Ok(Help)
    | ["--version"] -> Ok(Version)
    | "-c" :: t' -> op.byte_count <- true; parse_args t'
    | "-l" :: t' -> op.newline_count <- true; parse_args t'
    | "-w" :: t' -> op.word_count <- true; parse_args t'
    | "-m" :: t' -> op.character_count <- true; parse_args t'
    | [f] -> op.file <- f; Ok(File_Operation op)
    | _ -> Error "Invalid arguments"

let _ = Sys.argv
  |> Array.to_list
  |> List.tl (* first argument seems to be path to executable, so remove it *)
  |> parse_args
  |> function
    | Ok(Help) -> print_endline help
    | Ok(Version) -> print_endline version
    | Ok(File_Operation op) -> print_endline (show_file_operation op)
    | Error e -> print_endline e

let () = File_utils.hello ()

(* Util to print arguments *)
(* let print_argv () =
    Array.iteri (fun i arg -> Printf.printf "Argument %d: %s\n" (i + 1) arg) Sys.argv
let () =
    print_argv () *)

