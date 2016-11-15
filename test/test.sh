#!/bin/sh
cd test

for src in *.ml
do
  echo $src && echo
  name=${src%.ml}
  echo $name
  ../min-caml $name
  ../../simulator/simulator "${name}.s" > "${name}.res"
  ocamlopt -w -3-24-26 -o $name $src
  ./$name > "${name}.ans" 
  diff "${name}.ans" "${name}.res" > "${name}.cmp"
  if [ ! -s "${name}.cmp" ]; then echo "${name} Passed"; else echo "Test Failed at ${name}.ml"; exit 1; fi
  rm $name
  rm "${name}.s"
done
rm *.cm*
rm *.o
rm *.ans
rm *.res
echo "Test Passed"
