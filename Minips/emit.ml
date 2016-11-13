(*minips*)
open Asm

(*external gethi : float -> int32 = "gethi"*)
(*external getlo : float -> int32 = "getlo"*)
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
let offset x = 4 * List.hd (locate x)
let stacksize () = align ((List.length !stackmap + 1) * 4)

let reg r = 
  if is_reg r 
  (*then String.sub r 1 (String.length r - 1)*)
  then String.sub r 0 (String.length r)
  else r

let dump = Printf.fprintf

(*TODO*)
(*let load_label r label =
  "\tlis\t" ^ (reg r) ^ ", ha16(" ^ label ^ ")\n" ^
  "\tADDI\t" ^ (reg r) ^ ", " ^ (reg r) ^ ", lo16(" ^ label ^ ")\n"*)

let load_label r label =
  let r = reg r in
  let r = if r = "r29" then "%r29" else r in
  "\tLA\t" ^ r ^ ", " ^ label ^ "\n"
  
(******)

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

(*let add_per s = "%" ^ s*)
let add_per x = x

let rec g oc = function 
  | (dest, Ans (exp)) -> g' oc (dest, exp)
  | (dest, Let((x, t), exp, e)) -> g' oc (NonTail (x), exp); g oc (dest, e)
and g' oc = function 
  | (NonTail(_), Nop) -> ()
  | (NonTail(x), Li(i)) when i >= -32768 && i < 32768 ->
    (* TODO SUBをLIに変えたい *)
    let r = reg x in
    (*Printf.fprintf oc "\tSUB\t%s, %s, %s\n" r r r;*)
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" r reg_zero i
  | (NonTail(x), Li(i)) ->
    let n = i lsr 16 in
    let m = i lxor (n lsl 16) in
    let r = reg x in
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" r reg_zero n;
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_tmp reg_zero 16;
    Printf.fprintf oc "\tSLL\t%s, %s, %s\n" r r reg_tmp;
    Printf.fprintf oc "\tORI\t%s, %s, %d\n" r r m
  | (NonTail(x), FLi(Id.L(l))) ->
    let s = load_label reg_tmp l in
    Printf.fprintf oc "%s\tLWC1\t%s, 0(%s)\n" s (reg x) reg_tmp
  | (NonTail(x), SetL(Id.L(y))) -> 
    let s = load_label x y in
    Printf.fprintf oc "%s" s
  | (NonTail(x), Mr(y)) when x = y -> ()
  | (NonTail(x), Mr(y)) -> 
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" (reg x) (reg y) 0
  | (NonTail(x), Neg(y)) ->
    let r = reg x in
    (* TODO NEG命令に変えたい *)
    Printf.fprintf oc "\tSUB\t%s, %s\n" r r; 
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" (reg x) (reg y) 0
  | (NonTail(x), Add(y, V(z))) ->
    Printf.fprintf oc "\tADD\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), Add(y, C(z))) -> 
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" (reg x) (reg y) z
  | (NonTail(x), Sub(y, V(z))) -> 
    Printf.fprintf oc "\tSUB\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), Sub(y, C(z))) -> 
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" (reg x) (reg y) (-1 * z)
  (* TODO *)
  (*| (NonTail(x), Mul(y, V(z))) -> 
    Printf.fprintf oc "\tMUL\t%s, %s, %s\n" (reg x) (reg y) (reg z)
    | (NonTail(x), Mul(y, C(z))) -> 
    Printf.fprintf oc "\tMULLI\t%s, %s, %d\n" (reg x) (reg y) z
    | (NonTail(x), Div(y, V(z))) -> 
    Printf.fprintf oc "\tDIV\t%s, %s, %s\n" (reg x) (reg y) (reg z)
    | (NonTail(x), Div(y, C(z))) -> 
    Printf.fprintf oc "\tDIVI\t%s, %s, %d\n" (reg x) (reg y) z*)
  | (NonTail(x), Sll(y, V(z))) -> 
    Printf.fprintf oc "\tSLL\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), Sll(y, C(z))) ->
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_tmp reg_zero z;
    Printf.fprintf oc "\tSLL\t%s, %s, %s\n" (reg x) (reg y) reg_tmp
  | (NonTail(x), Lw(y, V(z))) ->
    let rx = reg x in
    let ry = reg y in
    let rz = reg z in
    Printf.fprintf oc "\tADD\t%s, %s, %s\n" ry ry rz;
    Printf.fprintf oc "\tLW\t%s, %d(%s)\n" rx 0 ry
  | (NonTail(x), Lw(y, C(z))) ->
    Printf.fprintf oc "\tLW\t%s, %d(%s)\n" (reg x) z (reg y)
  | (NonTail(_), Sw(x, y, V(z))) ->
    let rx = reg x in
    let ry = reg y in
    let rz = reg z in
    Printf.fprintf oc "\tADD\t%s, %s, %s\n" ry ry rz;
    Printf.fprintf oc "\tSW\t%s, %d(%s)\n" rx 0 ry
  | (NonTail(_), Sw(x, y, C(z))) -> 
    Printf.fprintf oc "\tSW\t%s, %d(%s)\n" (reg x) z (reg y)
  (* TODO floating-point instructions *)
  | (NonTail(x), FMr(y)) when x = y -> ()
  | (NonTail(x), FMr(y)) -> 
    (*Printf.fprintf oc "\tfmr\t%s, %s\n" (reg x) (reg y)*)
    Printf.fprintf oc "\tADD.s\t%s, %s, %s\n" (reg x) (reg y) reg_fzero
  | (NonTail(x), FNeg(y)) -> 
    (*Printf.fprintf oc "\tfneg\t%s, %s\n" (reg x) (reg y)*)
    Printf.fprintf oc "\tSUB.s\t%s, %s, %s\n" (reg x) reg_fzero (reg y)
  | (NonTail(x), FAdd(y, z)) -> 
    Printf.fprintf oc "\tADD.s\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), FSub(y, z)) -> 
    Printf.fprintf oc "\tSUB.s\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), FMul(y, z)) -> 
    Printf.fprintf oc "\tMUL.s\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), FDiv(y, z)) -> 
    Printf.fprintf oc "\tDIV.s\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), Lfd(y, V(z))) ->
    let rx = reg x in
    let ry = reg y in
    let rz = reg z in
    Printf.fprintf oc "\tADD.s\t%s, %s, %s\n" ry ry rz;
    Printf.fprintf oc "\tLWC1\t%s, %d(%s)\n" (reg x) 0 (reg z)
  | (NonTail(x), Lfd(y, C(z))) -> 
    Printf.fprintf oc "\tLWC1\t%s, %d(%s)\n" (reg x) z (reg y)
  | (NonTail(_), Stfd(x, y, V(z))) ->
    let rx = reg x in
    let ry = reg y in
    let rz = reg z in
    Printf.fprintf oc "\tADD.s\t%s, %s, %s\n" ry ry rz;
    Printf.fprintf oc "\tSWC1\t%s, %d(%s)\n" (reg x) 0 (reg z)
  | (NonTail(_), Stfd(x, y, C(z))) ->
    Printf.fprintf oc "\tSWC1\t%s, %d(%s)\n" (reg x) z (reg y)
  (********************)
  | (NonTail(_), Comment(s)) -> Printf.fprintf oc "#\t%s\n" s
  (* �����β���̿���μ��� *)
  | (NonTail(_), Save(x, y))
    when List.mem x allregs && not (S.mem y !stackset) ->
    save y;
    Printf.fprintf oc "\tSW\t%s, %d(%s)\n" (reg x) (offset y) reg_sp
  (* TODO *)
  | (NonTail(_), Save(x, y))
    when List.mem x allfregs && not (S.mem y !stackset) ->
    savef y;
    Printf.fprintf oc "\tSWC1\t%s, %d(%s)\n" (reg x) (offset y) reg_sp
  | (NonTail(_), Save(x, y)) -> assert (S.mem y !stackset); ()
  | (NonTail(x), Restore(y)) when List.mem x allregs ->
    Printf.fprintf oc "\tLW\t%s, %d(%s)\n" (reg x) (offset y) reg_sp
  (* TODO *)
  | (NonTail(x), Restore(y)) ->
    assert (List.mem x allfregs);
    Printf.fprintf oc "\tLWC1\t%s, %d(%s)\n" (reg x) (offset y) reg_sp
  | (Tail, (Nop | Sw _ | Stfd _ | Comment _ | Save _ as exp)) ->
    g' oc (NonTail(Id.gentmp Type.Unit), exp);
    Printf.fprintf oc "\tJR\t%%r31\n";
  | (Tail, (Li _ | SetL _ | Mr _ | Neg _ | Add _ | Sub _ |  (*TOOD  Mul _ | Div _ |*) Sll _ |
            Lw _ as exp)) -> 
    g' oc (NonTail(regs.(0)), exp);
    Printf.fprintf oc "\tJR\t%%r31\n";
  | (Tail, (FLi _ | FMr _ | FNeg _ | FAdd _ | FSub _ | FMul _ | FDiv _ |
            Lfd _ as exp)) ->
    g' oc (NonTail(fregs.(0)), exp);
    Printf.fprintf oc "\tJR\t%%r31\n";
  | (Tail, (Restore(x) as exp)) ->
    (match locate x with
     | [i] -> g' oc (NonTail(regs.(0)), exp)
     | [i; j] when (i + 1 = j) -> g' oc (NonTail(fregs.(0)), exp)
     | _ -> assert false);
    Printf.fprintf oc "\tJR\t%%r31\n";
    (********************************)
  | (Tail, IfEq(x, V(y), e1, e2)) ->
    (*Printf.fprintf oc "\tcmpw\tcr7, %s, %s\n" (reg x) (reg y);*)
    g'_tail_if oc e1 e2 "BEQ" "BNE" (reg x) (reg y)
  | (Tail, IfEq(x, C(y), e1, e2)) ->
    (*Printf.fprintf oc "\tcmpwi\tcr7, %s, %d\n" (reg x) y;*)
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_cmp reg_zero y;
    g'_tail_if oc e1 e2 "BEQ" "BNE" (reg x) (add_per reg_cmp)
  | (Tail, IfLE(x, V(y), e1, e2)) ->
    Printf.fprintf oc "\tSLT\t%s, %s, %s\n" reg_cmp (reg x) (reg y);
    g'_tail_if oc e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  | (Tail, IfLE(x, C(y), e1, e2)) ->
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_cmp reg_zero y;
    Printf.fprintf oc "\tSLT\t%s, %s, %s\n" reg_cmp reg_cmp (reg x);
    g'_tail_if oc e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  (* TODO : LEとGEの向きの確認 => 解決*)
  | (Tail, IfGE(x, V(y), e1, e2)) ->
    Printf.fprintf oc "\tSLT\t%s, %s, %s\n" reg_cmp (reg y) (reg x);
    g'_tail_if oc e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  | (Tail, IfGE(x, C(y), e1, e2)) ->
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_cmp reg_zero y;
    Printf.fprintf oc "\tSLT\t%s, %s, %s\n" reg_cmp (reg x) reg_cmp;
    g'_tail_if oc e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  (* TODO *)
  (* 今は適当に型を合わせている float用のcompの仕様が決まるまで待つ *)
  | (Tail, IfFEq(x, y, e1, e2)) ->
    (*Printf.fprintf oc "\tfcmpu\tcr7, %s, %s\n" (reg x) (reg y);*)
    Printf.fprintf oc "\tC.eq.s\t%s, %s, %s\n" reg_cmp (reg x) (reg y);
    g'_tail_if oc e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  | (Tail, IfFLE(x, y, e1, e2)) ->
    (*Printf.fprintf oc "\tfcmpu\tcr7, %s, %s\n" (reg x) (reg y);*)
    Printf.fprintf oc "\tC.lt.s\t%s, %s, %s\n" reg_cmp (reg y) (reg x);
    g'_tail_if oc e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  (*********)
  | (NonTail(z), IfEq(x, V(y), e1, e2)) ->
    g'_non_tail_if oc (NonTail(z)) e1 e2 "BEQ" "BNE" (reg x) (reg y)
  | (NonTail(z), IfEq(x, C(y), e1, e2)) ->
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_cmp reg_zero y;
    (*g'_non_tail_if oc (NonTail(z)) e1 e2 "BEQ" "BNE" (reg x) (add_per reg_cmp)*)
  | (NonTail(z), IfLE(x, V(y), e1, e2)) ->
    Printf.fprintf oc "\tSLT\t%s, %s, %s\n" reg_cmp (reg x) (reg y);
    g'_non_tail_if oc (NonTail(z)) e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  | (NonTail(z), IfLE(x, C(y), e1, e2)) ->
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_cmp reg_zero y;
    Printf.fprintf oc "\tSLT\t%s, %s, %s\n" reg_cmp reg_cmp (reg x);
    g'_non_tail_if oc (NonTail(z)) e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  | (NonTail(z), IfGE(x, V(y), e1, e2)) ->
    Printf.fprintf oc "\tSLT\t%s, %s, %s\n" reg_cmp (reg y) (reg x);
    g'_non_tail_if oc (NonTail(z)) e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  | (NonTail(z), IfGE(x, C(y), e1, e2)) ->
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_cmp reg_zero y;
    Printf.fprintf oc "\tSLT\t%s, %s, %s\n" reg_cmp (reg x) reg_cmp;
    g'_non_tail_if oc (NonTail(z)) e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  (* TODO *)
  (* 型だけ適当に合わせている *)
  | (NonTail(z), IfFEq(x, y, e1, e2)) ->
    (*Printf.fprintf oc "\tfcmpu\tcr7, %s, %s\n" (reg x) (reg y);*)
    Printf.fprintf oc "\tC.eq.s\t%s, %s, %s\n" reg_cmp (reg x) (reg y);
    g'_non_tail_if oc (NonTail(z)) e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
    (*g'_non_tail_if oc (NonTail(z)) e1 e2 "BEQ" "BNE" (reg x) (reg y)*)
  | (NonTail(z), IfFLE(x, y, e1, e2)) ->
    Printf.fprintf oc "\tC.lt.s\t%s, %s, %s\n" reg_cmp (reg y) (reg x);
    g'_non_tail_if oc (NonTail(z)) e1 e2 "BEQ" "BNE" (add_per reg_cmp) (add_per reg_zero)
  (*****************************************************)
  | (Tail, CallCls(x, ys, zs)) ->
    g'_args oc [(x, reg_cl)] ys zs;
    Printf.fprintf oc "\tLW\t%s, 0(%s)\n" (reg reg_sw) (reg reg_cl);
    Printf.fprintf oc "\tJR\t%s\n" (reg reg_sw);
  | (Tail, CallDir(Id.L(x), ys, zs)) ->
    g'_args oc [] ys zs;
    Printf.fprintf oc "\tJ\t%s\n" x
  | (NonTail(a), CallCls(x, ys, zs)) ->
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_tmp reg_link 0;
    g'_args oc [(x, reg_cl)] ys zs;
    let ss = stacksize () in
    Printf.fprintf oc "\tSW\t%s, %d(%s)\n" reg_tmp (ss - 4) reg_sp;
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_sp reg_sp ss;
    Printf.fprintf oc "\tLW\t%s, 0(%s)\n" reg_tmp (reg reg_cl);
    (*おそらくjamp and linkでいいと思うけどbctrlが何かいまいちわからない*)
    Printf.fprintf oc "\tJALR\t%s\n" reg_tmp;
    (*
    subiがないのでreg_tmpにimmを一時的に入れてSUBを使う.
    大丈夫なはず.
    *)
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_tmp reg_zero ss;
    Printf.fprintf oc "\tSUB\t%s, %s,%s\n" reg_sp reg_sp reg_tmp;
    Printf.fprintf oc "\tLW\t%s, %d(%s)\n" reg_tmp (ss - 4) reg_sp;
    (if List.mem a allregs && a <> regs.(0) then 
       Printf.fprintf oc "\tADDI\t%s, %s, %d\n" (reg a) (reg regs.(0)) 0 
     else if List.mem a allfregs && a <> fregs.(0) then
       (* TODO *) 
       (*Printf.fprintf oc "\tFMR\t%s, %s\n" (reg a) (reg fregs.(0)));*)
       Printf.fprintf oc "\tADD.s\t%s, %s, %s\n" (reg x) (reg fregs.(0)) reg_fzero);
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_link reg_tmp 0
  | (NonTail(a), CallDir(Id.L(x), ys, zs)) -> 
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_tmp reg_link 0;
    g'_args oc [] ys zs;
    let ss = stacksize () in
    Printf.fprintf oc "\tSW\t%s, %d(%s)\n" reg_tmp (ss - 4) reg_sp;
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_sp reg_sp ss;
    Printf.fprintf oc "\tJAL\t%s\n" x;
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_tmp reg_zero ss;
    Printf.fprintf oc "\tSUB\t%s, %s, %s\n" reg_sp reg_sp reg_tmp;
    Printf.fprintf oc "\tLW\t%s, %d(%s)\n" reg_tmp (ss - 4) reg_sp;
    (if List.mem a allregs && a <> regs.(0) then
       Printf.fprintf oc "\tADDI\t%s, %s, %d\n" (reg a) (reg regs.(0)) 0
     else if List.mem a allfregs && a <> fregs.(0) then
       (* TODO *)
       (*Printf.fprintf oc "\tFMR\t%s, %s\n" (reg a) (reg fregs.(0)));*)
       Printf.fprintf oc "\tADD.s\t%s, %s, %s\n" (reg a) (reg fregs.(0)) reg_fzero);
    Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_link reg_tmp 0
