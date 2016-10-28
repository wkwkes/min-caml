#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>

typedef union {
  int32_t i[2];
  double d;
} dbl;

typedef union {
  uint32_t i;
  float d;
} dbl32;

value gethi(value v) {
  dbl d;
  d.d = Double_val(v);
  return copy_int32(d.i[0]);
}

value getlo(value v) {
  dbl d;
  d.d = Double_val(v);
  return copy_int32(d.i[1]);
}

value get32(value v) {
  dbl32 d;
  d.d = (float)Double_val(v);
  return copy_int32(d.i);
}