main: # main entry point
	SUB	%r0, %r0, %r0   # main program start
	SUB	%r1, %r1, %r1
	ADDI	%r1, %r1, $5
	ADDI	%r29, %r31, $0
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, $8
	JAL	sum.6
	ADDI	%r29, %r0, $8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, $0
	J 	return
   # main program end
sum.6:
	ADDI	%r27, %r0, $0
	BNE	%r1, %r27, BEQ_else.16
	SUB	%r1, %r1, %r1
	ADDI	%r1, %r1, $0
	JR	%r31
BEQ_else.16:
	ADDI	%r2, %r1, $-1
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, $0
	ADDI	%r1, %r2, $0
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, $8
	JAL	sum.6
	ADDI	%r29, %r0, $8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, $0
	LW	%r2, 0(%r30)
	ADD	%r1, %r2, %r1
	JR	%r31
return:
