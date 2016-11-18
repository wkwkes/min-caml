let dummy = Array.create 0 0. in
let a = Array.create 2 dummy in
let rec f a = 
  print_int(truncate a.(0).(0));
  print_newline ();
  print_int(truncate a.(0).(1));
  print_newline ();
  print_int(truncate a.(1).(0));
  print_newline ();
  print_int(truncate a.(1).(1));
  print_newline ()
in
a.(0) <- Array.create 2 0.;
a.(1) <- Array.create 2 0.;
a.(0).(0) <- 1.; a.(0).(1) <- 2.; a.(1).(0) <- 3.; a.(1).(1) <- 4.;
f a
