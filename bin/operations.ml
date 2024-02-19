type file_operation = {
  mutable byte_count: bool;
  mutable newline_count: bool;
  mutable word_count: bool;
  mutable character_count: bool;
  mutable file: string;
} [@@deriving show]

type operation =
  | Help
  | Version
  | File_Operation of file_operation
