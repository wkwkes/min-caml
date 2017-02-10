(*minips*)
open Asm
open Native

(* 命令のリスト *)
let instrs = ref []
let dump x = instrs := x :: !instrs

external get32 : float -> int32 = "get32"

let stackset = ref S.empty
let stackmap = ref [] 
let save x = 
  stackset := S.add x !stackset;
  if not (List.mem x !stackmap) then
    stackmap := !stackmap @ [x]
let savef x = 
  stackset := S.add x !stackset;
  if not (List.mem x !stackmap) then
    (let pad = 
       if List.length !stackmap mod 2 = 0 then [] else [Id.gentmp Type.Int] in
     stackmap := !stackmap @ pad @ [x; x])
let locate x = 
  let rec loc = function 
    | [] -> []
    | y :: zs when x = y -> 0 :: List.map succ (loc zs)
    | y :: zs -> List.map succ (loc zs) in
  loc !stackmap
let offset x = List.hd (locate x)
let stacksize () = align ((List.length !stackmap + 1))
(* have to investigate in detail *)
(*let stacksize () = (List.length !stackmap + 1) * 4*)

let reg r = 
  if is_reg r 
  (*then String.sub r 1 (String.length r - 1)*)
  then String.sub r 0 (String.length r)
  else r

let load_label r label =
  let r = reg r in
  let r = if r = "r29" then "%r29" else r in
  "\tLA\t" ^ r ^ ", " ^ label ^ "\n"

