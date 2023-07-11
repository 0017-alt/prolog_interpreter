%{
  open Syntax
%}

%token <string> LID, SID
%token DEF 
%token LPAR RPAR
%token COMMA
%token QUESTION
%token DOT

%start toplevel
%type <Syntax.command> toplevel
%%

toplevel:
  | expr1 DOT { CExp ($1) }
;

expr1:
  | QUESTION const LPAR expr2 RPAR           { EQuestion ($2,$4) }
  | const LPAR expr2 RPAR           { EDef ($1,$3) }
  | const LPAR expr2 RPAR DEF const LPAR expr2 RPAR COMMA const LPAR expr2 RPAR { ERuleDef ($1,$3,$6,$8,$11,$13) }
  | const LPAR expr2 RPAR COMMA const LPAR expr2 RPAR { EAnd ($1,$3,$6,$8) }
;

expr2:
  | const             { EConst ($1) }
  | var               { EVar ($1) }
  | expr2 COMMA expr3 { EList ($1,$3) }
;

expr3:
  | const             { EConst ($1) }
  | var               { EVar ($1) }
  | expr2 COMMA expr3 { EList ($1,$3) }
;

const:
  | SID { $1 }
;

var:
  | LID { $1 }
;
