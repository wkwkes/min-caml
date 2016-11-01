	.text
	.globl  _min_caml_start
f.6:
	ADDI	%r1, %r1, 1
	JR	%r31
g.11:
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	ADD	%r1, %r3, %r1
	ADD	%r1, %r1, %r2
	ADD	%r1, %r1, %r4
	JR	%r31
_min_caml_start: # main entry point
	SUB	%r0, %r0, %r0
   # main program start
	ADDI	%r1, %r0, 1
	ADDI	%r2, %r0, 234
	ADDI	%r3, %r0, 15
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	JAL	f.6
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r26, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r2, g.11
	SW	%r2, 0(%r26)
	LW	%r2, 4(%r30)
	SW	%r2, 12(%r26)
	SW	%r1, 8(%r26)
	LW	%r1, 0(%r30)
	SW	%r1, 4(%r26)
	ADDI	%r1, %r0, 100
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30,%r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
   # main program end
