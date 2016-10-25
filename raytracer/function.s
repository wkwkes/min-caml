main: # main entry point
	SUB	%r0, %r0, %r0   # main program start
	SUB	%r1, %r1, %r1
	ADDI	%r1,%r1, $5
	ADDI	%r29, %r31, $0
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, $8
	JAL	f.3
	ADDI	%r29, %r0, $8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, $0
   # main program end
f.3:
	ADDI	%r1, %r1, $100
	JR	%r32