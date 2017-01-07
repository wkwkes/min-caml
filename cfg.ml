
let unique_id = ref 0

type bb_label = string
type basickBlock = {from_bbs: bb_label list; to_bbs: bb_label; insts: KNormal.t list}

let mk_bb_label () : Bytes.t =
  let id = string_of_int !unique_id in
  let () = unique_id := (!unique_id + 1) in
  "_BB_Label_" ^ id

module Cfg = Map.Make(Bytes)

(*let basickBlocks : basickBlock Cfg.t = Cfg.empty*)

(*make_bbs : basickBlock Cfg.t -> basickBlock Cfg.t*)
(*instruction の列から basickBlock を一つ取り出す.
instsに保持しながら進める.*)

let rec make_bb insts = let open Asm in function
  | Nop ->
  | Sub (_,_) -> "Sub"
  | _ -> ""

(*module BasickBlock : sig
  val from_bbs : bb_label list
  val to_bbs : bb_label list
  val insts : KNormal.t list 
end = struct 
  let from_bbs = []
  let to_bbs = []
  let insts = []
end*)