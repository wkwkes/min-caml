	.data
l.102:	 # 0.000000
	.word	0
l.101:	 # 1.000000
	.word	1065353216
l.100:	 # 1.500000
	.word	1069547520
l.99:	 # 400.000000
	.word	1137180672
l.98:	 # 4.000000
	.word	1082130432
	.text
	.globl  _min_caml_start
dbl.38:
	ADD.s	%f1, %f1, %f1
	JR	%r31
iloop.54:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.117
	ADDI	%r1, %r0, 1
	J	min_caml_print_int
BEQ_else.117:
	SUB.s	%f3, %f3, %f4
	ADD.s	%f3, %f3, %f5
	SWC1	%f5, 0(%r30)
	SW	%r1, 2(%r30)
	SWC1	%f3, 4(%r30)
	SWC1	%f6, 6(%r30)
	SWC1	%f2, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 10(%r30) # save link register
	ADDI	%r30, %r30, 11
	JAL	dbl.38
	ADDI	%r29, %r0, 11
	SUB	%r30, %r30, %r29
	LW	%r29, 10(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LWC1	%f6, 6(%r30) # restore2
	ADD.s	%f2, %f1, %f6
	LWC1	%f1, 4(%r30) # restore2
	MUL.s	%f3, %f1, %f1
	MUL.s	%f4, %f2, %f2
	ADD.s	%f5, %f3, %f4
	LA	%r29, l.98
	LWC1	%f7, 0(%r29)
	C.lt.s	%r27, %f7, %f5
	BNE	%r27, %r0, BEQ_else.119
	LW	%r1, 2(%r30) # restore1
	ADDI	%r1, %r1, -1
	LWC1	%f5, 0(%r30) # restore2
	J	iloop.54
BEQ_else.119:
	ADDI	%r1, %r0, 0
	J	min_caml_print_int
xloop.44:
	ADDI	%r27, %r0, 400
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.120
	JR	%r31
BEQ_else.120:
	SW	%r1, 0(%r30)
	SW	%r2, 1(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 2(%r30) # save link register
	ADDI	%r30, %r30, 3
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 3
	SUB	%r30, %r30, %r29
	LW	%r29, 2(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 2(%r30) # save link register
	ADDI	%r30, %r30, 3
	JAL	dbl.38
	ADDI	%r29, %r0, 3
	SUB	%r30, %r30, %r29
	LW	%r29, 2(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.99
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	LA	%r29, l.100
	LWC1	%f2, 0(%r29)
	SUB.s	%f1, %f1, %f2
	LW	%r1, 1(%r30) # restore1
	SWC1	%f1, 2(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 5
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 5
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 5
	JAL	dbl.38
	ADDI	%r29, %r0, 5
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.99
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	LA	%r29, l.101
	LWC1	%f2, 0(%r29)
	SUB.s	%f6, %f1, %f2
	ADDI	%r1, %r0, 1000
	LA	%r29, l.102
	LWC1	%f1, 0(%r29)
	LA	%r29, l.102
	LWC1	%f2, 0(%r29)
	LA	%r29, l.102
	LWC1	%f3, 0(%r29)
	LA	%r29, l.102
	LWC1	%f4, 0(%r29)
	LWC1	%f5, 2(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 5
	JAL	iloop.54
	ADDI	%r29, %r0, 5
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 1(%r30) # restore1
	J	xloop.44
yloop.40:
	ADDI	%r27, %r0, 400
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.122
	JR	%r31
BEQ_else.122:
	ADDI	%r2, %r0, 0
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r25, %r2, 0 # args
	ADDI	%r2, %r1, 0 # args
	ADDI	%r1, %r25, 0 # args
	SW	%r29, 1(%r30) # save link register
	ADDI	%r30, %r30, 2
	JAL	xloop.44
	ADDI	%r29, %r0, 2
	SUB	%r30, %r30, %r29
	LW	%r29, 1(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	J	yloop.40
_min_caml_start: # main entry point
	SUB	%r0, %r0, %r0
	ADDI	%r28, %r0, 8192
   # main program start
	ADDI	%r1, %r0, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 0(%r30) # save link register
	ADDI	%r30, %r30, 1
	JAL	yloop.40
	ADDI	%r29, %r0, 1
	SUB	%r30, %r30, %r29
	LW	%r29, 0(%r30)
	ADDI	%r31, %r29, 0
halt   # main program end
