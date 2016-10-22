let rec f x =
    let rec g y = if y = 0 then 1 else x + g (y-1)
    in g 7
in let w = f 10 in ()
