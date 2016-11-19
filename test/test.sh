#!/bin/sh

# Run this script at /min-caml directory 

# build min-caml
./to_minips
make min-caml

# build simulator
cd test/simulator
make
cd ..

# do tests
for src in *.ml
do
  echo $src && echo
  name=${src%.ml}
  echo $name
  ../min-caml $name
  simulator/simulator "${name}.s" > "${name}.res"
  ocamlopt -w -3-24-26 -o $name $src
  ./$name > "${name}.ans" 
  diff "${name}.ans" "${name}.res" > "${name}.cmp"
  if [ ! -s "${name}.cmp" ]; then echo "${name} Passed"; else echo "Test Failed at ${name}.ml"; exit 1; fi
  rm $name
  rm "${name}.s"
done

# remove temporary files
rm *.cm*
rm *.o
rm *.ans
rm *.res

echo "Test Passed"