(* g'_tail_if oc e1 e2 b bn は元々は
   bnでcr7を見ながらe2に飛ぶ
   飛ばない場合はe1を続ける. 
   今は rxとryを比べてbnでb_elseにジャンプする.

   bとbnを入れ替えた
*)
and g'_tail_if oc e1 e2 b bn rx ry = 
  let b_else = Id.genid (b ^ "_else") in
  Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn rx ry b_else;
  let stackset_back = !stackset in
  g oc (Tail, e1);
  Printf.fprintf oc "%s:\n" b_else;
  stackset := stackset_back;
  g oc (Tail, e2)
and g'_non_tail_if oc dest e1 e2 b bn rx ry =
  let b_else = Id.genid (b ^ "_else") in
  let b_cont = Id.genid (b ^ "_cont") in
  Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn rx ry b_else;
  let stackset_back = !stackset in
  g oc (dest, e1);
  let stackset1 = !stackset in
  Printf.fprintf oc "\tJ\t%s\n" b_cont;
  Printf.fprintf oc "%s:\n" b_else;
  stackset := stackset_back;
  g oc (dest, e2);
  Printf.fprintf oc "%s:\n" b_cont;
  let stackset2 = !stackset in
  stackset := S.inter stackset1 stackset2
and g'_args oc x_reg_cl ys zs = 
  let (i, yrs) = 
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl) ys in
  List.iter
    (fun (y, r) -> Printf.fprintf oc "\tADDI\t%s, %s, %d\n" (reg r) (reg y) 0)
    (shuffle reg_sw yrs);
  let (d, zfrs) = 
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, []) zs in
  List.iter
    (* TODO *)
    (*(fun (z, fr) -> Printf.fprintf oc "\tFMR\t%s, %s\n" (reg fr) (reg z))*)
    (fun (z, fr) -> Printf.fprintf oc "\tADD.s\t%s, %s, %s\n" (reg fr) (reg z) reg_fzero)
    (shuffle reg_fsw zfrs)

