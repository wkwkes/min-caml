type register = string
type t =
    SWC1 of register * int * register
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
  | ADDI of register * register * int
  | SLL of register * register * int
  | SRA of register * register * int
  | ADD of register * register * register
  | SUB of register * register * register
  | SLT of register * register * register
  | OTHERS of string
val outPut : out_channel -> t -> unit
val timeMeasure : ('a -> 'b) -> 'a -> 'b
val optpaths : t list -> t list
