main: # main entry point
	SUB	%r0, %r0, %r0   # main program start
	SUB	%r1, %r1, %r1
	ADDI	%r1, %r1, 5
	ADDI	%r27, %r0, 10
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.5
	SUB	%r1, %r1, %r1
	ADDI	%r1, %r1, 7
	J	BEQ_cont.6
BEQ_else.5:
	SUB	%r1, %r1, %r1
	ADDI	%r1, %r1, 4
BEQ_cont.6:
   # main program end
