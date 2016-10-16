type id_or_imm = V of Id.t | C of int
type t = Ans of exp | Let of (Id.t * Type.t) * exp * t
and exp =
    Nop
  | Li of int
  | FLi of Id.l
  | SetL of Id.l
  | Mr of Id.t
  | Neg of Id.t
  | Add of Id.t * id_or_imm
  | Sub of Id.t * id_or_imm
  | Sll of Id.t * id_or_imm
  | Lw of Id.t * id_or_imm
  | Sw of Id.t * Id.t * id_or_imm
  | FMr of Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | Lfd of Id.t * id_or_imm
  | Stfd of Id.t * Id.t * id_or_imm
  | Comment of string
  | IfEq of Id.t * id_or_imm * t * t
  | IfLE of Id.t * id_or_imm * t * t
  | IfGE of Id.t * id_or_imm * t * t
  | IfFEq of Id.t * Id.t * t * t
  | IfFLE of Id.t * Id.t * t * t
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.l * Id.t list * Id.t list
  | Save of Id.t * Id.t
  | Restore of Id.t
type fundef = {
  name : Id.l;
  args : Id.t list;
  fargs : Id.t list;
  body : t;
  ret : Type.t;
}
type prog = Prog of (Id.l * float) list * fundef list * t
val fletd : Id.t * exp * t -> t
val seq : exp * t -> t
val regs : string array
val fregs : string array
val allregs : string list
val allfregs : string list
val reg_cl : string
val reg_sw : string
val reg_fsw : string
val reg_hp : string
val reg_sp : string
val reg_tmp : string
val reg_link : string
val reg_cmp : string
val reg_zero : string
val is_reg : string -> bool

val fv : t -> S.elt list
val concat : t -> Id.t * Type.t -> t -> t
val align : int -> int
