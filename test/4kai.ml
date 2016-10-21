let rec fact x =
if x = 1 then 1
else x * fact (x - 1) in
let w = fact 6 in ()