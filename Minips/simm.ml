open Asm

<<<<<<< HEAD
let rec g env = function (* Ì¿ÎáÎó¤Î 16 bit Â¨ÃÍºÇÅ¬²½ *)
  | Ans(exp) -> Ans(g' env exp)
  | Let((x, t), Li(i), e) when (-32768 <= i) && (i < 32768) ->
      let e' = g (M.add x i env) e in
      if List.mem x (fv e') then Let((x, t), Li(i), e') else e'
  | Let(xt, Slw(y, C(i)), e) when M.mem y env -> (* for array access *)
      g env (Let(xt, Li((M.find y env) lsl i), e))
  | Let(xt, exp, e) -> Let(xt, g' env exp, g env e)
and g' env = function (* ³ÆÌ¿Îá¤Î 16 bit Â¨ÃÍºÇÅ¬²½ *)
  | Add(x, V(y)) when M.mem y env -> Add(x, C(M.find y env))
  | Add(x, V(y)) when M.mem x env -> Add(y, C(M.find x env))
  | Sub(x, V(y)) when M.mem y env -> Sub(x, C(M.find y env))
  | Slw(x, V(y)) when M.mem y env -> Slw(x, C(M.find y env))
  | Lwz(x, V(y)) when M.mem y env -> Lwz(x, C(M.find y env))
  | Stw(x, y, V(z)) when M.mem z env -> Stw(x, y, C(M.find z env))
  | Lfd(x, V(y)) when M.mem y env -> Lfd(x, C(M.find y env))
  | Stfd(x, y, V(z)) when M.mem z env -> Stfd(x, y, C(M.find z env))
  | IfEq(x, V(y), e1, e2) when M.mem y env -> 
      IfEq(x, C(M.find y env), g env e1, g env e2)
  | IfLE(x, V(y), e1, e2) when M.mem y env ->
      IfLE(x, C(M.find y env), g env e1, g env e2)
  | IfGE(x, V(y), e1, e2) when M.mem y env -> 
      IfGE(x, C(M.find y env), g env e1, g env e2)
  | IfEq(x, V(y), e1, e2) when M.mem x env -> 
      IfEq(y, C(M.find x env), g env e1, g env e2)
  | IfLE(x, V(y), e1, e2) when M.mem x env -> 
      IfGE(y, C(M.find x env), g env e1, g env e2)
  | IfGE(x, V(y), e1, e2) when M.mem x env -> 
      IfLE(y, C(M.find x env), g env e1, g env e2)
=======
let rec g env = function (* Ì¿ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ 16 bit Â¨ï¿½Íºï¿½Å¬ï¿½ï¿½ *)
  | Ans(exp) -> Ans(g' env exp)
  | Let((x, t), Li(i), e) when (-32768 <= i) && (i < 32768) ->
    let e' = g (M.add x i env) e in
    if List.mem x (fv e') then Let((x, t), Li(i), e') else e'
  | Let(xt, Sll(y, C(i)), e) when M.mem y env -> (* for array access *)
    g env (Let(xt, Li((M.find y env) lsl i), e))
  | Let(xt, exp, e) -> Let(xt, g' env exp, g env e)
and g' env = function (* ï¿½ï¿½Ì¿ï¿½ï¿½ï¿½ï¿½ 16 bit Â¨ï¿½Íºï¿½Å¬ï¿½ï¿½ *)
  | Add(x, V(y)) when M.mem y env -> Add(x, C(M.find y env))
  | Add(x, V(y)) when M.mem x env -> Add(y, C(M.find x env))
  | Sub(x, V(y)) when M.mem y env -> Sub(x, C(M.find y env))
  | Sll(x, V(y)) when M.mem y env -> Sll(x, C(M.find y env))
  | Lw(x, V(y)) when M.mem y env -> Lw(x, C(M.find y env))
  | Sw(x, y, V(z)) when M.mem z env -> Sw(x, y, C(M.find z env))
  | Lfd(x, V(y)) when M.mem y env -> Lfd(x, C(M.find y env))
  | Stfd(x, y, V(z)) when M.mem z env -> Stfd(x, y, C(M.find z env))
  | IfEq(x, V(y), e1, e2) when M.mem y env -> 
    IfEq(x, C(M.find y env), g env e1, g env e2)
  | IfLE(x, V(y), e1, e2) when M.mem y env ->
    IfLE(x, C(M.find y env), g env e1, g env e2)
  | IfGE(x, V(y), e1, e2) when M.mem y env -> 
    IfGE(x, C(M.find y env), g env e1, g env e2)
  | IfEq(x, V(y), e1, e2) when M.mem x env -> 
    IfEq(y, C(M.find x env), g env e1, g env e2)
  | IfLE(x, V(y), e1, e2) when M.mem x env -> 
    IfGE(y, C(M.find x env), g env e1, g env e2)
  | IfGE(x, V(y), e1, e2) when M.mem x env -> 
    IfLE(y, C(M.find x env), g env e1, g env e2)
>>>>>>> fib
  | IfEq(x, y', e1, e2) -> IfEq(x, y', g env e1, g env e2)
  | IfLE(x, y', e1, e2) -> IfLE(x, y', g env e1, g env e2)
  | IfGE(x, y', e1, e2) -> IfGE(x, y', g env e1, g env e2)
  | IfFEq(x, y, e1, e2) -> IfFEq(x, y, g env e1, g env e2)
  | IfFLE(x, y, e1, e2) -> IfFLE(x, y, g env e1, g env e2)
  | e -> e

<<<<<<< HEAD
(* ¥È¥Ã¥×¥ì¥Ù¥ë´Ø¿ô¤Î 16 bit Â¨ÃÍºÇÅ¬²½ *)
let h { name = l; args = xs; fargs = ys; body = e; ret = t } = 
  { name = l; args = xs; fargs = ys; body = g M.empty e; ret = t }

(* ¥×¥í¥°¥é¥àÁ´ÂÎ¤Î 16 bit Â¨ÃÍºÇÅ¬²½ *)
=======
(* ï¿½È¥Ã¥×¥ï¿½ï¿½Ù¥ï¿½ï¿½Ø¿ï¿½ï¿½ï¿½ 16 bit Â¨ï¿½Íºï¿½Å¬ï¿½ï¿½ *)
let h { name = l; args = xs; fargs = ys; body = e; ret = t } = 
  { name = l; args = xs; fargs = ys; body = g M.empty e; ret = t }

(* ï¿½×¥ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Î¤ï¿½ 16 bit Â¨ï¿½Íºï¿½Å¬ï¿½ï¿½ *)
>>>>>>> fib
let f (Prog(data, fundefs, e)) = 
  Prog(data, List.map h fundefs, g M.empty e)
