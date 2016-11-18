let rec fibmem_sub n arr =
  if arr.(n) = 0 then 
    let x = if n<2 then 1
            else (fibmem_sub (n-1) arr)+(fibmem_sub (n-2) arr) in
    arr.(n)<-x; x
    else
      arr.(n) in
let rec fibmem n =
  let arr = Array.create (n+1) 0 in
  fibmem_sub n arr in
 
print_int (fibmem 10)
