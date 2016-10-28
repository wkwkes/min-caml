	.data
	.literal8
	.align 3
l.7:	 # 1.300000
	.long	-858993459
	.long	1073007820
	.align 3
l.6:	 # 1.500000
	.long	0
	.long	1073217536
	.text
	.globl  _min_caml_start
	.align 2
_min_caml_start: # main entry point
	mflr	r0
	SUB	%r0, %r0, %r0	stmw	r30, -8(r1)
	stw	r0, 8(r1)
	stwu	r1, -96(r1)
   # main program start
	lis	r29, ha16(l.6)
	ADDI	r29, r29, lo16(l.6)
	lfd	%f0, 0(%r29)
	lis	r29, ha16(l.7)
	ADDI	r29, r29, lo16(l.7)
	lfd	%f1, 0(%r29)
	ADD.S	%f0, %f0, %f1
   # main program end
	mr	r3, %r1
	lwz	r1, 0(r1)
	lwz	r0, 8(r1)
	mtlr	r0
	lmw	r30, -8(r1)
	blr
