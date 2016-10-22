
open Type
exception ClsTypeError of string

let findv env x =
  try Hashtbl.find env x with
  (*| Not_found -> Int*)
  | Not_found -> raise (ClsTypeError ("variable"^(Id.show x)^"not found"))

let findc env x =
  try Hashtbl.find env x with
  | Not_found -> raise (ClsTypeError ("variable"^(Id.show x)^"not found"))

let rec findv_list env = function
  | [] -> []
  | x::xs -> (findv env x)::(findv_list env xs)

let isExt s =
  if String.length s < 9 then false
  else String.sub s 0 9 = "min_caml_"

let rec tyeq t1 t2 =
  match (t1, t2) with
  | (Var _, _) | (_, Var _) -> true
  | (Int, Int) | (Bool, Bool) | (Float, Float) | (Unit, Unit) -> true
  | (Fun (xs, xret), Fun (ys, yret)) -> tyeql xs ys && tyeq xret yret 
  | (Tuple xs, Tuple ys) -> tyeql xs ys
  | (Array x, Array y) -> tyeq x y
  | _ -> false
and tyeql ts1 ts2 =
  match (ts1, ts2) with
  | ([], []) -> true
  | (t1::t1s, t2::t2s) when tyeq t1 t2 -> tyeql t1s t2s
  | _ -> raise (ClsTypeError "err tyeql")

let rec g_cls venv cenv = function
    { Closure.entry = (Id.L f); Closure.actual_fv = fvs } ->
    let (tfun, _, tcfvs) = findc cenv f in
    let (_, tcfvs) = List.split tcfvs in
    let tfvs = findv_list venv fvs in
    if tyeql tcfvs tfvs then tfun else raise (ClsTypeError "err g_cls")

let rec g venv cenv = function
  | Closure.Unit -> Unit
  | Closure.Int _ -> Int
  | Closure.Float _ -> Float
  | Closure.Neg x -> if tyeq (findv venv x) Int then Int else raise (ClsTypeError "err neg")
  | Closure.Add (x, y) | Closure.Sub (x, y) | Closure.Mul (x, y) | Closure.Div (x, y)
    -> if tyeq (findv venv x) Int && tyeq (findv venv y) Int then Int else raise (ClsTypeError "err add")
  | Closure.FNeg x -> if tyeq (findv venv x) Float then Float else raise (ClsTypeError "err fneg")
  | Closure.FAdd (x, y) | Closure.FSub (x, y) | Closure.FMul (x, y) | Closure.FDiv (x, y)
    -> if tyeq (findv venv x) Float && tyeq (findv venv y)Float then Float else raise (ClsTypeError "err fadd")
  | Closure.IfEq (x1, x2, e1, e2) | Closure.IfLE (x1, x2, e1, e2) ->
    let tb = findv venv x1 in
    let tc = g venv cenv e1 in
    if tyeq tb (findv venv x2) && tyeq tc (g venv cenv e2) then tc
    else raise (ClsTypeError "err if")
  | Closure.Let ((x1, ty), e1, e2) ->
    let t1 = g venv cenv e1 in
    if tyeq ty t1 then (Hashtbl.add venv x1 ty; g venv cenv e2) else 
      raise (ClsTypeError "err let")
  | Closure.Var x -> findv venv x
  | Closure.MakeCls ((x, ty), cls, e) ->
    let tcls = g_cls venv cenv cls in
    if tyeq tcls ty then (Hashtbl.add venv x ty; g venv cenv e) else raise (ClsTypeError "err makecls")
  | Closure.AppCls (x, args) -> 
    (match findv venv x with
     | Fun (targs, tret) when tyeql targs (findv_list venv args) ->
       tret
     | _ -> raise (ClsTypeError "err Appcls")
    )
  | Closure.AppDir (Id.L x, args) when isExt x -> Var (ref None)
  | Closure.AppDir (Id.L x, args) ->
    (match findc cenv x with
     | (Fun (targs, tret), _, _) when tyeql targs (findv_list venv args) -> tret
     | _ -> raise (ClsTypeError "err Appdir")
    )
  | Closure.Tuple xs -> Tuple (findv_list venv xs)
  | Closure.LetTuple (xs, x, e) ->
    let (tvals, tys) = List.split xs in
    if tyeq (Tuple tys) (findv venv x) then (List.iter2 (fun a b -> Hashtbl.add venv a b) tvals tys; g venv cenv e) else
      raise (ClsTypeError "err lettuple")
  | Closure.Get (arr, idx) ->
    let ty = (match findv venv arr with
        | Array a -> a
        | _ -> raise (ClsTypeError "err get")) in 
    if tyeq (findv venv idx) Int then ty else raise (ClsTypeError "err get")
  | Closure.Put (arr, idx, elm) ->
    let ty = (match findv venv arr with
        | Array a -> a
        | _ -> raise (ClsTypeError "err put")) in 
    if tyeq (findv venv idx) Int && tyeq (findv venv elm) ty then Unit else raise (ClsTypeError "err get")
  | Closure.ExtArray (Id.L arr) -> (Array Int) 

let rec to_strings = function
  | [] -> ""
  | x::xs -> (Closure.show_fundef x) ^ (to_strings xs)

let rec g_fundef venv cenv x =
  match x with 
  | [] -> ()
  | { Closure.name=(Id.L lf, Fun (tfunargs, tfret)); Closure.args=args; Closure.formal_fv=fvs; Closure.body=e }::xs ->
    (*let (_,targs) = List.split args in
      let (_,tfvs) = List.split fvs in*)
    let _ = Hashtbl.add cenv lf (Fun(tfunargs, tfret), args, fvs) in 
    let _ = Hashtbl.add venv lf (Fun (tfunargs, tfret)) in
    let _ = List.iter (fun (x, t) -> Hashtbl.add venv x t) args in
    let _ = List.iter (fun (x, t) -> Hashtbl.add venv x t) fvs in 
    if tyeq (g venv cenv e) tfret then g_fundef venv cenv xs else raise (ClsTypeError "err g_fundef")
  | _ -> raise (ClsTypeError "err g_fundef")


let f (Closure.Prog (fs, e)) =
  let venv = Hashtbl.create 1000 in
  let cenv = Hashtbl.create 1000 in
  let _ = g_fundef venv cenv fs in
  let _ =  g venv cenv e in ()

(*
TODO:
Closure.Let (("Ti4.14", Type.Int), (Closure.Int 0),
           Closure.IfLE ("x.10", "Ti4.14", (Closure.Var "acc.9"),
             Closure.Let (("Ti5.15", Type.Int),
               Closure.Add ("acc.9", "x.10"),
               Closure.Let (("Ti7.16", Type.Int),
                 Closure.Let (("Ti6.17", Type.Int), (Closure.Int 1),
                   Closure.Sub ("x.10", "Ti6.17")),
                 Closure.AppDir ((Id.L "sum.8"), ["Ti5.15"; "Ti7.16"])))))
                 を直接 g に入れてみる.
*)