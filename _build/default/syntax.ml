exception EvalErr

type name = string
and args =
    | Const of string
    | Var   of string
and env = name * args list
and expr =
    | EDef     of name * expr
    | ERuleDef of name * expr * name * expr * name * expr
    | EConst   of name
    | EVar     of name
    | EAnd     of name * expr * name * expr
    | EList    of expr * expr
    | EQuestion of name * expr
and command =
    | CExp     of expr

let rec print_expr expr =
    match expr with
    | EDef (n,e) ->
        print_string "EDef (";
        print_string n;
        print_string ",";
        print_expr e;
        print_string ")"
    | EQuestion (n,e) ->
        print_string "EQuestion (";
        print_string n;
        print_string ",";
        print_expr e;
        print_string ")"
    | ERuleDef (n,e,n1,e1,n2,e2) ->
        print_string "ERuleDef (";
        print_string n;
        print_string ",";
        print_expr e;
        print_string ",";
        print_string n1;
        print_string ",";
        print_expr e1;
        print_string ",";
        print_string n2;
        print_expr e2;
        print_string ")"
    | EConst n ->
        print_string "EConst (";
        print_string n;
        print_string ")"
    | EVar n ->
        print_string "EVar (";
        print_string n;
        print_string ")"
    | EList (e1,e2) ->
        print_string "EList (";
        print_expr e1;
        print_string ",";
        print_expr e2;
        print_string ")"
    | EAnd (n1,e1,n2,e2) ->
        print_string "EAnd (";
        print_string n1;
        print_string ",";
        print_expr e1;
        print_string ",";
        print_string n2;
        print_string ",";
        print_expr e2;
        print_string ")"
