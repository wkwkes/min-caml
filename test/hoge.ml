let f _ = () in
(Array.create 1 f).(0) <- f