let h oc { name = Id.L(x); args = _; fargs = _; body = e; ret = _ } =
  Printf.fprintf oc "%s:\n" x;
  stackset := S.empty;
  stackmap := [];
  g oc (Tail, e)

let f oc (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  (if data <> [] then
     (Printf.fprintf oc "\t.data\n"; (* "\t.literal8\n";*)
      List.iter
        (fun (Id.L(x), d) ->
           (*Printf.fprintf oc "\t.align 3\n";*)
           Printf.fprintf oc "%s:\t # %f\n" x d;
           Printf.fprintf oc "\t.word\t%ld\n" (get32 d))
        (*Printf.fprintf oc "\t.long\t%ld\n" (gethi d);*)
        (*Printf.fprintf oc "\t.long\t%ld\n" (getlo d))*)
        data));
  (* TODO *)
  Printf.fprintf oc "\t.text\n";
  Printf.fprintf oc "\t.globl  _min_caml_start\n";
  (*Printf.fprintf oc "\t.align 2\n";*)
  List.iter (fun fundef -> h oc fundef) fundefs;
  Printf.fprintf oc "_min_caml_start: # main entry point\n";
  (*Printf.fprintf oc "main: # main entry point\n";*)
  (*Printf.fprintf oc "\tmflr\tr0\n";*)
  Printf.fprintf oc "\tSUB\t%s, %s, %s\n" reg_zero reg_zero reg_zero;
  Printf.fprintf oc "\tADDI\t%s, %s, %d\n" reg_hp reg_zero (*65535*) 1000;
  (* TODO どうしよう *)
  (*Printf.fprintf oc "\tstmw\tr30, -8(r1)\n";
    Printf.fprintf oc "\tstw\tr0, 8(r1)\n";
    Printf.fprintf oc "\tstwu\tr1, -96(r1)\n";*)
  Printf.fprintf oc "   # main program start\n";
  stackset := S.empty;
  stackmap := [];
  g oc (NonTail("_R_0"), e);
  Printf.fprintf oc "   # main program end\n";
  (* TODO どうしよう *)
  (*Printf.fprintf oc "\tmr\tr3, %s\n" regs.(0);
    Printf.fprintf oc "\tlwz\tr1, 0(r1)\n";
    Printf.fprintf oc "\tlwz\tr0, 8(r1)\n";
    Printf.fprintf oc "\tmtlr\tr0\n";
    Printf.fprintf oc "\tlmw\tr30, -8(r1)\n";
    Printf.fprintf oc "\tblr\n"*)