let rec shuffle sw xys = 
  (* remove identical moves *)
  let (_, xys) = List.partition (fun (x, y) -> x = y) xys in
  (* find acyclic moves *)
  match List.partition (fun (_, y) -> List.mem_assoc y xys) xys with
  | ([], []) -> []
  | ((x, y) :: xys, []) -> (* no acyclic moves; resolve a cyclic move *)
      (y, sw) :: (x, y) ::
      shuffle sw (List.map (function 
          | (y', z) when y = y' -> (sw, z)
          | yz -> yz) xys)
  | (xys, acyc) -> acyc @ shuffle sw xys

type dest = Tail | NonTail of Id.t

let rec g = function
  | (dest, Ans (exp)) -> g' (dest, exp)
  | (dest, Let((x, t), exp, e)) -> g' (NonTail (x), exp); g (dest, e)
and g' = function
  | (NonTail(_), Nop) -> ()
  | (NonTail(x), Li(i)) when i >= -32768 && i < 32768 ->
      let r = reg x in
      dump (ADDI (r, reg_zero, i))
  | (NonTail(x), Li(i)) ->
      let n = i lsr 16 in
      let m = i lxor (n lsl 16) in
      let r = reg x in
      dump (ADDI (r, reg_zero, n));
      dump (SLL (r, r, 16));
      dump (ORI (r, r, m))
  | (NonTail(x), FLi(Id.L(l))) ->
      let s = load_label reg_tmp l in
      (*dump oc "%s\tLWC1\t%s, 0(%s)\n" s (reg x) reg_tmp*)
      dump (OTHERS (Printf.sprintf "%s\tLWC1\t%s, 0(%s)\n" s (reg x) reg_tmp))
  | (NonTail(x), SetL(Id.L(y))) -> 
      let s = load_label x y in
      dump (OTHERS (Printf.sprintf "%s" s))
  | (NonTail(x), Mr(y)) when x = y -> ()
  | (NonTail(x), Mr(y)) -> 
      dump (ADDI ((reg x), (reg y), 0))
  | (NonTail(x), Neg(y)) ->
      dump (SUB (reg_tmp, reg_zero, (reg y)));
      dump (ADDI ((reg x), reg_tmp, 0))
  | (NonTail(x), Add(y, V(z))) ->
      dump (ADD ((reg x), (reg y), (reg z)))
  | (NonTail(x), Add(y, C(z))) -> 
      dump (ADDI ((reg x), (reg y), z))
  | (NonTail(x), Sub(y, V(z))) -> 
      dump (SUB ((reg x), (reg y), (reg z)))
  | (NonTail(x), Sub(y, C(z))) -> 
      dump (ADDI ((reg x), (reg y), (-1 * z)))
  | (NonTail(x), Mul(y, V(z))) -> 
      dump (SLL ((reg x), (reg y), 2))
  | (NonTail(x), Mul(y, C(z))) ->
      dump (SLL ((reg x), (reg y), 2))
  | (NonTail(x), Div(y, V(z))) -> 
      dump (SRA ((reg x), (reg y), 1))
  | (NonTail(x), Div(y, C(z))) -> 
      dump (SRA ((reg x), (reg y), 1))
  | (NonTail(x), Sll(y, V(z))) ->
      (* どうすんの？ *)
      dump (OTHERS (Printf.sprintf "\tSLL\t%s, %s, %s\n" (reg x) (reg y) (reg z)))
  | (NonTail(x), Sll(y, C(z))) ->
      dump (SLL ((reg x), (reg y), z))
  | (NonTail(x), Lw(y, V(z))) ->
      dump (ADD (reg_tmp, (reg y), (reg z)));
      dump (LW ((reg x), 0, reg_tmp))
  | (NonTail(x), Lw(y, C(z))) ->
      dump (LW ((reg x), z, (reg y)))
  | (NonTail(_), Sw(x, y, V(z))) ->
      dump (ADD (reg_tmp, (reg y), (reg z)));
      dump (SW ((reg x), 0, reg_tmp))
  | (NonTail(_), Sw(x, y, C(z))) -> 
      dump (SW ((reg x), z, (reg y)))
  | (NonTail(x), FMr(y)) when x = y -> ()
  | (NonTail(x), FMr(y)) -> 
      dump (ADD_S ((reg x), (reg y), reg_fzero))
  | (NonTail(x), FNeg(y)) -> 
      dump (SUB_S ((reg x), reg_fzero, (reg y)))
  | (NonTail(x), FAdd(y, z)) -> 
      dump (ADD_S ((reg x), (reg y), (reg z)))
  | (NonTail(x), FSub(y, z)) -> 
      dump (SUB_S ((reg x), (reg y), (reg z)))
  | (NonTail(x), FMul(y, z)) -> 
      dump (MUL_S ((reg x), (reg y), (reg z)))
  | (NonTail(x), FDiv(y, z)) -> 
      dump (DIV_S ((reg x), (reg y), (reg z)))
  | (NonTail(x), Lfd(y, V(z))) ->
      dump (ADD (reg_tmp, (reg y), (reg z)));
      dump (LWC1 ((reg x), 0, reg_tmp))
  | (NonTail(x), Lfd(y, C(z))) -> 
      dump (LWC1 ((reg x), z, (reg y)))
  | (NonTail(_), Stfd(x, y, V(z))) ->
      dump (ADD (reg_tmp, (reg y), (reg z)));
      dump (SWC1 ((reg x), 0, reg_tmp))
  | (NonTail(_), Stfd(x, y, C(z))) ->
      dump (SWC1 ((reg x), z, (reg y)))
  | (NonTail(_), Comment(s)) -> dump (OTHERS (Printf.sprintf "#\t%s\n" s))
  | (NonTail(_), Save(x, y))
    when List.mem x allregs && not (S.mem y !stackset) ->
      save y;
      dump (SW ((reg x), (offset y), reg_sp))
  (* TODO *)
  | (NonTail(_), Save(x, y))
    when List.mem x allfregs && not (S.mem y !stackset) ->
      savef y;
      dump (SWC1 ((reg x), (offset y), reg_sp))
  | (NonTail(_), Save(x, y)) -> assert (S.mem y !stackset); ()
  | (NonTail(x), Restore(y)) when List.mem x allregs ->
      dump (LW ((reg x), (offset y), reg_sp))
  | (NonTail(x), Restore(y)) ->
      assert (List.mem x allfregs);
      dump (LWC1 ((reg x), (offset y), reg_sp))
  | (Tail, (Nop | Sw _ | Stfd _ | Comment _ | Save _ as exp)) ->
      g' (NonTail(Id.gentmp Type.Unit), exp);
      dump (OTHERS "\tJR\t%r31\n")
  | (Tail, (Li _ | SetL _ | Mr _ | Neg _ | Add _ | Sub _ | Mul _ | Div _ | Sll _ |
            Lw _ as exp)) -> 
      g' (NonTail(regs.(0)), exp);
      dump (OTHERS "\tJR\t%r31\n")
  | (Tail, (FLi _ | FMr _ | FNeg _ | FAdd _ | FSub _ | FMul _ | FDiv _ |
            Lfd _ as exp)) ->
      g' (NonTail(fregs.(0)), exp);
      dump (OTHERS "\tJR\t%r31\n")
  | (Tail, (Restore(x) as exp)) ->
      (match locate x with
       | [i] -> g' (NonTail(regs.(0)), exp)
       | [i; j] when (i + 1 = j) -> g' (NonTail(fregs.(0)), exp)
       | _ -> assert false);
      dump (OTHERS "\tJR\t%r31\n")
  | (Tail, IfEq(x, V(y), e1, e2)) ->
      g'_tail_if  e1 e2 "BEQ" "BNE" (reg x) (reg y)
  | (Tail, IfEq(x, C(y), e1, e2)) ->
      dump (ADDI (reg_cmp, reg_zero, y));
      g'_tail_if  e1 e2 "BEQ" "BNE" (reg x) reg_cmp
  | (Tail, IfLE(x, V(y), e1, e2)) ->
      dump (SLT (reg_cmp, (reg y), (reg x)));
      g'_tail_if  e1 e2 "BEQ" "BNE" reg_cmp reg_zero
  | (Tail, IfLE(x, C(y), e1, e2)) ->
      dump (ADDI (reg_cmp, reg_zero, y));
      dump (SLT (reg_cmp, reg_cmp, (reg x)));
      g'_tail_if  e1 e2 "BEQ" "BNE" reg_cmp reg_zero
  | (Tail, IfGE(x, V(y), e1, e2)) ->
      dump (SLT (reg_cmp, (reg y), (reg x)));
      g'_tail_if  e1 e2 "BEQ" "BNE" reg_cmp reg_zero
  | (Tail, IfGE(x, C(y), e1, e2)) ->
      dump (ADDI (reg_cmp, reg_zero, y));
      dump (SLT (reg_cmp, (reg x), reg_cmp)); 
      g'_tail_if  e1 e2 "BEQ" "BNE" reg_cmp reg_zero
  | (Tail, IfFEq(x, y, e1, e2)) ->
      dump (C_EQ_S (reg_cmp, (reg x), (reg y)));
      g'_tail_if  e2 e1 "BEQ" "BNE" reg_cmp reg_zero
  | (Tail, IfFLE(x, y, e1, e2)) ->
      dump (C_LT_S (reg_cmp, (reg y), (reg x)));
      g'_tail_if  e1 e2 "BEQ" "BNE" reg_cmp reg_zero
  | (NonTail(z), IfEq(x, V(y), e1, e2)) ->
      g'_non_tail_if  (NonTail(z)) e1 e2 "BEQ" "BNE" (reg x) (reg y)
  | (NonTail(z), IfEq(x, C(y), e1, e2)) ->
      dump (ADDI (reg_cmp, reg_zero, y));
      g'_non_tail_if  (NonTail(z)) e1 e2 "BEQ" "BNE" (reg x) reg_cmp
  | (NonTail(z), IfLE(x, V(y), e1, e2)) ->
      dump (SLT (reg_cmp, (reg y), (reg x)));
      g'_non_tail_if  (NonTail(z)) e1 e2 "BEQ" "BNE" reg_cmp reg_zero
  | (NonTail(z), IfLE(x, C(y), e1, e2)) ->
      dump (ADDI (reg_cmp, reg_zero, y));
      dump (SLT (reg_cmp, reg_cmp, (reg x)));
      g'_non_tail_if  (NonTail(z)) e1 e2 "BEQ" "BNE" reg_cmp reg_zero
  | (NonTail(z), IfGE(x, V(y), e1, e2)) ->
      dump (SLT (reg_cmp, (reg y), (reg x)));
      g'_non_tail_if  (NonTail(z)) e1 e2 "BEQ" "BNE" reg_cmp reg_zero
  | (NonTail(z), IfGE(x, C(y), e1, e2)) ->
      dump (ADDI (reg_cmp, reg_zero, y));
      dump (SLT (reg_cmp, (reg x), reg_cmp));
      g'_non_tail_if  (NonTail(z)) e1 e2 "BEQ" "BNE" reg_cmp reg_zero
  | (NonTail(z), IfFEq(x, y, e1, e2)) ->
      dump (C_EQ_S (reg_cmp, (reg x), (reg y)));
      g'_non_tail_if  (NonTail(z)) e2 e1 "BEQ" "BNE" reg_cmp reg_zero
  | (NonTail(z), IfFLE(x, y, e1, e2)) ->
      dump  (C_LE_S (reg_cmp, (reg y), (reg x)));
      g'_non_tail_if  (NonTail(z)) e1 e2 "BEQ" "BNE" reg_cmp reg_zero
  | (Tail, CallCls(x, ys, zs)) ->
      g'_args  [(x, reg_cl)] ys zs;
      dump (LW ((reg reg_sw), 0, (reg reg_cl)));
      dump (OTHERS (Printf.sprintf "\tJR\t%s\n" (reg reg_sw)));
  | (Tail, CallDir(Id.L(x), ys, zs)) ->
      g'_args  [] ys zs;
      dump (OTHERS (Printf.sprintf "\tJ\t%s\n" x))
  | (NonTail(a), CallCls(x, ys, zs)) ->
      dump (ADDI (reg_tmp, reg_link, 0));
      g'_args  [(x, reg_cl)] ys zs;
      let ss = stacksize () in
      dump  (SW (reg_tmp, (ss - 1), reg_sp));
      dump  (ADDI (reg_sp, reg_sp, ss));
      dump  (LW (reg_tmp, 0, (reg reg_cl)));
      dump  (OTHERS (Printf.sprintf "\tJALR\t%s\n" reg_tmp));
      dump  (ADDI (reg_tmp, reg_zero, ss));
      dump  (SUB (reg_sp, reg_sp, reg_tmp));
      dump  (LW (reg_tmp, (ss - 1), reg_sp));
      (if List.mem a allregs && a <> regs.(0) then 
         dump  (ADDI ((reg a), (reg regs.(0)), 0)) 
       else if List.mem a allfregs && a <> fregs.(0) then
         dump  (ADD_S ((reg x), (reg fregs.(0)), reg_fzero));
       dump  (ADDI (reg_link, reg_tmp, 0)))
  | (NonTail(a), CallDir(Id.L(x), ys, zs)) -> 
      dump  (ADDI (reg_tmp, reg_link, 0));
      g'_args  [] ys zs;
      let ss = stacksize () in
      dump  (SW (reg_tmp, (ss - 1), reg_sp));
      dump  (ADDI (reg_sp, reg_sp, ss));
      dump  (OTHERS (Printf.sprintf "\tJAL\t%s\n" x));
      dump  (ADDI (reg_tmp, reg_zero, ss));
      dump  (SUB (reg_sp, reg_sp, reg_tmp));
      dump  (LW (reg_tmp, (ss - 1), reg_sp));
      (if List.mem a allregs && a <> regs.(0) then
         dump  (ADDI ((reg a), (reg regs.(0)), 0))
       else if List.mem a allfregs && a <> fregs.(0) then
         dump (ADD_S ((reg a), (reg fregs.(0)), reg_fzero));
       dump  (ADDI (reg_link, reg_tmp, 0)))
and g'_tail_if e1 e2 b bn rx ry = 
  let b_else = Id.genid (b ^ "_else") in
  dump  (OTHERS (Printf.sprintf "\t%s\t%s, %s, %s\n" bn rx ry b_else));
  let stackset_back = !stackset in
  g  (Tail, e1);
  dump  (OTHERS (Printf.sprintf "%s:\n" b_else));
  stackset := stackset_back;
  g  (Tail, e2)
and g'_non_tail_if  dest e1 e2 b bn rx ry =
  let b_else = Id.genid (b ^ "_else") in
  let b_cont = Id.genid (b ^ "_cont") in
  dump  (OTHERS (Printf.sprintf "\t%s\t%s, %s, %s\n" bn rx ry b_else));
  let stackset_back = !stackset in
  g  (dest, e1);
  let stackset1 = !stackset in
  dump  (OTHERS (Printf.sprintf "\tJ\t%s\n" b_cont));
  dump  (OTHERS (Printf.sprintf "%s:\n" b_else));
  stackset := stackset_back;
  g  (dest, e2);
  dump  (OTHERS (Printf.sprintf "%s:\n" b_cont));
  let stackset2 = !stackset in
  stackset := S.inter stackset1 stackset2
and g'_args  x_reg_cl ys zs =
  let (i, yrs) = 
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl) ys in
  List.iter
    (fun (y, r) -> dump (ADDI ((reg r), (reg y), 0)))
    (shuffle reg_sw yrs);
  let (d, zfrs) = 
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, []) zs in
  List.iter
    (fun (z, fr) -> dump (ADD_S ((reg fr), (reg z), reg_fzero)))
    (shuffle reg_fsw zfrs)

