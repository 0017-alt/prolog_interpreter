{
    exception EOF
}

let digit = ['0'-'9']
let space = ' ' | '\t' | '\r' | '\n'
let small_alpha = ['a'-'z']
let large_alpha = ['A'-'Z']
let small_ident = small_alpha (small_alpha | digit)*
let large_ident = large_alpha (large_alpha | digit)*

rule main = parse
| space+              { main lexbuf }
| "("                 { Parser.LPAR }
| ")"                 { Parser.RPAR }
| ","                 { Parser.COMMA }
| "."                 { Parser.DOT }
| ":-"                { Parser.DEF }
| "?"                 { Parser.QUESTION }
| eof                 { raise EOF }
| small_ident  as sid { Parser.SID sid }
| large_ident  as lid { Parser.LID lid }
| _                   { failwith ("Unknown Token: " ^ Lexing.lexeme lexbuf)}
