
(* The type of tokens. *)

type token = 
  | SID of (string)
  | RPAR
  | QUESTION
  | LPAR
  | LID of (string)
  | DOT
  | DEF
  | COMMA

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val toplevel: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.command)
