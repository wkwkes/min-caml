f.4:
	ADDI	%r27, %r0, 5
	SLT6	%r27, %r27, %r1
	BNE	%r27, %r0, BEQ_else.12
	SUB	%r1, %r1, %r1
	ADDI	%r1, %r1, 7
	J	BEQ_cont.13
BEQ_else.12:
	SUB	%r1, %r1, %r1
	ADDI	%r1, %r1, 4
BEQ_cont.13:
	ADDI	%r1, %r1, 1
	JR	%r31
main: # main entry point
	SUB	%r0, %r0, %r0   # main program start
	SUB	%r1, %r1, %r1
	ADDI	%r1, %r1, 1
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, 8
	JAL	f.4
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
   # main program end
