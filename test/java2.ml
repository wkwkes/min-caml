let rec fib x = 
    if x <= 1.0 then 1.0 else fib (x -. 1.0) +. (fib (x -. 2.0))
in
let w = fib 10.0 in ()