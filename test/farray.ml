
let size = 100000 in
let rec printarray a n =
  if n = 0 then ()
  else (print_int (truncate a.(n)); printarray a (n-1)) in
let a = Array.create size 1.0 in
  printarray a (size-1)