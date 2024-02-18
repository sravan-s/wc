(lang dune 3.13)

(name wc)

(generate_opam_files true)

(source
 (github sravan-s/wc))

(authors "Sravan")

(maintainers "sravan-s@protonmail.com")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name wc)
 (synopsis "wc clone in OCaml")
 (description "See README.md for more information.")
 (depends ocaml dune (ppx_deriving(= "5.2.1")))
 (tags
  (topics "ocaml" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
