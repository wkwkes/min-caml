	.text
	.globl  _min_caml_start
_min_caml_start: # main entry point
	SUB	%r0, %r0, %r0
   # main program start
	ADDI	%r1, %r0, 16384
	ADDI	%r29, %r0, 16
	SLL	%r1, %r1, %r29
	ORI	%r1, %r1, 0
	ADDI	%r1, %r1, 1
	ADDI	_R_0, %r1, 0
   # main program end
