	.text
	.globl  _min_caml_start
fib.9:
	ADDI	%r27, %r0, 2
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.23
	ADDI	%r2, %r1, -1
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, 8
	JAL	fib.9
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30)
	ADDI	%r2, %r2, -2
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	JAL	fib.9
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30)
	ADD	%r1, %r2, %r1
	JR	%r31
BEQ_else.23:
	SUB	%r1, %r1, %r1
	ADDI	%r1, %r0, 1
	JR	%r31
_min_caml_start: # main entry point
	SUB	%r0, %r0, %r0
   # main program start
	SUB	%r1, %r1, %r1
	ADDI	%r1, %r0, 10
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, 8
	JAL	fib.9
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
   # main program end

