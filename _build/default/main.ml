open Eval

let rec read_eval_print env =
  print_string "?- ";
  flush stdout;
  let cmd = Parser.toplevel Lexer.main (Lexing.from_channel stdin) in
  let newenv = eval_command env cmd in
  read_eval_print newenv

let initial_env = []

let _ = try read_eval_print initial_env with 
  | EvalErr -> print_string "from scratch\n"; read_eval_print initial_env
  | Lexer.EOF -> print_string "\nGoodbye!\n"; 