	.text
	.globl  _min_caml_start
	.align 2
g.3:
	lwz	r5, 4(r30)
	add	r2, r5, r2
	blr
_min_caml_start: # main entry point
	mflr	r0
	stmw	r30, -8(r1)
	stw	r0, 8(r1)
	stwu	r1, -96(r1)
   # main program start
	li	r2, 200
	mr	r30, r4
	addi	r4, r4, 8
	lis	r5, ha16(g.3)
	addi	r5, r5, lo16(g.3)
	stw	r5, 0(r30)
	stw	r2, 4(r30)
	li	r2, 100
here
	mflr	r31
	stw	r31, 4(r3)
	addi	r3, r3, 8
	lwz	r31, 0(r30)
	mtctr	r31
	bctrl
	subi	r3, r3, 8
	lwz	r31, 4(r3)
	mtlr	r31
end
   # main program end
	lwz	r1, 0(r1)
	lwz	r0, 8(r1)
	mtlr	r0
	lmw	r30, -8(r1)
	blr
