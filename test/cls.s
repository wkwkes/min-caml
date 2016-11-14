	.data
l.8:	 # 0.666000
	.word	1059749626
l.7:	 # 1.333000
	.word	1068146622
	.text
	.globl  _min_caml_start
f.3:
	LWC1	%f2, 8(%r26)
	ADD.s	%f1, %f1, %f2
	JR	%r31
_min_caml_start: # main entry point
	SUB	%r0, %r0, %r0
	ADDI	%r28, %r0, 1000
   # main program start
	LA	%r29, l.7
	LWC1	%f1, 0(%r29)
	ADDI	%r26, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r1, f.3
	SW	%r1, 0(%r26)
	SWC1	%f1, 8(%r26)
	LA	%r29, l.8
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, 8
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30,%r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
   # main program end
