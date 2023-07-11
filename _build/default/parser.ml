
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | SID of (
# 5 "parser.mly"
       (string)
# 15 "parser.ml"
  )
    | RPAR
    | QUESTION
    | LPAR
    | LID of (
# 5 "parser.mly"
       (string)
# 23 "parser.ml"
  )
    | DOT
    | DEF
    | COMMA
  
end

include MenhirBasics

# 1 "parser.mly"
  
  open Syntax

# 37 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_toplevel) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: toplevel. *)

  | MenhirState02 : (('s, _menhir_box_toplevel) _menhir_cell1_QUESTION, _menhir_box_toplevel) _menhir_state
    (** State 02.
        Stack shape : QUESTION.
        Start symbol: toplevel. *)

  | MenhirState04 : ((('s, _menhir_box_toplevel) _menhir_cell1_QUESTION, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_state
    (** State 04.
        Stack shape : QUESTION const.
        Start symbol: toplevel. *)

  | MenhirState09 : ((('s, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_state
    (** State 09.
        Stack shape : const expr2.
        Start symbol: toplevel. *)

  | MenhirState13 : ((('s, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_state
    (** State 13.
        Stack shape : expr2 expr2.
        Start symbol: toplevel. *)

  | MenhirState21 : (('s, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_state
    (** State 21.
        Stack shape : const.
        Start symbol: toplevel. *)

  | MenhirState24 : ((('s, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_state
    (** State 24.
        Stack shape : const expr2.
        Start symbol: toplevel. *)

  | MenhirState26 : (((('s, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_state
    (** State 26.
        Stack shape : const expr2 const.
        Start symbol: toplevel. *)

  | MenhirState29 : ((((('s, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_state
    (** State 29.
        Stack shape : const expr2 const expr2.
        Start symbol: toplevel. *)

  | MenhirState31 : (((((('s, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_state
    (** State 31.
        Stack shape : const expr2 const expr2 const.
        Start symbol: toplevel. *)

  | MenhirState34 : ((('s, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_state
    (** State 34.
        Stack shape : const expr2.
        Start symbol: toplevel. *)

  | MenhirState36 : (((('s, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_state
    (** State 36.
        Stack shape : const expr2 const.
        Start symbol: toplevel. *)


and ('s, 'r) _menhir_cell1_const = 
  | MenhirCell1_const of 's * ('s, 'r) _menhir_state * (string)

and ('s, 'r) _menhir_cell1_expr2 = 
  | MenhirCell1_expr2 of 's * ('s, 'r) _menhir_state * (Syntax.expr)

and ('s, 'r) _menhir_cell1_QUESTION = 
  | MenhirCell1_QUESTION of 's * ('s, 'r) _menhir_state

and _menhir_box_toplevel = 
  | MenhirBox_toplevel of (Syntax.command) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 40 "parser.mly"
        ( _1 )
# 118 "parser.ml"
     : (string))

let _menhir_action_02 =
  fun _2 _4 ->
    (
# 21 "parser.mly"
                                             ( EQuestion (_2,_4) )
# 126 "parser.ml"
     : (Syntax.expr))

let _menhir_action_03 =
  fun _1 _3 ->
    (
# 22 "parser.mly"
                                    ( EDef (_1,_3) )
# 134 "parser.ml"
     : (Syntax.expr))

let _menhir_action_04 =
  fun _1 _11 _13 _3 _6 _8 ->
    (
# 23 "parser.mly"
                                                                                ( ERuleDef (_1,_3,_6,_8,_11,_13) )
# 142 "parser.ml"
     : (Syntax.expr))

let _menhir_action_05 =
  fun _1 _3 _6 _8 ->
    (
# 24 "parser.mly"
                                                      ( EAnd (_1,_3,_6,_8) )
# 150 "parser.ml"
     : (Syntax.expr))

let _menhir_action_06 =
  fun _1 ->
    (
# 28 "parser.mly"
                      ( EConst (_1) )
# 158 "parser.ml"
     : (Syntax.expr))

let _menhir_action_07 =
  fun _1 ->
    (
# 29 "parser.mly"
                      ( EVar (_1) )
# 166 "parser.ml"
     : (Syntax.expr))

let _menhir_action_08 =
  fun _1 _3 ->
    (
# 30 "parser.mly"
                      ( EList (_1,_3) )
# 174 "parser.ml"
     : (Syntax.expr))

let _menhir_action_09 =
  fun _1 ->
    (
# 34 "parser.mly"
                      ( EConst (_1) )
# 182 "parser.ml"
     : (Syntax.expr))

let _menhir_action_10 =
  fun _1 ->
    (
# 35 "parser.mly"
                      ( EVar (_1) )
# 190 "parser.ml"
     : (Syntax.expr))

let _menhir_action_11 =
  fun _1 _3 ->
    (
# 36 "parser.mly"
                      ( EList (_1,_3) )
# 198 "parser.ml"
     : (Syntax.expr))

let _menhir_action_12 =
  fun _1 ->
    (
# 17 "parser.mly"
              ( CExp (_1) )
# 206 "parser.ml"
     : (Syntax.command))

let _menhir_action_13 =
  fun _1 ->
    (
# 44 "parser.mly"
        ( _1 )
# 214 "parser.ml"
     : (string))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | COMMA ->
        "COMMA"
    | DEF ->
        "DEF"
    | DOT ->
        "DOT"
    | LID _ ->
        "LID"
    | LPAR ->
        "LPAR"
    | QUESTION ->
        "QUESTION"
    | RPAR ->
        "RPAR"
    | SID _ ->
        "SID"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_goto_expr1 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _1 = _v in
          let _v = _menhir_action_12 _1 in
          MenhirBox_toplevel _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_goto_const _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_const : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState34 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState29 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState21 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState26 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState31 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_35 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_const (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_s = MenhirState36 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SID _v ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LID _v ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_13 _1 in
      _menhir_goto_var _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_var : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState13 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState31 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState26 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState21 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_10 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_expr2 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _1 = _v in
          let _v = _menhir_action_07 _1 in
          _menhir_goto_expr2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | RPAR ->
          let _1 = _v in
          let _v = _menhir_action_10 _1 in
          _menhir_goto_expr3 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr2 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState36 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState31 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState26 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState21 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_37 : type  ttv_stack. ((((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_const as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_const (_menhir_stack, _, _6) = _menhir_stack in
          let MenhirCell1_expr2 (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_const (_menhir_stack, _, _1) = _menhir_stack in
          let _8 = _v in
          let _v = _menhir_action_05 _1 _3 _6 _8 in
          _menhir_goto_expr1 _menhir_stack _v _tok
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr2 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2 -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState09 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SID _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LID _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ((((((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_const as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_const (_menhir_stack, _, _11) = _menhir_stack in
          let MenhirCell1_expr2 (_menhir_stack, _, _8) = _menhir_stack in
          let MenhirCell1_const (_menhir_stack, _, _6) = _menhir_stack in
          let MenhirCell1_expr2 (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_const (_menhir_stack, _, _1) = _menhir_stack in
          let _13 = _v in
          let _v = _menhir_action_04 _1 _11 _13 _3 _6 _8 in
          _menhir_goto_expr1 _menhir_stack _v _tok
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr2 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack. ((((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_const as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr2 (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _menhir_s = MenhirState29 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SID _v ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | COMMA ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | DEF ->
              let _menhir_stack = MenhirCell1_expr2 (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState24 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SID _v ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | COMMA ->
              let _menhir_stack = MenhirCell1_expr2 (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState34 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SID _v ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | DOT ->
              let MenhirCell1_const (_menhir_stack, _, _1) = _menhir_stack in
              let _3 = _v in
              let _v = _menhir_action_03 _1 _3 in
              _menhir_goto_expr1 _menhir_stack _v _tok
          | _ ->
              _eRR ())
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr2 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_expr2 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr2 (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_s = MenhirState13 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SID _v ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LID _v ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_QUESTION, _menhir_box_toplevel) _menhir_cell1_const as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_const (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_QUESTION (_menhir_stack, _) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_02 _2 _4 in
          _menhir_goto_expr1 _menhir_stack _v _tok
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr2 (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr3 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_expr2 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState09 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_expr2 -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr2 (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_11 _1 _3 in
      _menhir_goto_expr3 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_11 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2 -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr2 (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_08 _1 _3 in
      _menhir_goto_expr2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_06 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_07 _1 in
      _menhir_goto_expr2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_30 : type  ttv_stack. (((((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_const (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_s = MenhirState31 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SID _v ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LID _v ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const, _menhir_box_toplevel) _menhir_cell1_expr2 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_const (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_s = MenhirState26 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SID _v ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LID _v ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_const (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_s = MenhirState21 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SID _v ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LID _v ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_const as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_06 _1 in
      _menhir_goto_expr2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_15 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_expr2 as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _1 = _v in
          let _v = _menhir_action_06 _1 in
          _menhir_goto_expr2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | RPAR ->
          let _1 = _v in
          let _v = _menhir_action_09 _1 in
          _menhir_goto_expr3 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_QUESTION as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_const (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_s = MenhirState04 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SID _v ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LID _v ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SID _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | QUESTION ->
          let _menhir_stack = MenhirCell1_QUESTION (_menhir_stack, _menhir_s) in
          let _menhir_s = MenhirState02 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SID _v ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let toplevel =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_toplevel v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
