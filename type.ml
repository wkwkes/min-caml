type t = (* MinCaml�η���ɽ�������ǡ����� (caml2html: type_t) *)
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t (* arguments are uncurried *)
  | Tuple of t list
  | Array of t
  | Var of t option ref
[@@deriving show]


let gentyp () = Var(ref None) (* ���������ѿ������� *)
