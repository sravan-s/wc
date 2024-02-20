open Operations

let count_new_lines file_name =
  let file = open_in file_name in
  let rec count_new_lines_aux acc =
    try
      let _ = input_line file in
      count_new_lines_aux (acc + 1)
    with
    | End_of_file -> acc
  in
  let result = count_new_lines_aux 0 in
  close_in file;
  result

let count_words file_name =
  let file = open_in file_name in
  let rec count_words_aux acc =
    try
      let line = input_line file in
      let words = String.split_on_char ' ' line in
      count_words_aux (acc + List.length words)
    with
    | End_of_file -> acc
  in
  let result = count_words_aux 0 in
  close_in file;
  result

let count_chars file_name =
  let file = open_in file_name in
  let rec count_chars_aux acc =
    try
      let line = input_line file in
      count_chars_aux (acc + String.length line)
    with
    | End_of_file -> acc
  in
  let result = count_chars_aux 0 in
  close_in file;
  result

let count_bytes file_name =
  let file = open_in file_name in
  let rec count_bytes_aux acc =
    try
      let _ = input_byte file in
      count_bytes_aux (acc + 1)
    with
    | End_of_file -> acc
  in
  let result = count_bytes_aux 0 in
  close_in file;
  result

let parse_file op =
  let show_everything = not (op.byte_count || op.character_count || op.word_count || op.newline_count) in
  if show_everything then
    "Bytes: " ^ string_of_int (count_bytes op.file) ^ "\n" ^
    "Chars: " ^ string_of_int (count_chars op.file) ^ "\n" ^
    "Words: " ^ string_of_int (count_words op.file) ^ "\n" ^
    "Lines: " ^ string_of_int (count_new_lines op.file) ^ "\n"
  else
  if op.byte_count then "Bytes: " ^ string_of_int (count_bytes op.file) ^ "\n" else "" ^
  if op.character_count then "Chars: " ^ string_of_int (count_chars op.file) ^ "\n" else "" ^
  if op.word_count then "Words: " ^ string_of_int (count_words op.file) ^ "\n" else "" ^
  if op.newline_count then "Lines: " ^ string_of_int (count_new_lines op.file) ^ "\n" else ""

