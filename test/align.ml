let x = 6 in
let y = 7 in
let rec f a b c d = let ff = c +. d in a + b in
let c = 100 in
let d = 300 in
print_int (x + y + f c d 1.5 3.0)
