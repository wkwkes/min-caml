	.text
	.globl  _min_caml_start
f.7:
	LW	%r2, 4(%r26)
	ADD	%r1, %r1, %r2
	JR	%r31
_min_caml_start: # main entry point
	SUB	%r0, %r0, %r0
   # main program start
	ADDI	%r1, %r0, 35
	ADDI	%r2, %r0, 100
	ADDI	%r1, %r1, 16
	ADDI	%r26, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r3, f.7
	SW	%r3, 0(%r26)
	SW	%r2, 4(%r26)
	ADDI	%r2, %r0, 200
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, 8
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r27, %r0, 8
	SUB	%r30, %r30, %r27
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30)
	ADD	%r1, %r2, %r1
   # main program end
