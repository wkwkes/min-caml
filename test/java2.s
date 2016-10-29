	.data
l.22:	 # 10.000000
	.word	1092616192
l.21:	 # 2.000000
	.word	1073741824
l.20:	 # 1.000000
	.word	1065353216
	.text
	.globl  _min_caml_start
fib.9:
	LA	%r29, l.20
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.26
	LA	%r29, l.20
	LWC1	%f1, 0(%r29)
	JR	%r31
BEQ_else.26:
	LA	%r29, l.20
	LWC1	%f2, 0(%r29)
	SUB.s	%f2, %f1, %f2
	SWC1	%f1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	JAL	fib.9
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.21
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 0(%r30)
	SUB.s	%f2, %f3, %f2
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	JAL	fib.9
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30)
	ADD.s	%f1, %f2, %f1
	JR	%r31
_min_caml_start: # main entry point
	SUB	%r0, %r0, %r0
   # main program start
	LA	%r29, l.22
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, 8
	JAL	fib.9
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
   # main program end
