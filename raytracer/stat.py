log = []
with open("../min-rt/testrt.s", "r") as file:
    for l in file:
        data = l.split()
        for i in data:
            if "min_caml" in i and not (i in log):
                print(i)
                log.append(i)
