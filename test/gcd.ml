let rec gcd m n =
  if m = 0 then n else
  if n >= m then gcd m (n - m) else
  gcd n (m - n) in
print_int (gcd 21600 337500)
