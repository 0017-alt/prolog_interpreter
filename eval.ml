open Syntax
exception EvalErr

let def n const_list env = (n,const_list) :: env

let rec list_match a b =
  match (a,b) with
  | ([],[]) -> true
  | (_,[]) -> false
  | ([],_) -> false
  | (x::xs,y::ys) ->
    (if x=y then list_match xs ys
    else false)

let rec ask n const_list env =
  match env with
  | [] -> print_string "false.\n"
  | (x,v)::rest ->
    (if n=x then
      (if (list_match const_list v) then print_string "true.\n"
      else ask n const_list rest)
    else ask n const_list rest)

let rec find_val l =
  match l with
  | [] -> []
  | Const _ :: rest -> find_val rest
  | Var _ :: _ -> l

let rec find_con l =
  match l with
  | [] -> []
  | Var _ :: rest -> find_con rest
  | Const _ :: _ -> l

let rec check_match a b =
  match (a,b) with
  | ([],_) -> [b]
  | (x::xs,y::ys) ->
    (if x=y then check_match xs ys
    else [])
  | (_::_,[]) -> print_string "check_match\n"; raise EvalErr

let rec print_list l =
  match l with
  | [] -> print_string ""
  | Const x::xs -> print_string x; print_string ", "; print_list xs
  | Var x::xs -> print_string x; print_string ", "; print_list xs

let rec find_match n con_list env output =
  match env with
  | [] -> output
  | (name,const_list)::rest ->
    (if name=n then find_match n con_list rest ((check_match con_list const_list) @ output)
    else find_match n con_list rest output)

let rec print_ans a b =
  match b with
  | [] -> print_string ""
  | z::zs ->
    (let rec loop c d =
      match (c,d) with
      | ([],[]) -> print_string ""
      | (Var x::xs,Const y::ys) -> print_string x; print_string " = "; print_string y; print_string "\n"; loop xs ys
      | (_,_) -> print_string ""
    in loop a z; print_ans a zs)

let find n const_list env =
  let val_list = find_val const_list in
  let con_list = List.rev (find_con (List.rev const_list)) in
  let output_list = find_match n con_list env [] in
  print_ans val_list output_list

let rec isin x l =
  match l with
  | [] -> false
  | y::rest ->
    (if x=y then true
    else isin x rest)

let rec satisfy x y con =
  match con with
  | [] -> true
  | (n,m)::rest ->
    if (List.nth x n)=(List.nth y m) then satisfy x y rest
    else false

let rec get_ans_loop y n out =
  match y with
  | a::rest ->
    (if n=0 then (rest,List.rev out)
    else get_ans_loop rest (n-1) (a::out))
  | [] -> print_string "get_ans_loop\n"; raise EvalErr

let rec get_ans y con n out =
  match (y,con) with
  | (_,[]) -> out @ y
  | (_::a,(_,m)::rest) ->
    (if n=m then get_ans a rest (n+1) out
    else
      (let (y',out') = get_ans_loop y (m-n+1) [] in
        get_ans y' rest (m+1) (out @ out')))
  | _ -> print_string "get_ans\n"; raise EvalErr

let rec unify_body con c1 c2 output =
  match c1 with
  | [] -> output
  | x::xs ->
    (let output' =
      (let rec loop c out =
        match c with
        | [] -> out
        | y::ys ->
          (if (satisfy x y con) then loop ys ((x @ (get_ans y con 0 []))::out)
          else loop ys out)
        in loop c2 [])
      in unify_body con xs c2 output')

let rec indx x v n =
  match v with 
  | [] -> print_string "indx\n"; raise EvalErr
  | y::ys ->
    (if x=y then n
    else indx x ys (n+1))

let rec constr v1 v2 n output =
  match v2 with
  | [] -> output
  | x::rest ->
    (if (isin x v1) then constr v1 rest (n+1) ((indx x v1 0, n)::output)
    else constr v1 rest (n+1) output)

let rec subst v1 v2 output =
  match v1 with
  | [] -> output
  | x::rest ->
    (if (isin x v2) then
      subst rest v2 (x::output)
    else subst rest v2 output)

let unify v1 v2 c1 c2 =
  let sigma = v2 @ (List.rev (subst v1 v2 [])) in
  let con = constr v1 v2 0 [] in
  (sigma,unify_body con c1 c2 [])

let judge_and n1 const_list1 n2 const_list2 env =
  let val_list1 = find_val const_list1 in
  let con_list1 = List.rev (find_con (List.rev const_list1)) in
  let output_list1 = find_match n1 con_list1 env [] in
  let val_list2 = find_val const_list2 in
  let con_list2 = List.rev (find_con (List.rev const_list2)) in
  let output_list2 = find_match n2 con_list2 env [] in
  let (val_list,output_list) = unify val_list1 val_list2 output_list1 output_list2 in
  print_ans val_list output_list

let rec print_output li =
  match li with
  | [] -> print_string ""
  | x::rest -> print_list x; print_output rest

let rec set_cap_body l index_list out =
  match index_list with
  | [] -> List.rev out
  | x::xs -> set_cap_body l xs ((List.nth l x)::out)

let rec set_cap val_list index_list out =
  match val_list with
  | [] -> out
  | x::xs ->
    set_cap xs index_list ((set_cap_body x index_list [])::out)

let rec indxs const_list val_list output =
  match const_list with
  | [] -> output
  | x::xs -> indxs xs val_list ((indx x val_list 0)::output)

let rule_def n const_list n1 const_list1 n2 const_list2 env =
  let val_list1 = find_val const_list1 in
  let con_list1 = List.rev (find_con (List.rev const_list1)) in
  let output_list1 = find_match n1 con_list1 env [] in
  let val_list2 = find_val const_list2 in
  let con_list2 = List.rev (find_con (List.rev const_list2)) in
  let output_list2 = find_match n2 con_list2 env [] in
  let (val_list,output_list) = unify val_list1 val_list2 output_list1 output_list2 in
  let index_list = indxs const_list val_list [] in
  let output_list' = set_cap output_list index_list [] in
  let rec loop li env =
    match li with
    | [] -> env
    | x::rest -> loop rest ((n,x)::env)
  in loop output_list' env

let rec print_env env =
  match env with
  | [] -> print_string ""
  | (n,const_list)::rest -> print_string n; print_string ": "; print_list const_list; print_env rest

let rec eval_expr env expr =
  match expr with
  | EDef (n,e) ->
    let (v,_) = eval_expr env e in
    let val_list = find_val v in
    let const_list = find_con v in
    if val_list=[] then ([], def n const_list env)
    else (find n v env; ([], env))
  | EQuestion (n,e) ->
    let (v,_) = eval_expr env e in
    ask n v env; ([],env)
  | ERuleDef (n,e,n1,e1,n2,e2) ->
    let (v,_) = eval_expr env e in
    let (v1,_) = eval_expr env e1 in
    let (v2,_) = eval_expr env e2 in
    ([], rule_def n v n1 v1 n2 v2 env)
  | EConst n ->
    ([Const n], env)
  | EVar n ->
    ([Var n], env)
  | EList (e1,e2) ->
    let (v1,_) = eval_expr env e1 in
    let (v2,_) = eval_expr env e2 in
    (v1@v2, env)
  | EAnd (n1,e1,n2,e2) ->
    let (v1,_) = eval_expr env e1 in
    let (v2,_) = eval_expr env e2 in
    judge_and n1 v1 n2 v2 env;
    ([], env)

let eval_command env cmd =
  match cmd with
  | CExp expr ->
    (let (_,env') = eval_expr env expr in 
      env')
