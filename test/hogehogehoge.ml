let rec f x = x + 1 in
let rec g ff x = ff x in
let w = g f 1 in ()