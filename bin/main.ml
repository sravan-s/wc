open Operations
open File_utils
open Text

let rec parse_args (op : file_operation) (args : string list) =
  match args with
    | [] -> Error "No file specified"
    | ["--help"] -> Ok(Help)
    | ["--version"] -> Ok(Version)
    | "-c" :: t' -> op.byte_count <- true; parse_args op t'
    | "-l" :: t' -> op.newline_count <- true; parse_args op t'
    | "-w" :: t' -> op.word_count <- true; parse_args op t'
    | "-m" :: t' -> op.character_count <- true; parse_args op t'
    | [f] -> op.file <- f; Ok(File_Operation op)
    | _ -> Error "Invalid arguments"

let _ = Sys.argv
  |> Array.to_list
  |> List.tl (* first argument seems to be path to executable, so remove it *)
  |> (parse_args { file = ""; byte_count = false; newline_count = false; word_count = false; character_count = false })
  |> function
    | Ok(Help) -> print_endline help
    | Ok(Version) -> print_endline version
    | Ok(File_Operation op) -> print_endline (parse_file op)
    | Error e -> print_endline e
