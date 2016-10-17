let rec sum n = if n = 0 then 0 else n + (sum (n-1))
in let x = sum 5 in ()