let h  { name = Id.L(x); args = _; fargs = _; body = e; ret = _ } =
  dump  (OTHERS (Printf.sprintf "%s:\n" x));
  stackset := S.empty;
  stackmap := [];
  g  (Tail, e)

let ff (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  (if data <> [] then
     (dump  (OTHERS "\t.data\n");
      List.iter
        (fun (Id.L(x), d) ->
           dump (OTHERS (Printf.sprintf "%s:\t # %f\n" x d));
           dump (OTHERS (Printf.sprintf "\t.word\t%ld\n" (get32 d))))
        data));
  dump  (OTHERS "\t.text\n");
  dump  (OTHERS "\t.globl  _min_caml_start\n");
  List.iter (fun fundef -> h  fundef) fundefs;
  dump  (OTHERS "_min_caml_start: # main entry point\n");
  dump  (SUB (reg_zero, reg_zero, reg_zero));
  dump  (ADDI (reg_hp, reg_zero, 8192));
  dump  (OTHERS "   # main program start\n");
  stackset := S.empty;
  stackmap := [];
  g  (NonTail("_R_0"), e);
  dump  (OTHERS "halt   # main program end\n"); (List.rev !instrs) (* !instrs *)
(*List.iter (fun x -> print_endline (show_native x)) (List.rev !instrs)*)

let f oc p = 
  let instrs = optpaths (ff p) in
  List.iter (outPut oc) instrs