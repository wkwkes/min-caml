let rec f n =
    let rec g x = x + 1 in
    let a = Array.create 1 g in
    print_int (a.(0) n)
in f 9