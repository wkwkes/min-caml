type register = string
[@@deriving show]
type t =
  | SWC1 of register * int * register
  | LWC1 of register * int * register
  | SW of register * int * register
  | LW of register * int * register
  | ADD_S of register * register * register
  | SUB_S of register * register * register
  | MUL_S of register * register * register
  | DIV_S of register * register * register
  | C_EQ_S of register * register * register
  | C_LE_S of register * register * register
  | C_LT_S of register * register * register
  | ORI of register * register * int
  (*| ANDI of register * register * int *)
  | ADDI of register * register * int
  (*| BNE *)
  (*| BEQ *)
  (*| JAL of label *)
  (*| J of label *)
  (*| JALR of register *)
  (*| JR of register *)
  | SLL of register * register * int
  | SRA of register * register * int
  | ADD of register * register * register
  | SUB of register * register * register
  (*| AND *)
  (*| OR *)
  (*| XOR *)
  | SLT of register * register * register
  | OTHERS of string (* peephole 最適化しにくい命令 *)
[@@deriving show]

let outPut = Printf.fprintf
let outPut oc = function
  | SWC1 (r1, i ,r2) -> outPut oc "\tSWC1\t%s, %d(%s)\n" r1 i r2
  | LWC1 (r1, i, r2) -> outPut oc "\tLWC1\t%s, %d(%s)\n" r1 i r2
  | SW (r1, i, r2) -> outPut oc "\tSW\t%s, %d(%s)\n" r1 i r2
  | LW (r1, i, r2) -> outPut oc "\tLW\t%s, %d(%s)\n" r1 i r2
  | ADD_S (r1, r2, r3) -> outPut oc "\tADD.s\t%s, %s, %s\n" r1 r2 r3
  | SUB_S (r1, r2, r3) -> outPut oc "\tSUB.s\t%s, %s, %s\n" r1 r2 r3
  | MUL_S (r1, r2, r3) -> outPut oc "\tMUL.s\t%s, %s, %s\n" r1 r2 r3
  | DIV_S (r1, r2, r3) -> outPut oc "\tDIV.s\t%s, %s, %s\n" r1 r2 r3
  | C_EQ_S (r1, r2, r3) -> outPut oc "\tC.eq.s\t%s, %s, %s\n" r1 r2 r3
  | C_LE_S (r1, r2, r3) -> outPut oc "\tC.le.s\t%s, %s, %s\n" r1 r2 r3
  | C_LT_S (r1, r2, r3) -> outPut oc "\tC.lt.s\t%s, %s, %s\n" r1 r2 r3
  | ORI (r1, r2, i) -> outPut oc "\tORI\t%s, %s, %d\n" r1 r2 i
  | ADDI (r1, r2, i) -> outPut oc "\tADDI\t%s, %s, %d\n" r1 r2 i
  | SLL (r1, r2, i) -> outPut oc "\tSLL\t%s, %s, %d\n" r1 r2 i
  | SRA (r1, r2, i) -> outPut oc "\tSRA\t%s, %s, %d\n" r1 r2 i
  | ADD (r1, r2, r3) -> outPut oc "\tADD\t%s, %s, %s\n" r1 r2 r3
  | SUB (r1, r2, r3) -> outPut oc "\tSUB\t%s, %s, %s\n" r1 r2 r3
  | SLT (r1, r2, r3) -> outPut oc "\tSLT\t%s, %s, %s\n" r1 r2 r3
  | OTHERS s -> outPut oc "%s" s


let timeMeasure f s =
  let a = Sys.time () in
  let res = f s in
  print_float (Sys.time () -. a); res

(* レジスタの中身を変更する命によって変更されるレジスタ *)
(* native.t -> register *)
let targetReg = function
  | LWC1 (r, _, _) | LW (r, _, _) | ADD_S (r, _, _) | SUB_S (r, _, _) | MUL_S (r, _, _) | DIV_S (r, _, _) | C_EQ_S (r, _, _) | C_LE_S (r, _, _) | C_LT_S (r, _, _) | ORI (r, _, _) | ADDI (r, _, _) | SLL (r, _, _) | SRA (r, _, _) | ADD (r, _, _) | SUB (r, _, _) | SLT (r, _, _) -> r
  | _ -> "dummy"

(* 命令に使われるレジスタ *)
(* native.t -> register list *)
let sourceReg = function
  | SWC1 (r1, _, r2) | SW(r1, _, r2) | ADD_S (_, r1, r2) | SUB_S (_, r1, r2) | MUL_S (_, r1, r2) | DIV_S (_, r1, r2) | C_EQ_S (_, r1, r2) | C_LE_S (_, r1, r2) | C_LT_S (_, r1, r2) | ADD (_, r1, r2) | SUB (_, r1, r2) | SLT (_, r1, r2) -> [r1; r2]
  | LWC1 (_, _, r1) | LW (_, _, r1) | ORI (_, r1, _) | ADDI (_, r1, _) | SLL (_, r1, _) | SRA (_, r1, _) -> [r1]
  | OTHERS _ -> []

(* R1 = R1 を削除 *)
(* どっちでも *)
(* もともとない *)
let rec elimSubst s = function
  | [] -> List.rev s
  | ADDI (r1, r2, 0) :: xs when r1 = r2 -> Format.eprintf "-- eliminate %s = %s" r1 r2; elimSubst s xs
  | x :: xs -> elimSubst (x::s) xs

(* R1 = hoge; R1 = piyo を R1 = piyo に *)
(* 上から下 *)
let rec elimUnusedVar s = function
  | [] -> List.rev s
  | x :: [] -> List.rev (x::s)
  | OTHERS st :: x :: xs  -> elimUnusedVar (OTHERS st :: s) (x::xs)
  | x :: OTHERS st :: xs -> elimUnusedVar (OTHERS st :: x :: s) xs
  | x0 :: x1 :: xs ->
      let rx0 = targetReg x0 in
      if rx0 <> "dummy" && rx0 = targetReg x1 && not (List.mem rx0 (sourceReg x1)) then (outPut stderr x0; outPut stderr x1; Format.eprintf "\n";elimUnusedVar s (x1::xs)) else elimUnusedVar (x0::s) (x1::xs)

let optPaths s = 
  let s = elimSubst [] s in
  elimUnusedVar [] s