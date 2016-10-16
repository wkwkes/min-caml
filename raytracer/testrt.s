	.data
	.literal8
	.align 3
l.6592:	 # 128.000000
	.long	0
	.long	1080033280
	.align 3
l.6559:	 # 0.900000
	.long	-858993459
	.long	1072483532
	.align 3
l.6558:	 # 0.200000
	.long	-1717986918
	.long	1070176665
	.align 3
l.6464:	 # 150.000000
	.long	0
	.long	1080213504
	.align 3
l.6462:	 # -150.000000
	.long	0
	.long	-1067270144
	.align 3
l.6446:	 # 0.100000
	.long	-1717986918
	.long	1069128089
	.align 3
l.6443:	 # -2.000000
	.long	0
	.long	-1073741824
	.align 3
l.6441:	 # 0.003906
	.long	0
	.long	1064304640
	.align 3
l.6419:	 # 20.000000
	.long	0
	.long	1077149696
	.align 3
l.6418:	 # 0.050000
	.long	-1717986918
	.long	1068079513
	.align 3
l.6414:	 # 0.250000
	.long	0
	.long	1070596096
	.align 3
l.6410:	 # 10.000000
	.long	0
	.long	1076101120
	.align 3
l.6406:	 # 0.300000
	.long	858993459
	.long	1070805811
	.align 3
l.6405:	 # 255.000000
	.long	0
	.long	1081073664
	.align 3
l.6404:	 # 0.500000
	.long	0
	.long	1071644672
	.align 3
l.6403:	 # 0.150000
	.long	858993459
	.long	1069757235
	.align 3
l.6401:	 # 3.141593
	.long	1518260631
	.long	1074340347
	.align 3
l.6400:	 # 30.000000
	.long	0
	.long	1077805056
	.align 3
l.6399:	 # 15.000000
	.long	0
	.long	1076756480
	.align 3
l.6398:	 # 0.000100
	.long	-350469331
	.long	1058682594
	.align 3
l.6355:	 # 100000000.000000
	.long	0
	.long	1100470148
	.align 3
l.6351:	 # 1000000000.000000
	.long	0
	.long	1104006501
	.align 3
l.6331:	 # -0.100000
	.long	-1717986918
	.long	-1078355559
	.align 3
l.6318:	 # 0.010000
	.long	1202590843
	.long	1065646817
	.align 3
l.6317:	 # -0.200000
	.long	-1717986918
	.long	-1077306983
	.align 3
l.6126:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.6092:	 # -200.000000
	.long	0
	.long	-1066860544
	.align 3
l.6090:	 # 200.000000
	.long	0
	.long	1080623104
	.align 3
l.6086:	 # 0.017453
	.long	-1433277178
	.long	1066524486
	.align 3
l.6003:	 # -1.000000
	.long	0
	.long	-1074790400
	.align 3
l.6002:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.6001:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl  _min_caml_start
	.align 2
xor.2465:
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8649
	MOV	r0, r1
	blr
beq_else.8649:
	cmpwi	cr7, r1, 0
	bne	cr7, beq_else.8650
	LI	r0, 1
	blr
beq_else.8650:
	LI	r0, 0
	blr
sgn.2468:
	stfd	f0, 0(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_fiszero
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8651
	lfd	f0, 0(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_fispos
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8652
	lis	r29, ha16(l.6003)
	ADDI	r29, r29, lo16(l.6003)
	lfd	f0, 0(r29)
	blr
beq_else.8652:
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	blr
beq_else.8651:
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	blr
fneg_cond.2470:
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8653
	b	min_caml_fneg
beq_else.8653:
	blr
add_mod5.2473:
	ADD	r0, r0, r1
	cmpwi	cr7, r0, 5
	blt	cr7, bge_else.8654
	SUBI	r0, r0, 5
	blr
bge_else.8654:
	blr
vecset.2476:
	stfd	f0, 0(r0)
	stfd	f1, 8(r0)
	stfd	f2, 16(r0)
	blr
vecfill.2481:
	stfd	f0, 0(r0)
	stfd	f0, 8(r0)
	stfd	f0, 16(r0)
	blr
vecbzero.2484:
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	b	vecfill.2481
veccpy.2486:
	lfd	f0, 0(r1)
	stfd	f0, 0(r0)
	lfd	f0, 8(r1)
	stfd	f0, 8(r0)
	lfd	f0, 16(r1)
	stfd	f0, 16(r0)
	blr
vecunit_sgn.2494:
	lfd	f0, 0(r0)
	stw	r1, 0(r30)
	stw	r0, 4(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_fsqr
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lfd	f1, 8(r0)
	stfd	f0, 8(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_fsqr
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lfd	f1, 8(r30)
	fadd	f0, f1, f0
	lwz	r0, 4(r30)
	lfd	f1, 16(r0)
	stfd	f0, 16(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_fsqr
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lfd	f1, 16(r30)
	fadd	f0, f1, f0
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_sqrt
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	stfd	f0, 24(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fiszero
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8658
	lwz	r0, 0(r30)
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8660
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	lfd	f1, 24(r30)
	fdiv	f0, f0, f1
	b	beq_cont.8661
beq_else.8660:
	lis	r29, ha16(l.6003)
	ADDI	r29, r29, lo16(l.6003)
	lfd	f0, 0(r29)
	lfd	f1, 24(r30)
	fdiv	f0, f0, f1
beq_cont.8661:
	b	beq_cont.8659
beq_else.8658:
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
beq_cont.8659:
	lwz	r0, 4(r30)
	lfd	f1, 0(r0)
	fmul	f1, f1, f0
	stfd	f1, 0(r0)
	lfd	f1, 8(r0)
	fmul	f1, f1, f0
	stfd	f1, 8(r0)
	lfd	f1, 16(r0)
	fmul	f0, f1, f0
	stfd	f0, 16(r0)
	blr
veciprod.2497:
	lfd	f0, 0(r0)
	lfd	f1, 0(r1)
	fmul	f0, f0, f1
	lfd	f1, 8(r0)
	lfd	f2, 8(r1)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 16(r0)
	lfd	f2, 16(r1)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	blr
veciprod2.2500:
	lfd	f3, 0(r0)
	fmul	f0, f3, f0
	lfd	f3, 8(r0)
	fmul	f1, f3, f1
	fadd	f0, f0, f1
	lfd	f1, 16(r0)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	blr
vecaccum.2505:
	lfd	f1, 0(r0)
	lfd	f2, 0(r1)
	fmul	f2, f0, f2
	fadd	f1, f1, f2
	stfd	f1, 0(r0)
	lfd	f1, 8(r0)
	lfd	f2, 8(r1)
	fmul	f2, f0, f2
	fadd	f1, f1, f2
	stfd	f1, 8(r0)
	lfd	f1, 16(r0)
	lfd	f2, 16(r1)
	fmul	f0, f0, f2
	fadd	f0, f1, f0
	stfd	f0, 16(r0)
	blr
vecadd.2509:
	lfd	f0, 0(r0)
	lfd	f1, 0(r1)
	fadd	f0, f0, f1
	stfd	f0, 0(r0)
	lfd	f0, 8(r0)
	lfd	f1, 8(r1)
	fadd	f0, f0, f1
	stfd	f0, 8(r0)
	lfd	f0, 16(r0)
	lfd	f1, 16(r1)
	fadd	f0, f0, f1
	stfd	f0, 16(r0)
	blr
vecscale.2515:
	lfd	f1, 0(r0)
	fmul	f1, f1, f0
	stfd	f1, 0(r0)
	lfd	f1, 8(r0)
	fmul	f1, f1, f0
	stfd	f1, 8(r0)
	lfd	f1, 16(r0)
	fmul	f0, f1, f0
	stfd	f0, 16(r0)
	blr
vecaccumv.2518:
	lfd	f0, 0(r0)
	lfd	f1, 0(r1)
	lfd	f2, 0(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 0(r0)
	lfd	f0, 8(r0)
	lfd	f1, 8(r1)
	lfd	f2, 8(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 8(r0)
	lfd	f0, 16(r0)
	lfd	f1, 16(r1)
	lfd	f2, 16(r2)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	stfd	f0, 16(r0)
	blr
o_texturetype.2522:
	LW	r0, 0(r0)
	blr
o_form.2524:
	LW	r0, 4(r0)
	blr
o_reflectiontype.2526:
	LW	r0, 8(r0)
	blr
o_isinvert.2528:
	LW	r0, 24(r0)
	blr
o_isrot.2530:
	LW	r0, 12(r0)
	blr
o_param_a.2532:
	LW	r0, 16(r0)
	lfd	f0, 0(r0)
	blr
o_param_b.2534:
	LW	r0, 16(r0)
	lfd	f0, 8(r0)
	blr
o_param_c.2536:
	LW	r0, 16(r0)
	lfd	f0, 16(r0)
	blr
o_param_abc.2538:
	LW	r0, 16(r0)
	blr
o_param_x.2540:
	LW	r0, 20(r0)
	lfd	f0, 0(r0)
	blr
o_param_y.2542:
	LW	r0, 20(r0)
	lfd	f0, 8(r0)
	blr
o_param_z.2544:
	LW	r0, 20(r0)
	lfd	f0, 16(r0)
	blr
o_diffuse.2546:
	LW	r0, 28(r0)
	lfd	f0, 0(r0)
	blr
o_hilight.2548:
	LW	r0, 28(r0)
	lfd	f0, 8(r0)
	blr
o_color_red.2550:
	LW	r0, 32(r0)
	lfd	f0, 0(r0)
	blr
o_color_green.2552:
	LW	r0, 32(r0)
	lfd	f0, 8(r0)
	blr
o_color_blue.2554:
	LW	r0, 32(r0)
	lfd	f0, 16(r0)
	blr
o_param_r1.2556:
	LW	r0, 36(r0)
	lfd	f0, 0(r0)
	blr
o_param_r2.2558:
	LW	r0, 36(r0)
	lfd	f0, 8(r0)
	blr
o_param_r3.2560:
	LW	r0, 36(r0)
	lfd	f0, 16(r0)
	blr
o_param_ctbl.2562:
	LW	r0, 40(r0)
	blr
p_rgb.2564:
	LW	r0, 0(r0)
	blr
p_intersection_points.2566:
	LW	r0, 4(r0)
	blr
p_surface_ids.2568:
	LW	r0, 8(r0)
	blr
p_calc_diffuse.2570:
	LW	r0, 12(r0)
	blr
p_energy.2572:
	LW	r0, 16(r0)
	blr
p_received_ray_20percent.2574:
	LW	r0, 20(r0)
	blr
p_group_id.2576:
	LW	r0, 24(r0)
	LW	r0, 0(r0)
	blr
p_set_group_id.2578:
	LW	r0, 24(r0)
	SW	r1, 0(r0)
	blr
p_nvectors.2581:
	LW	r0, 28(r0)
	blr
d_vec.2583:
	LW	r0, 0(r0)
	blr
d_const.2585:
	LW	r0, 4(r0)
	blr
r_surface_id.2587:
	LW	r0, 0(r0)
	blr
r_dvec.2589:
	LW	r0, 4(r0)
	blr
r_bright.2591:
	lfd	f0, 8(r0)
	blr
rad.2593:
	lis	r29, ha16(l.6086)
	ADDI	r29, r29, lo16(l.6086)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	blr
read_screen_settings.2595:
	LW	r0, 20(r27)
	LW	r1, 16(r27)
	LW	r2, 12(r27)
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	stw	r0, 0(r30)
	stw	r2, 4(r30)
	stw	r3, 8(r30)
	stw	r1, 12(r30)
	stw	r4, 16(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_read_float
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	stfd	f0, 0(r0)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_read_float
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	stfd	f0, 8(r0)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_read_float
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	stfd	f0, 16(r0)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_read_float
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	rad.2593
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	stfd	f0, 24(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_cos
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	stfd	f0, 32(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_sin
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	stfd	f0, 40(r30)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_read_float
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	rad.2593
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	stfd	f0, 48(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_cos
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lfd	f1, 48(r30)
	stfd	f0, 56(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_sin
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 32(r30)
	fmul	f2, f1, f0
	lis	r29, ha16(l.6090)
	ADDI	r29, r29, lo16(l.6090)
	lfd	f3, 0(r29)
	fmul	f2, f2, f3
	lwz	r0, 12(r30)
	stfd	f2, 0(r0)
	lis	r29, ha16(l.6092)
	ADDI	r29, r29, lo16(l.6092)
	lfd	f2, 0(r29)
	lfd	f3, 40(r30)
	fmul	f2, f3, f2
	stfd	f2, 8(r0)
	lfd	f2, 56(r30)
	fmul	f4, f1, f2
	lis	r29, ha16(l.6090)
	ADDI	r29, r29, lo16(l.6090)
	lfd	f5, 0(r29)
	fmul	f4, f4, f5
	stfd	f4, 16(r0)
	lwz	r1, 8(r30)
	stfd	f2, 0(r1)
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f4, 0(r29)
	stfd	f4, 8(r1)
	stfd	f0, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fneg
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	stfd	f0, 16(r0)
	lfd	f0, 40(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fneg
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f1, 64(r30)
	fmul	f0, f0, f1
	lwz	r0, 4(r30)
	stfd	f0, 0(r0)
	lfd	f0, 32(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fneg
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	stfd	f0, 8(r0)
	lfd	f0, 40(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fneg
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fmul	f0, f0, f1
	lwz	r0, 4(r30)
	stfd	f0, 16(r0)
	lwz	r0, 16(r30)
	lfd	f0, 0(r0)
	lwz	r1, 12(r30)
	lfd	f1, 0(r1)
	fsub	f0, f0, f1
	lwz	r2, 0(r30)
	stfd	f0, 0(r2)
	lfd	f0, 8(r0)
	lfd	f1, 8(r1)
	fsub	f0, f0, f1
	stfd	f0, 8(r2)
	lfd	f0, 16(r0)
	lfd	f1, 16(r1)
	fsub	f0, f0, f1
	stfd	f0, 16(r2)
	blr
read_light.2597:
	LW	r0, 8(r27)
	LW	r1, 4(r27)
	stw	r1, 0(r30)
	stw	r0, 4(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_read_int
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_read_float
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	rad.2593
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	stfd	f0, 8(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_sin
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_fneg
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	stfd	f0, 8(r0)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_read_float
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	rad.2593
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lfd	f1, 8(r30)
	stfd	f0, 16(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_cos
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lfd	f1, 16(r30)
	stfd	f0, 24(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_sin
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	stfd	f0, 0(r0)
	lfd	f0, 16(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_cos
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	stfd	f0, 16(r0)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_read_float
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
	blr
rotate_quadratic_matrix.2599:
	lfd	f0, 0(r1)
	stw	r0, 0(r30)
	stw	r1, 4(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_cos
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lfd	f1, 0(r0)
	stfd	f0, 8(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_sin
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lfd	f1, 8(r0)
	stfd	f0, 16(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_cos
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lfd	f1, 8(r0)
	stfd	f0, 24(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_sin
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lfd	f1, 16(r0)
	stfd	f0, 32(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_cos
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lfd	f1, 16(r0)
	stfd	f0, 40(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_sin
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lfd	f1, 40(r30)
	lfd	f2, 24(r30)
	fmul	f3, f2, f1
	lfd	f4, 32(r30)
	lfd	f5, 16(r30)
	fmul	f6, f5, f4
	fmul	f6, f6, f1
	lfd	f7, 8(r30)
	fmul	f8, f7, f0
	fsub	f6, f6, f8
	fmul	f8, f7, f4
	fmul	f8, f8, f1
	fmul	f9, f5, f0
	fadd	f8, f8, f9
	fmul	f9, f2, f0
	fmul	f10, f5, f4
	fmul	f10, f10, f0
	fmul	f11, f7, f1
	fadd	f10, f10, f11
	fmul	f11, f7, f4
	fmul	f0, f11, f0
	fmul	f1, f5, f1
	fsub	f0, f0, f1
	stfd	f0, 48(r30)
	stfd	f8, 56(r30)
	stfd	f10, 64(r30)
	stfd	f6, 72(r30)
	stfd	f9, 80(r30)
	stfd	f3, 88(r30)
	mflr	r29
	fmr	f0, f4
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	min_caml_fneg
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	lfd	f2, 16(r30)
	fmul	f2, f2, f1
	lfd	f3, 8(r30)
	fmul	f1, f3, f1
	lwz	r0, 0(r30)
	lfd	f3, 0(r0)
	lfd	f4, 8(r0)
	lfd	f5, 16(r0)
	lfd	f6, 88(r30)
	stfd	f1, 96(r30)
	stfd	f2, 104(r30)
	stfd	f5, 112(r30)
	stfd	f0, 120(r30)
	stfd	f4, 128(r30)
	stfd	f3, 136(r30)
	mflr	r29
	fmr	f0, f6
	stw	r29, 148(r30)
	addi	r30, r30, 152
	bl	min_caml_fsqr
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
	lfd	f1, 136(r30)
	fmul	f0, f1, f0
	lfd	f2, 80(r30)
	stfd	f0, 144(r30)
	mflr	r29
	fmr	f0, f2
	stw	r29, 156(r30)
	addi	r30, r30, 160
	bl	min_caml_fsqr
	subi	r30, r30, 160
	lwz	r29, 156(r30)
	mtlr	r29
	lfd	f1, 128(r30)
	fmul	f0, f1, f0
	lfd	f2, 144(r30)
	fadd	f0, f2, f0
	lfd	f2, 120(r30)
	stfd	f0, 152(r30)
	mflr	r29
	fmr	f0, f2
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	min_caml_fsqr
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lfd	f1, 112(r30)
	fmul	f0, f1, f0
	lfd	f2, 152(r30)
	fadd	f0, f2, f0
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
	lfd	f0, 72(r30)
	mflr	r29
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	min_caml_fsqr
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lfd	f1, 136(r30)
	fmul	f0, f1, f0
	lfd	f2, 64(r30)
	stfd	f0, 160(r30)
	mflr	r29
	fmr	f0, f2
	stw	r29, 172(r30)
	addi	r30, r30, 176
	bl	min_caml_fsqr
	subi	r30, r30, 176
	lwz	r29, 172(r30)
	mtlr	r29
	lfd	f1, 128(r30)
	fmul	f0, f1, f0
	lfd	f2, 160(r30)
	fadd	f0, f2, f0
	lfd	f2, 104(r30)
	stfd	f0, 168(r30)
	mflr	r29
	fmr	f0, f2
	stw	r29, 180(r30)
	addi	r30, r30, 184
	bl	min_caml_fsqr
	subi	r30, r30, 184
	lwz	r29, 180(r30)
	mtlr	r29
	lfd	f1, 112(r30)
	fmul	f0, f1, f0
	lfd	f2, 168(r30)
	fadd	f0, f2, f0
	lwz	r0, 0(r30)
	stfd	f0, 8(r0)
	lfd	f0, 56(r30)
	mflr	r29
	stw	r29, 180(r30)
	addi	r30, r30, 184
	bl	min_caml_fsqr
	subi	r30, r30, 184
	lwz	r29, 180(r30)
	mtlr	r29
	lfd	f1, 136(r30)
	fmul	f0, f1, f0
	lfd	f2, 48(r30)
	stfd	f0, 176(r30)
	mflr	r29
	fmr	f0, f2
	stw	r29, 188(r30)
	addi	r30, r30, 192
	bl	min_caml_fsqr
	subi	r30, r30, 192
	lwz	r29, 188(r30)
	mtlr	r29
	lfd	f1, 128(r30)
	fmul	f0, f1, f0
	lfd	f2, 176(r30)
	fadd	f0, f2, f0
	lfd	f2, 96(r30)
	stfd	f0, 184(r30)
	mflr	r29
	fmr	f0, f2
	stw	r29, 196(r30)
	addi	r30, r30, 200
	bl	min_caml_fsqr
	subi	r30, r30, 200
	lwz	r29, 196(r30)
	mtlr	r29
	lfd	f1, 112(r30)
	fmul	f0, f1, f0
	lfd	f2, 184(r30)
	fadd	f0, f2, f0
	lwz	r0, 0(r30)
	stfd	f0, 16(r0)
	lis	r29, ha16(l.6126)
	ADDI	r29, r29, lo16(l.6126)
	lfd	f0, 0(r29)
	lfd	f2, 72(r30)
	lfd	f3, 136(r30)
	fmul	f4, f3, f2
	lfd	f5, 56(r30)
	fmul	f4, f4, f5
	lfd	f6, 64(r30)
	lfd	f7, 128(r30)
	fmul	f8, f7, f6
	lfd	f9, 48(r30)
	fmul	f8, f8, f9
	fadd	f4, f4, f8
	lfd	f8, 104(r30)
	fmul	f10, f1, f8
	lfd	f11, 96(r30)
	fmul	f10, f10, f11
	fadd	f4, f4, f10
	fmul	f0, f0, f4
	lwz	r0, 4(r30)
	stfd	f0, 0(r0)
	lis	r29, ha16(l.6126)
	ADDI	r29, r29, lo16(l.6126)
	lfd	f0, 0(r29)
	lfd	f4, 88(r30)
	fmul	f10, f3, f4
	fmul	f5, f10, f5
	lfd	f10, 80(r30)
	fmul	f12, f7, f10
	fmul	f9, f12, f9
	fadd	f5, f5, f9
	lfd	f9, 120(r30)
	fmul	f12, f1, f9
	fmul	f11, f12, f11
	fadd	f5, f5, f11
	fmul	f0, f0, f5
	stfd	f0, 8(r0)
	lis	r29, ha16(l.6126)
	ADDI	r29, r29, lo16(l.6126)
	lfd	f0, 0(r29)
	fmul	f3, f3, f4
	fmul	f2, f3, f2
	fmul	f3, f7, f10
	fmul	f3, f3, f6
	fadd	f2, f2, f3
	fmul	f1, f1, f9
	fmul	f1, f1, f8
	fadd	f1, f2, f1
	fmul	f0, f0, f1
	stfd	f0, 16(r0)
	blr
read_nth_object.2602:
	LW	r1, 4(r27)
	stw	r1, 0(r30)
	stw	r0, 4(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_read_int
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	cmpwi	cr7, r0, -1
	bne	cr7, beq_else.8672
	LI	r0, 0
	blr
beq_else.8672:
	stw	r0, 8(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_read_int
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	stw	r0, 12(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_read_int
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	stw	r0, 16(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_read_int
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 20(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_create_float_array
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	stw	r0, 24(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_read_float
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 24(r30)
	stfd	f0, 0(r0)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_read_float
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 24(r30)
	stfd	f0, 8(r0)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_read_float
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 24(r30)
	stfd	f0, 16(r0)
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	mflr	r29
	mr	r0, r1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_create_float_array
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	stw	r0, 28(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_read_float
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 28(r30)
	stfd	f0, 0(r0)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_read_float
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 28(r30)
	stfd	f0, 8(r0)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_read_float
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 28(r30)
	stfd	f0, 16(r0)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_read_float
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fisneg
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	LI	r1, 2
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 32(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_create_float_array
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	stw	r0, 36(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_read_float
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 36(r30)
	stfd	f0, 0(r0)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_read_float
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 36(r30)
	stfd	f0, 8(r0)
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	mflr	r29
	mr	r0, r1
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_create_float_array
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	stw	r0, 40(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_read_float
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 40(r30)
	stfd	f0, 0(r0)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_read_float
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 40(r30)
	stfd	f0, 8(r0)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_read_float
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 40(r30)
	stfd	f0, 16(r0)
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	mflr	r29
	mr	r0, r1
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_create_float_array
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	cmpwi	cr7, r1, 0
	bne	cr7, beq_else.8673
	b	beq_cont.8674
beq_else.8673:
	stw	r0, 44(r30)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_read_float
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	rad.2593
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lwz	r0, 44(r30)
	stfd	f0, 0(r0)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_read_float
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	rad.2593
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lwz	r0, 44(r30)
	stfd	f0, 8(r0)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_read_float
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	rad.2593
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lwz	r0, 44(r30)
	stfd	f0, 16(r0)
beq_cont.8674:
	lwz	r1, 12(r30)
	cmpwi	cr7, r1, 2
	bne	cr7, beq_else.8675
	LI	r2, 1
	b	beq_cont.8676
beq_else.8675:
	lwz	r2, 32(r30)
beq_cont.8676:
	LI	r3, 4
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r2, 48(r30)
	stw	r0, 44(r30)
	mflr	r29
	mr	r0, r3
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_create_float_array
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	MOV	r1, r28
	ADDI	r28, r28, 48
	SW	r0, 40(r1)
	lwz	r0, 44(r30)
	SW	r0, 36(r1)
	lwz	r2, 40(r30)
	SW	r2, 32(r1)
	lwz	r2, 36(r30)
	SW	r2, 28(r1)
	lwz	r2, 48(r30)
	SW	r2, 24(r1)
	lwz	r2, 28(r30)
	SW	r2, 20(r1)
	lwz	r2, 24(r30)
	SW	r2, 16(r1)
	lwz	r3, 20(r30)
	SW	r3, 12(r1)
	lwz	r4, 16(r30)
	SW	r4, 8(r1)
	lwz	r4, 12(r30)
	SW	r4, 4(r1)
	lwz	r5, 8(r30)
	SW	r5, 0(r1)
	lwz	r5, 4(r30)
	SLL	r5, r5, 2
	lwz	r6, 0(r30)
	SW	r1, r6, r5
	cmpwi	cr7, r4, 3
	bne	cr7, beq_else.8677
	lfd	f0, 0(r2)
	stfd	f0, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fiszero
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8680
	lfd	f0, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	sgn.2468
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	stfd	f0, 64(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fsqr
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f1, 64(r30)
	fdiv	f0, f1, f0
	b	beq_cont.8681
beq_else.8680:
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
beq_cont.8681:
	lwz	r0, 24(r30)
	stfd	f0, 0(r0)
	lfd	f0, 8(r0)
	stfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_fiszero
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8682
	lfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	sgn.2468
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 72(r30)
	stfd	f0, 80(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_fsqr
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lfd	f1, 80(r30)
	fdiv	f0, f1, f0
	b	beq_cont.8683
beq_else.8682:
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
beq_cont.8683:
	lwz	r0, 24(r30)
	stfd	f0, 8(r0)
	lfd	f0, 16(r0)
	stfd	f0, 88(r30)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	min_caml_fiszero
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8684
	lfd	f0, 88(r30)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	sgn.2468
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lfd	f1, 88(r30)
	stfd	f0, 96(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	min_caml_fsqr
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lfd	f1, 96(r30)
	fdiv	f0, f1, f0
	b	beq_cont.8685
beq_else.8684:
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
beq_cont.8685:
	lwz	r0, 24(r30)
	stfd	f0, 16(r0)
	b	beq_cont.8678
beq_else.8677:
	cmpwi	cr7, r4, 2
	bne	cr7, beq_else.8686
	lwz	r1, 32(r30)
	cmpwi	cr7, r1, 0
	bne	cr7, beq_else.8688
	LI	r1, 1
	b	beq_cont.8689
beq_else.8688:
	LI	r1, 0
beq_cont.8689:
	mflr	r29
	mr	r0, r2
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	vecunit_sgn.2494
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	b	beq_cont.8687
beq_else.8686:
beq_cont.8687:
beq_cont.8678:
	lwz	r0, 20(r30)
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8690
	b	beq_cont.8691
beq_else.8690:
	lwz	r0, 24(r30)
	lwz	r1, 44(r30)
	mflr	r29
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	rotate_quadratic_matrix.2599
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
beq_cont.8691:
	LI	r0, 1
	blr
read_object.2604:
	LW	r1, 8(r27)
	LW	r2, 4(r27)
	cmpwi	cr7, r0, 60
	blt	cr7, bge_else.8692
	blr
bge_else.8692:
	stw	r27, 0(r30)
	stw	r2, 4(r30)
	stw	r0, 8(r30)
	mflr	r29
	mr	r27, r1
	stw	r29, 12(r30)
	addi	r30, r30, 16
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8694
	lwz	r0, 4(r30)
	lwz	r1, 8(r30)
	SW	r1, 0(r0)
	blr
beq_else.8694:
	lwz	r0, 8(r30)
	ADDI	r0, r0, 1
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
read_all_object.2606:
	LW	r27, 4(r27)
	LI	r0, 0
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
read_net_item.2608:
	stw	r0, 0(r30)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_read_int
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	cmpwi	cr7, r0, -1
	bne	cr7, beq_else.8696
	lwz	r0, 0(r30)
	ADDI	r0, r0, 1
	LI	r1, -1
	b	min_caml_create_array
beq_else.8696:
	lwz	r1, 0(r30)
	ADDI	r2, r1, 1
	stw	r0, 4(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	read_net_item.2608
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	SLL	r1, r1, 2
	lwz	r2, 4(r30)
	SW	r2, r0, r1
	blr
read_or_network.2610:
	LI	r1, 0
	stw	r0, 0(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	read_net_item.2608
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mr	r1, r0
	mtlr	r29
	LW	r0, 0(r1)
	cmpwi	cr7, r0, -1
	bne	cr7, beq_else.8697
	lwz	r0, 0(r30)
	ADDI	r0, r0, 1
	b	min_caml_create_array
beq_else.8697:
	lwz	r0, 0(r30)
	ADDI	r2, r0, 1
	stw	r1, 4(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	read_or_network.2610
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	SLL	r1, r1, 2
	lwz	r2, 4(r30)
	SW	r2, r0, r1
	blr
read_and_network.2612:
	LW	r1, 4(r27)
	LI	r2, 0
	stw	r27, 0(r30)
	stw	r1, 4(r30)
	stw	r0, 8(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	read_net_item.2608
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	LW	r1, 0(r0)
	cmpwi	cr7, r1, -1
	bne	cr7, beq_else.8698
	blr
beq_else.8698:
	lwz	r1, 8(r30)
	SLL	r2, r1, 2
	lwz	r3, 4(r30)
	SW	r0, r3, r2
	ADDI	r0, r1, 1
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
read_parameter.2614:
	LW	r0, 20(r27)
	LW	r1, 16(r27)
	LW	r2, 12(r27)
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	stw	r4, 0(r30)
	stw	r2, 4(r30)
	stw	r3, 8(r30)
	stw	r1, 12(r30)
	mflr	r29
	mr	r27, r0
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r27, 12(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r27, 8(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	LI	r0, 0
	lwz	r27, 4(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	LI	r0, 0
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	read_or_network.2610
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	SW	r0, 0(r1)
	blr
solver_rect_surface.2616:
	LW	r5, 4(r27)
	SLL	r6, r2, 3
	lfdx	f3, r1, r6
	stw	r5, 0(r30)
	stfd	f2, 8(r30)
	stw	r4, 16(r30)
	stfd	f1, 24(r30)
	stw	r3, 32(r30)
	stfd	f0, 40(r30)
	stw	r1, 48(r30)
	stw	r2, 52(r30)
	stw	r0, 56(r30)
	mflr	r29
	fmr	f0, f3
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_fiszero
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8704
	lwz	r0, 56(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	o_param_abc.2538
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lwz	r1, 56(r30)
	stw	r0, 60(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_isinvert.2528
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r1, 52(r30)
	SLL	r2, r1, 3
	lwz	r3, 48(r30)
	lfdx	f0, r3, r2
	stw	r0, 64(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fisneg
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 64(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	xor.2465
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r1, 52(r30)
	SLL	r2, r1, 3
	lwz	r3, 60(r30)
	lfdx	f0, r3, r2
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	fneg_cond.2470
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 40(r30)
	fsub	f0, f0, f1
	lwz	r0, 52(r30)
	SLL	r0, r0, 3
	lwz	r1, 48(r30)
	lfdx	f1, r1, r0
	fdiv	f0, f0, f1
	lwz	r0, 32(r30)
	SLL	r2, r0, 3
	lfdx	f1, r1, r2
	fmul	f1, f0, f1
	lfd	f2, 24(r30)
	fadd	f1, f1, f2
	stfd	f0, 72(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_fabs
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lwz	r0, 32(r30)
	SLL	r0, r0, 3
	lwz	r1, 60(r30)
	lfdx	f1, r1, r0
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_fless
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8706
	LI	r0, 0
	blr
beq_else.8706:
	lwz	r0, 16(r30)
	SLL	r1, r0, 3
	lwz	r2, 48(r30)
	lfdx	f0, r2, r1
	lfd	f1, 72(r30)
	fmul	f0, f1, f0
	lfd	f2, 8(r30)
	fadd	f0, f0, f2
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_fabs
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	SLL	r0, r0, 3
	lwz	r1, 60(r30)
	lfdx	f1, r1, r0
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_fless
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8707
	LI	r0, 0
	blr
beq_else.8707:
	lwz	r0, 0(r30)
	lfd	f0, 72(r30)
	stfd	f0, 0(r0)
	LI	r0, 1
	blr
beq_else.8704:
	LI	r0, 0
	blr
solver_rect.2625:
	LW	r27, 4(r27)
	LI	r2, 0
	LI	r3, 1
	LI	r4, 2
	stfd	f0, 0(r30)
	stfd	f2, 8(r30)
	stfd	f1, 16(r30)
	stw	r1, 24(r30)
	stw	r0, 28(r30)
	stw	r27, 32(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8708
	LI	r2, 1
	LI	r3, 2
	LI	r4, 0
	lfd	f0, 16(r30)
	lfd	f1, 8(r30)
	lfd	f2, 0(r30)
	lwz	r0, 28(r30)
	lwz	r1, 24(r30)
	lwz	r27, 32(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8709
	LI	r2, 2
	LI	r3, 0
	LI	r4, 1
	lfd	f0, 8(r30)
	lfd	f1, 0(r30)
	lfd	f2, 16(r30)
	lwz	r0, 28(r30)
	lwz	r1, 24(r30)
	lwz	r27, 32(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8710
	LI	r0, 0
	blr
beq_else.8710:
	LI	r0, 3
	blr
beq_else.8709:
	LI	r0, 2
	blr
beq_else.8708:
	LI	r0, 1
	blr
solver_surface.2631:
	LW	r2, 4(r27)
	stw	r2, 0(r30)
	stfd	f2, 8(r30)
	stfd	f1, 16(r30)
	stfd	f0, 24(r30)
	stw	r1, 32(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	o_param_abc.2538
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 32(r30)
	stw	r1, 36(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	veciprod.2497
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	stfd	f0, 40(r30)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_fispos
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8712
	LI	r0, 0
	blr
beq_else.8712:
	lfd	f0, 24(r30)
	lfd	f1, 16(r30)
	lfd	f2, 8(r30)
	lwz	r0, 36(r30)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	veciprod2.2500
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_fneg
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lfd	f1, 40(r30)
	fdiv	f0, f0, f1
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
	LI	r0, 1
	blr
quadratic.2637:
	stfd	f0, 0(r30)
	stfd	f2, 8(r30)
	stfd	f1, 16(r30)
	stw	r0, 24(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_fsqr
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 24(r30)
	stfd	f0, 32(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	o_param_a.2532
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lfd	f1, 32(r30)
	fmul	f0, f1, f0
	lfd	f1, 16(r30)
	stfd	f0, 40(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_fsqr
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lwz	r0, 24(r30)
	stfd	f0, 48(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	o_param_b.2534
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lfd	f1, 48(r30)
	fmul	f0, f1, f0
	lfd	f1, 40(r30)
	fadd	f0, f1, f0
	lfd	f1, 8(r30)
	stfd	f0, 56(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fsqr
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 24(r30)
	stfd	f0, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	o_param_c.2536
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f1, 64(r30)
	fmul	f0, f1, f0
	lfd	f1, 56(r30)
	fadd	f0, f1, f0
	lwz	r0, 24(r30)
	stfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	o_isrot.2530
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8714
	lfd	f0, 72(r30)
	blr
beq_else.8714:
	lfd	f0, 8(r30)
	lfd	f1, 16(r30)
	fmul	f2, f1, f0
	lwz	r0, 24(r30)
	stfd	f2, 80(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	o_param_r1.2556
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lfd	f1, 80(r30)
	fmul	f0, f1, f0
	lfd	f1, 72(r30)
	fadd	f0, f1, f0
	lfd	f1, 0(r30)
	lfd	f2, 8(r30)
	fmul	f2, f2, f1
	lwz	r0, 24(r30)
	stfd	f0, 88(r30)
	stfd	f2, 96(r30)
	mflr	r29
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	o_param_r2.2558
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lfd	f1, 96(r30)
	fmul	f0, f1, f0
	lfd	f1, 88(r30)
	fadd	f0, f1, f0
	lfd	f1, 16(r30)
	lfd	f2, 0(r30)
	fmul	f1, f2, f1
	lwz	r0, 24(r30)
	stfd	f0, 104(r30)
	stfd	f1, 112(r30)
	mflr	r29
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	o_param_r3.2560
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	lfd	f1, 112(r30)
	fmul	f0, f1, f0
	lfd	f1, 104(r30)
	fadd	f0, f1, f0
	blr
bilinear.2642:
	fmul	f6, f0, f3
	stfd	f3, 0(r30)
	stfd	f0, 8(r30)
	stfd	f5, 16(r30)
	stfd	f2, 24(r30)
	stw	r0, 32(r30)
	stfd	f4, 40(r30)
	stfd	f1, 48(r30)
	stfd	f6, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_param_a.2532
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fmul	f0, f1, f0
	lfd	f1, 40(r30)
	lfd	f2, 48(r30)
	fmul	f3, f2, f1
	lwz	r0, 32(r30)
	stfd	f0, 64(r30)
	stfd	f3, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	o_param_b.2534
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 72(r30)
	fmul	f0, f1, f0
	lfd	f1, 64(r30)
	fadd	f0, f1, f0
	lfd	f1, 16(r30)
	lfd	f2, 24(r30)
	fmul	f3, f2, f1
	lwz	r0, 32(r30)
	stfd	f0, 80(r30)
	stfd	f3, 88(r30)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	o_param_c.2536
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lfd	f1, 88(r30)
	fmul	f0, f1, f0
	lfd	f1, 80(r30)
	fadd	f0, f1, f0
	lwz	r0, 32(r30)
	stfd	f0, 96(r30)
	mflr	r29
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	o_isrot.2530
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8716
	lfd	f0, 96(r30)
	blr
beq_else.8716:
	lfd	f0, 40(r30)
	lfd	f1, 24(r30)
	fmul	f2, f1, f0
	lfd	f3, 16(r30)
	lfd	f4, 48(r30)
	fmul	f5, f4, f3
	fadd	f2, f2, f5
	lwz	r0, 32(r30)
	stfd	f2, 104(r30)
	mflr	r29
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	o_param_r1.2556
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	lfd	f1, 104(r30)
	fmul	f0, f1, f0
	lfd	f1, 16(r30)
	lfd	f2, 8(r30)
	fmul	f1, f2, f1
	lfd	f3, 0(r30)
	lfd	f4, 24(r30)
	fmul	f4, f4, f3
	fadd	f1, f1, f4
	lwz	r0, 32(r30)
	stfd	f0, 112(r30)
	stfd	f1, 120(r30)
	mflr	r29
	stw	r29, 132(r30)
	addi	r30, r30, 136
	bl	o_param_r2.2558
	subi	r30, r30, 136
	lwz	r29, 132(r30)
	mtlr	r29
	lfd	f1, 120(r30)
	fmul	f0, f1, f0
	lfd	f1, 112(r30)
	fadd	f0, f1, f0
	lfd	f1, 40(r30)
	lfd	f2, 8(r30)
	fmul	f1, f2, f1
	lfd	f2, 0(r30)
	lfd	f3, 48(r30)
	fmul	f2, f3, f2
	fadd	f1, f1, f2
	lwz	r0, 32(r30)
	stfd	f0, 128(r30)
	stfd	f1, 136(r30)
	mflr	r29
	stw	r29, 148(r30)
	addi	r30, r30, 152
	bl	o_param_r3.2560
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
	lfd	f1, 136(r30)
	fmul	f0, f1, f0
	lfd	f1, 128(r30)
	fadd	f0, f1, f0
	mflr	r29
	stw	r29, 148(r30)
	addi	r30, r30, 152
	bl	min_caml_fhalf
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
	lfd	f1, 96(r30)
	fadd	f0, f1, f0
	blr
solver_second.2650:
	LW	r2, 4(r27)
	lfd	f3, 0(r1)
	lfd	f4, 8(r1)
	lfd	f5, 16(r1)
	stw	r2, 0(r30)
	stfd	f2, 8(r30)
	stfd	f1, 16(r30)
	stfd	f0, 24(r30)
	stw	r0, 32(r30)
	stw	r1, 36(r30)
	mflr	r29
	fmr	f2, f5
	fmr	f1, f4
	fmr	f0, f3
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	quadratic.2637
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	stfd	f0, 40(r30)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_fiszero
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8718
	lwz	r0, 36(r30)
	lfd	f0, 0(r0)
	lfd	f1, 8(r0)
	lfd	f2, 16(r0)
	lfd	f3, 24(r30)
	lfd	f4, 16(r30)
	lfd	f5, 8(r30)
	lwz	r0, 32(r30)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	bilinear.2642
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	lfd	f2, 16(r30)
	lfd	f3, 8(r30)
	lwz	r0, 32(r30)
	stfd	f0, 48(r30)
	mflr	r29
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	quadratic.2637
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lwz	r0, 32(r30)
	stfd	f0, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_form.2524
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	cmpwi	cr7, r0, 3
	bne	cr7, beq_else.8719
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	lfd	f1, 56(r30)
	fsub	f0, f1, f0
	b	beq_cont.8720
beq_else.8719:
	lfd	f0, 56(r30)
beq_cont.8720:
	lfd	f1, 48(r30)
	stfd	f0, 64(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fsqr
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f1, 64(r30)
	lfd	f2, 40(r30)
	fmul	f1, f2, f1
	fsub	f0, f0, f1
	stfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_fispos
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8721
	LI	r0, 0
	blr
beq_else.8721:
	lfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_sqrt
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lwz	r0, 32(r30)
	stfd	f0, 80(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	o_isinvert.2528
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8722
	lfd	f0, 80(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_fneg
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	b	beq_cont.8723
beq_else.8722:
	lfd	f0, 80(r30)
beq_cont.8723:
	lfd	f1, 48(r30)
	fsub	f0, f0, f1
	lfd	f1, 40(r30)
	fdiv	f0, f0, f1
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
	LI	r0, 1
	blr
beq_else.8718:
	LI	r0, 0
	blr
solver.2656:
	LW	r3, 16(r27)
	LW	r4, 12(r27)
	LW	r5, 8(r27)
	LW	r6, 4(r27)
	SLL	r0, r0, 2
	LW	r0, r6, r0
	lfd	f0, 0(r2)
	stw	r4, 0(r30)
	stw	r3, 4(r30)
	stw	r1, 8(r30)
	stw	r5, 12(r30)
	stw	r0, 16(r30)
	stw	r2, 20(r30)
	stfd	f0, 24(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	o_param_x.2540
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fsub	f0, f1, f0
	lwz	r0, 20(r30)
	lfd	f1, 8(r0)
	lwz	r1, 16(r30)
	stfd	f0, 32(r30)
	stfd	f1, 40(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	o_param_y.2542
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lfd	f1, 40(r30)
	fsub	f0, f1, f0
	lwz	r0, 20(r30)
	lfd	f1, 16(r0)
	lwz	r0, 16(r30)
	stfd	f0, 48(r30)
	stfd	f1, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_param_z.2544
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fsub	f0, f1, f0
	lwz	r0, 16(r30)
	stfd	f0, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	o_form.2524
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	cmpwi	cr7, r0, 1
	bne	cr7, beq_else.8724
	lfd	f0, 32(r30)
	lfd	f1, 48(r30)
	lfd	f2, 64(r30)
	lwz	r0, 16(r30)
	lwz	r1, 8(r30)
	lwz	r27, 12(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8724:
	cmpwi	cr7, r0, 2
	bne	cr7, beq_else.8725
	lfd	f0, 32(r30)
	lfd	f1, 48(r30)
	lfd	f2, 64(r30)
	lwz	r0, 16(r30)
	lwz	r1, 8(r30)
	lwz	r27, 4(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8725:
	lfd	f0, 32(r30)
	lfd	f1, 48(r30)
	lfd	f2, 64(r30)
	lwz	r0, 16(r30)
	lwz	r1, 8(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
solver_rect_fast.2660:
	LW	r3, 4(r27)
	lfd	f3, 0(r2)
	fsub	f3, f3, f0
	lfd	f4, 8(r2)
	fmul	f3, f3, f4
	lfd	f4, 8(r1)
	fmul	f4, f3, f4
	fadd	f4, f4, f1
	stw	r3, 0(r30)
	stfd	f0, 8(r30)
	stfd	f1, 16(r30)
	stw	r2, 24(r30)
	stfd	f2, 32(r30)
	stfd	f3, 40(r30)
	stw	r1, 48(r30)
	stw	r0, 52(r30)
	mflr	r29
	fmr	f0, f4
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_fabs
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lwz	r0, 52(r30)
	stfd	f0, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_param_b.2534
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fless
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8728
	LI	r0, 0
	b	beq_cont.8729
beq_else.8728:
	lwz	r0, 48(r30)
	lfd	f0, 16(r0)
	lfd	f1, 40(r30)
	fmul	f0, f1, f0
	lfd	f2, 32(r30)
	fadd	f0, f0, f2
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fabs
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 52(r30)
	stfd	f0, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	o_param_c.2536
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fless
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8730
	LI	r0, 0
	b	beq_cont.8731
beq_else.8730:
	lwz	r0, 24(r30)
	lfd	f0, 8(r0)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fiszero
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8732
	LI	r0, 1
	b	beq_cont.8733
beq_else.8732:
	LI	r0, 0
beq_cont.8733:
beq_cont.8731:
beq_cont.8729:
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8734
	lwz	r0, 24(r30)
	lfd	f0, 16(r0)
	lfd	f1, 16(r30)
	fsub	f0, f0, f1
	lfd	f2, 24(r0)
	fmul	f0, f0, f2
	lwz	r1, 48(r30)
	lfd	f2, 0(r1)
	fmul	f2, f0, f2
	lfd	f3, 8(r30)
	fadd	f2, f2, f3
	stfd	f0, 72(r30)
	mflr	r29
	fmr	f0, f2
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_fabs
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lwz	r0, 52(r30)
	stfd	f0, 80(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	o_param_a.2532
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 80(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_fless
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8735
	LI	r0, 0
	b	beq_cont.8736
beq_else.8735:
	lwz	r0, 48(r30)
	lfd	f0, 16(r0)
	lfd	f1, 72(r30)
	fmul	f0, f1, f0
	lfd	f2, 32(r30)
	fadd	f0, f0, f2
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_fabs
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lwz	r0, 52(r30)
	stfd	f0, 88(r30)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	o_param_c.2536
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 88(r30)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	min_caml_fless
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8737
	LI	r0, 0
	b	beq_cont.8738
beq_else.8737:
	lwz	r0, 24(r30)
	lfd	f0, 24(r0)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	min_caml_fiszero
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8739
	LI	r0, 1
	b	beq_cont.8740
beq_else.8739:
	LI	r0, 0
beq_cont.8740:
beq_cont.8738:
beq_cont.8736:
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8741
	lwz	r0, 24(r30)
	lfd	f0, 32(r0)
	lfd	f1, 32(r30)
	fsub	f0, f0, f1
	lfd	f1, 40(r0)
	fmul	f0, f0, f1
	lwz	r1, 48(r30)
	lfd	f1, 0(r1)
	fmul	f1, f0, f1
	lfd	f2, 8(r30)
	fadd	f1, f1, f2
	stfd	f0, 96(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	min_caml_fabs
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lwz	r0, 52(r30)
	stfd	f0, 104(r30)
	mflr	r29
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	o_param_a.2532
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 104(r30)
	mflr	r29
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	min_caml_fless
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8742
	LI	r0, 0
	b	beq_cont.8743
beq_else.8742:
	lwz	r0, 48(r30)
	lfd	f0, 8(r0)
	lfd	f1, 96(r30)
	fmul	f0, f1, f0
	lfd	f2, 16(r30)
	fadd	f0, f0, f2
	mflr	r29
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	min_caml_fabs
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	lwz	r0, 52(r30)
	stfd	f0, 112(r30)
	mflr	r29
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	o_param_b.2534
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 112(r30)
	mflr	r29
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	min_caml_fless
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8744
	LI	r0, 0
	b	beq_cont.8745
beq_else.8744:
	lwz	r0, 24(r30)
	lfd	f0, 40(r0)
	mflr	r29
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	min_caml_fiszero
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8746
	LI	r0, 1
	b	beq_cont.8747
beq_else.8746:
	LI	r0, 0
beq_cont.8747:
beq_cont.8745:
beq_cont.8743:
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8748
	LI	r0, 0
	blr
beq_else.8748:
	lwz	r0, 0(r30)
	lfd	f0, 96(r30)
	stfd	f0, 0(r0)
	LI	r0, 3
	blr
beq_else.8741:
	lwz	r0, 0(r30)
	lfd	f0, 72(r30)
	stfd	f0, 0(r0)
	LI	r0, 2
	blr
beq_else.8734:
	lwz	r0, 0(r30)
	lfd	f0, 40(r30)
	stfd	f0, 0(r0)
	LI	r0, 1
	blr
solver_surface_fast.2667:
	LW	r0, 4(r27)
	lfd	f3, 0(r1)
	stw	r0, 0(r30)
	stfd	f2, 8(r30)
	stfd	f1, 16(r30)
	stfd	f0, 24(r30)
	stw	r1, 32(r30)
	mflr	r29
	fmr	f0, f3
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fisneg
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8750
	LI	r0, 0
	blr
beq_else.8750:
	lwz	r0, 32(r30)
	lfd	f0, 8(r0)
	lfd	f1, 24(r30)
	fmul	f0, f0, f1
	lfd	f1, 16(r0)
	lfd	f2, 16(r30)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 24(r0)
	lfd	f2, 8(r30)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
	LI	r0, 1
	blr
solver_second_fast.2673:
	LW	r2, 4(r27)
	lfd	f3, 0(r1)
	stw	r2, 0(r30)
	stfd	f3, 8(r30)
	stw	r0, 16(r30)
	stfd	f2, 24(r30)
	stfd	f1, 32(r30)
	stfd	f0, 40(r30)
	stw	r1, 48(r30)
	mflr	r29
	fmr	f0, f3
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_fiszero
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8753
	lwz	r0, 48(r30)
	lfd	f0, 8(r0)
	lfd	f1, 40(r30)
	fmul	f0, f0, f1
	lfd	f2, 16(r0)
	lfd	f3, 32(r30)
	fmul	f2, f2, f3
	fadd	f0, f0, f2
	lfd	f2, 24(r0)
	lfd	f4, 24(r30)
	fmul	f2, f2, f4
	fadd	f0, f0, f2
	lwz	r1, 16(r30)
	stfd	f0, 56(r30)
	mflr	r29
	mr	r0, r1
	fmr	f2, f4
	fmr	f0, f1
	fmr	f1, f3
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	quadratic.2637
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	stfd	f0, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	o_form.2524
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	cmpwi	cr7, r0, 3
	bne	cr7, beq_else.8755
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	lfd	f1, 64(r30)
	fsub	f0, f1, f0
	b	beq_cont.8756
beq_else.8755:
	lfd	f0, 64(r30)
beq_cont.8756:
	lfd	f1, 56(r30)
	stfd	f0, 72(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_fsqr
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 72(r30)
	lfd	f2, 8(r30)
	fmul	f1, f2, f1
	fsub	f0, f0, f1
	stfd	f0, 80(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_fispos
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8757
	LI	r0, 0
	blr
beq_else.8757:
	lwz	r0, 16(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	o_isinvert.2528
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8758
	lfd	f0, 80(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_sqrt
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fsub	f0, f1, f0
	lwz	r0, 48(r30)
	lfd	f1, 32(r0)
	fmul	f0, f0, f1
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
	b	beq_cont.8759
beq_else.8758:
	lfd	f0, 80(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_sqrt
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fadd	f0, f1, f0
	lwz	r0, 48(r30)
	lfd	f1, 32(r0)
	fmul	f0, f0, f1
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
beq_cont.8759:
	LI	r0, 1
	blr
beq_else.8753:
	LI	r0, 0
	blr
solver_fast.2679:
	LW	r3, 16(r27)
	LW	r4, 12(r27)
	LW	r5, 8(r27)
	LW	r6, 4(r27)
	SLL	r7, r0, 2
	LW	r6, r6, r7
	lfd	f0, 0(r2)
	stw	r4, 0(r30)
	stw	r3, 4(r30)
	stw	r5, 8(r30)
	stw	r0, 12(r30)
	stw	r1, 16(r30)
	stw	r6, 20(r30)
	stw	r2, 24(r30)
	stfd	f0, 32(r30)
	mflr	r29
	mr	r0, r6
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	o_param_x.2540
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lfd	f1, 32(r30)
	fsub	f0, f1, f0
	lwz	r0, 24(r30)
	lfd	f1, 8(r0)
	lwz	r1, 20(r30)
	stfd	f0, 40(r30)
	stfd	f1, 48(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	o_param_y.2542
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lfd	f1, 48(r30)
	fsub	f0, f1, f0
	lwz	r0, 24(r30)
	lfd	f1, 16(r0)
	lwz	r0, 20(r30)
	stfd	f0, 56(r30)
	stfd	f1, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	o_param_z.2544
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f1, 64(r30)
	fsub	f0, f1, f0
	lwz	r0, 16(r30)
	stfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	d_const.2585
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lwz	r1, 12(r30)
	SLL	r1, r1, 2
	LW	r0, r0, r1
	lwz	r1, 20(r30)
	stw	r0, 80(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	o_form.2524
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	cmpwi	cr7, r0, 1
	bne	cr7, beq_else.8761
	lwz	r0, 16(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	d_vec.2583
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mr	r1, r0
	mtlr	r29
	lfd	f0, 40(r30)
	lfd	f1, 56(r30)
	lfd	f2, 72(r30)
	lwz	r0, 20(r30)
	lwz	r2, 80(r30)
	lwz	r27, 8(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8761:
	cmpwi	cr7, r0, 2
	bne	cr7, beq_else.8762
	lfd	f0, 40(r30)
	lfd	f1, 56(r30)
	lfd	f2, 72(r30)
	lwz	r0, 20(r30)
	lwz	r1, 80(r30)
	lwz	r27, 4(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8762:
	lfd	f0, 40(r30)
	lfd	f1, 56(r30)
	lfd	f2, 72(r30)
	lwz	r0, 20(r30)
	lwz	r1, 80(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
solver_surface_fast2.2683:
	LW	r0, 4(r27)
	lfd	f0, 0(r1)
	stw	r0, 0(r30)
	stw	r2, 4(r30)
	stw	r1, 8(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_fisneg
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8763
	LI	r0, 0
	blr
beq_else.8763:
	lwz	r0, 8(r30)
	lfd	f0, 0(r0)
	lwz	r0, 4(r30)
	lfd	f1, 24(r0)
	fmul	f0, f0, f1
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
	LI	r0, 1
	blr
solver_second_fast2.2690:
	LW	r3, 4(r27)
	lfd	f3, 0(r1)
	stw	r3, 0(r30)
	stw	r0, 4(r30)
	stfd	f3, 8(r30)
	stw	r2, 16(r30)
	stfd	f2, 24(r30)
	stfd	f1, 32(r30)
	stfd	f0, 40(r30)
	stw	r1, 48(r30)
	mflr	r29
	fmr	f0, f3
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_fiszero
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8765
	lwz	r0, 48(r30)
	lfd	f0, 8(r0)
	lfd	f1, 40(r30)
	fmul	f0, f0, f1
	lfd	f1, 16(r0)
	lfd	f2, 32(r30)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lfd	f1, 24(r0)
	lfd	f2, 24(r30)
	fmul	f1, f1, f2
	fadd	f0, f0, f1
	lwz	r1, 16(r30)
	lfd	f1, 24(r1)
	stfd	f0, 56(r30)
	stfd	f1, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fsqr
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f1, 64(r30)
	lfd	f2, 8(r30)
	fmul	f1, f2, f1
	fsub	f0, f0, f1
	stfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_fispos
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8767
	LI	r0, 0
	blr
beq_else.8767:
	lwz	r0, 4(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	o_isinvert.2528
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8768
	lfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_sqrt
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fsub	f0, f1, f0
	lwz	r0, 48(r30)
	lfd	f1, 32(r0)
	fmul	f0, f0, f1
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
	b	beq_cont.8769
beq_else.8768:
	lfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_sqrt
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fadd	f0, f1, f0
	lwz	r0, 48(r30)
	lfd	f1, 32(r0)
	fmul	f0, f0, f1
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
beq_cont.8769:
	LI	r0, 1
	blr
beq_else.8765:
	LI	r0, 0
	blr
solver_fast2.2697:
	LW	r2, 16(r27)
	LW	r3, 12(r27)
	LW	r4, 8(r27)
	LW	r5, 4(r27)
	SLL	r6, r0, 2
	LW	r5, r5, r6
	stw	r3, 0(r30)
	stw	r2, 4(r30)
	stw	r4, 8(r30)
	stw	r5, 12(r30)
	stw	r0, 16(r30)
	stw	r1, 20(r30)
	mflr	r29
	mr	r0, r5
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	o_param_ctbl.2562
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lfd	f0, 0(r0)
	lfd	f1, 8(r0)
	lfd	f2, 16(r0)
	lwz	r1, 20(r30)
	stw	r0, 24(r30)
	stfd	f2, 32(r30)
	stfd	f1, 40(r30)
	stfd	f0, 48(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	d_const.2585
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lwz	r1, 16(r30)
	SLL	r1, r1, 2
	LW	r0, r0, r1
	lwz	r1, 12(r30)
	stw	r0, 56(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	o_form.2524
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	cmpwi	cr7, r0, 1
	bne	cr7, beq_else.8771
	lwz	r0, 20(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	d_vec.2583
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mr	r1, r0
	mtlr	r29
	lfd	f0, 48(r30)
	lfd	f1, 40(r30)
	lfd	f2, 32(r30)
	lwz	r0, 12(r30)
	lwz	r2, 56(r30)
	lwz	r27, 8(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8771:
	cmpwi	cr7, r0, 2
	bne	cr7, beq_else.8772
	lfd	f0, 48(r30)
	lfd	f1, 40(r30)
	lfd	f2, 32(r30)
	lwz	r0, 12(r30)
	lwz	r1, 56(r30)
	lwz	r2, 24(r30)
	lwz	r27, 4(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8772:
	lfd	f0, 48(r30)
	lfd	f1, 40(r30)
	lfd	f2, 32(r30)
	lwz	r0, 12(r30)
	lwz	r1, 56(r30)
	lwz	r2, 24(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
setup_rect_table.2700:
	LI	r2, 6
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r1, 0(r30)
	stw	r0, 4(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_create_float_array
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r1, 4(r30)
	lfd	f0, 0(r1)
	stw	r0, 8(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_fiszero
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8773
	lwz	r0, 0(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	o_isinvert.2528
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r1, 4(r30)
	lfd	f0, 0(r1)
	stw	r0, 12(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_fisneg
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 12(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	xor.2465
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	stw	r0, 16(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_param_a.2532
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	fneg_cond.2470
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	stfd	f0, 0(r0)
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	lwz	r1, 4(r30)
	lfd	f1, 0(r1)
	fdiv	f0, f0, f1
	stfd	f0, 8(r0)
	b	beq_cont.8774
beq_else.8773:
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	lwz	r0, 8(r30)
	stfd	f0, 8(r0)
beq_cont.8774:
	lwz	r1, 4(r30)
	lfd	f0, 8(r1)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_fiszero
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8775
	lwz	r0, 0(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_isinvert.2528
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 4(r30)
	lfd	f0, 8(r1)
	stw	r0, 20(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_fisneg
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 20(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	xor.2465
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	stw	r0, 24(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	o_param_b.2534
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 24(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	fneg_cond.2470
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	stfd	f0, 16(r0)
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	lwz	r1, 4(r30)
	lfd	f1, 8(r1)
	fdiv	f0, f0, f1
	stfd	f0, 24(r0)
	b	beq_cont.8776
beq_else.8775:
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	lwz	r0, 8(r30)
	stfd	f0, 24(r0)
beq_cont.8776:
	lwz	r1, 4(r30)
	lfd	f0, 16(r1)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_fiszero
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8777
	lwz	r0, 0(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	o_isinvert.2528
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 4(r30)
	lfd	f0, 16(r1)
	stw	r0, 28(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fisneg
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 28(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	xor.2465
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	stw	r0, 32(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	o_param_c.2536
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 32(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	fneg_cond.2470
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	stfd	f0, 32(r0)
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	lwz	r1, 4(r30)
	lfd	f1, 16(r1)
	fdiv	f0, f0, f1
	stfd	f0, 40(r0)
	b	beq_cont.8778
beq_else.8777:
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	lwz	r0, 8(r30)
	stfd	f0, 40(r0)
beq_cont.8778:
	blr
setup_surface_table.2703:
	LI	r2, 4
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r1, 0(r30)
	stw	r0, 4(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_create_float_array
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r1, 4(r30)
	lfd	f0, 0(r1)
	lwz	r2, 0(r30)
	stw	r0, 8(r30)
	stfd	f0, 16(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	o_param_a.2532
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lfd	f1, 16(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	lfd	f1, 8(r0)
	lwz	r1, 0(r30)
	stfd	f0, 24(r30)
	stfd	f1, 32(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	o_param_b.2534
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lfd	f1, 32(r30)
	fmul	f0, f1, f0
	lfd	f1, 24(r30)
	fadd	f0, f1, f0
	lwz	r0, 4(r30)
	lfd	f1, 16(r0)
	lwz	r0, 0(r30)
	stfd	f0, 40(r30)
	stfd	f1, 48(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	o_param_c.2536
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lfd	f1, 48(r30)
	fmul	f0, f1, f0
	lfd	f1, 40(r30)
	fadd	f0, f1, f0
	stfd	f0, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fispos
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8780
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	lwz	r0, 8(r30)
	stfd	f0, 0(r0)
	b	beq_cont.8781
beq_else.8780:
	lis	r29, ha16(l.6003)
	ADDI	r29, r29, lo16(l.6003)
	lfd	f0, 0(r29)
	lfd	f1, 56(r30)
	fdiv	f0, f0, f1
	lwz	r0, 8(r30)
	stfd	f0, 0(r0)
	lwz	r1, 0(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_param_a.2532
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fdiv	f0, f0, f1
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fneg
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	stfd	f0, 8(r0)
	lwz	r1, 0(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_param_b.2534
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fdiv	f0, f0, f1
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fneg
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	stfd	f0, 16(r0)
	lwz	r1, 0(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_param_c.2536
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fdiv	f0, f0, f1
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fneg
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	stfd	f0, 24(r0)
beq_cont.8781:
	blr
setup_second_table.2706:
	LI	r2, 5
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r1, 0(r30)
	stw	r0, 4(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_create_float_array
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r1, 4(r30)
	lfd	f0, 0(r1)
	lfd	f1, 8(r1)
	lfd	f2, 16(r1)
	lwz	r2, 0(r30)
	stw	r0, 8(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	quadratic.2637
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lfd	f1, 0(r0)
	lwz	r1, 0(r30)
	stfd	f0, 16(r30)
	stfd	f1, 24(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	o_param_a.2532
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fmul	f0, f1, f0
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fneg
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lfd	f1, 8(r0)
	lwz	r1, 0(r30)
	stfd	f0, 32(r30)
	stfd	f1, 40(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	o_param_b.2534
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lfd	f1, 40(r30)
	fmul	f0, f1, f0
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_fneg
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lfd	f1, 16(r0)
	lwz	r1, 0(r30)
	stfd	f0, 48(r30)
	stfd	f1, 56(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_param_c.2536
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fmul	f0, f1, f0
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fneg
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	lfd	f1, 16(r30)
	stfd	f1, 0(r0)
	lwz	r1, 0(r30)
	stfd	f0, 64(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	o_isrot.2530
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8783
	lwz	r0, 8(r30)
	lfd	f0, 32(r30)
	stfd	f0, 8(r0)
	lfd	f0, 48(r30)
	stfd	f0, 16(r0)
	lfd	f0, 64(r30)
	stfd	f0, 24(r0)
	b	beq_cont.8784
beq_else.8783:
	lwz	r0, 4(r30)
	lfd	f0, 16(r0)
	lwz	r1, 0(r30)
	stfd	f0, 72(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	o_param_r2.2558
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 72(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	lfd	f1, 8(r0)
	lwz	r1, 0(r30)
	stfd	f0, 80(r30)
	stfd	f1, 88(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	o_param_r3.2560
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lfd	f1, 88(r30)
	fmul	f0, f1, f0
	lfd	f1, 80(r30)
	fadd	f0, f1, f0
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	min_caml_fhalf
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lfd	f1, 32(r30)
	fsub	f0, f1, f0
	lwz	r0, 8(r30)
	stfd	f0, 8(r0)
	lwz	r1, 4(r30)
	lfd	f0, 16(r1)
	lwz	r2, 0(r30)
	stfd	f0, 96(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	o_param_r1.2556
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lfd	f1, 96(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	lfd	f1, 0(r0)
	lwz	r1, 0(r30)
	stfd	f0, 104(r30)
	stfd	f1, 112(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	o_param_r3.2560
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	lfd	f1, 112(r30)
	fmul	f0, f1, f0
	lfd	f1, 104(r30)
	fadd	f0, f1, f0
	mflr	r29
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	min_caml_fhalf
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	lfd	f1, 48(r30)
	fsub	f0, f1, f0
	lwz	r0, 8(r30)
	stfd	f0, 16(r0)
	lwz	r1, 4(r30)
	lfd	f0, 8(r1)
	lwz	r2, 0(r30)
	stfd	f0, 120(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 132(r30)
	addi	r30, r30, 136
	bl	o_param_r1.2556
	subi	r30, r30, 136
	lwz	r29, 132(r30)
	mtlr	r29
	lfd	f1, 120(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	lfd	f1, 0(r0)
	lwz	r0, 0(r30)
	stfd	f0, 128(r30)
	stfd	f1, 136(r30)
	mflr	r29
	stw	r29, 148(r30)
	addi	r30, r30, 152
	bl	o_param_r2.2558
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
	lfd	f1, 136(r30)
	fmul	f0, f1, f0
	lfd	f1, 128(r30)
	fadd	f0, f1, f0
	mflr	r29
	stw	r29, 148(r30)
	addi	r30, r30, 152
	bl	min_caml_fhalf
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
	lfd	f1, 64(r30)
	fsub	f0, f1, f0
	lwz	r0, 8(r30)
	stfd	f0, 24(r0)
beq_cont.8784:
	lfd	f0, 16(r30)
	mflr	r29
	stw	r29, 148(r30)
	addi	r30, r30, 152
	bl	min_caml_fiszero
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8785
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	lfd	f1, 16(r30)
	fdiv	f0, f0, f1
	lwz	r0, 8(r30)
	stfd	f0, 32(r0)
	b	beq_cont.8786
beq_else.8785:
beq_cont.8786:
	lwz	r0, 8(r30)
	blr
iter_setup_dirvec_constants.2709:
	LW	r2, 4(r27)
	cmpwi	cr7, r1, 0
	blt	cr7, bge_else.8787
	SLL	r3, r1, 2
	LW	r2, r2, r3
	stw	r27, 0(r30)
	stw	r1, 4(r30)
	stw	r2, 8(r30)
	stw	r0, 12(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	d_const.2585
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 12(r30)
	stw	r0, 16(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	d_vec.2583
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 8(r30)
	stw	r0, 20(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	o_form.2524
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	cmpwi	cr7, r0, 1
	bne	cr7, beq_else.8788
	lwz	r0, 20(r30)
	lwz	r1, 8(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	setup_rect_table.2700
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 4(r30)
	SLL	r2, r1, 2
	lwz	r3, 16(r30)
	SW	r0, r3, r2
	b	beq_cont.8789
beq_else.8788:
	cmpwi	cr7, r0, 2
	bne	cr7, beq_else.8790
	lwz	r0, 20(r30)
	lwz	r1, 8(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	setup_surface_table.2703
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 4(r30)
	SLL	r2, r1, 2
	lwz	r3, 16(r30)
	SW	r0, r3, r2
	b	beq_cont.8791
beq_else.8790:
	lwz	r0, 20(r30)
	lwz	r1, 8(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	setup_second_table.2706
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 4(r30)
	SLL	r2, r1, 2
	lwz	r3, 16(r30)
	SW	r0, r3, r2
beq_cont.8791:
beq_cont.8789:
	SUBI	r1, r1, 1
	lwz	r0, 12(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.8787:
	blr
setup_dirvec_constants.2712:
	LW	r1, 8(r27)
	LW	r27, 4(r27)
	LW	r1, 0(r1)
	SUBI	r1, r1, 1
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
setup_startp_constants.2714:
	LW	r2, 4(r27)
	cmpwi	cr7, r1, 0
	blt	cr7, bge_else.8793
	SLL	r3, r1, 2
	LW	r2, r2, r3
	stw	r27, 0(r30)
	stw	r1, 4(r30)
	stw	r0, 8(r30)
	stw	r2, 12(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_param_ctbl.2562
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 12(r30)
	stw	r0, 16(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_form.2524
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 8(r30)
	lfd	f0, 0(r1)
	lwz	r2, 12(r30)
	stw	r0, 20(r30)
	stfd	f0, 24(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	o_param_x.2540
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fsub	f0, f1, f0
	lwz	r0, 16(r30)
	stfd	f0, 0(r0)
	lwz	r1, 8(r30)
	lfd	f0, 8(r1)
	lwz	r2, 12(r30)
	stfd	f0, 32(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	o_param_y.2542
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lfd	f1, 32(r30)
	fsub	f0, f1, f0
	lwz	r0, 16(r30)
	stfd	f0, 8(r0)
	lwz	r1, 8(r30)
	lfd	f0, 16(r1)
	lwz	r2, 12(r30)
	stfd	f0, 40(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	o_param_z.2544
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lfd	f1, 40(r30)
	fsub	f0, f1, f0
	lwz	r0, 16(r30)
	stfd	f0, 16(r0)
	lwz	r1, 20(r30)
	cmpwi	cr7, r1, 2
	bne	cr7, beq_else.8794
	lwz	r1, 12(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	o_param_abc.2538
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lwz	r1, 16(r30)
	lfd	f0, 0(r1)
	lfd	f1, 8(r1)
	lfd	f2, 16(r1)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	veciprod2.2500
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	stfd	f0, 24(r0)
	b	beq_cont.8795
beq_else.8794:
	cmpwi	cr7, r1, 2
	bgt	cr7, ble_else.8796
	b	ble_cont.8797
ble_else.8796:
	lfd	f0, 0(r0)
	lfd	f1, 8(r0)
	lfd	f2, 16(r0)
	lwz	r2, 12(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	quadratic.2637
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lwz	r0, 20(r30)
	cmpwi	cr7, r0, 3
	bne	cr7, beq_else.8798
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f1, 0(r29)
	fsub	f0, f0, f1
	b	beq_cont.8799
beq_else.8798:
beq_cont.8799:
	lwz	r0, 16(r30)
	stfd	f0, 24(r0)
ble_cont.8797:
beq_cont.8795:
	lwz	r0, 4(r30)
	SUBI	r1, r0, 1
	lwz	r0, 8(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.8793:
	blr
setup_startp.2717:
	LW	r1, 12(r27)
	LW	r2, 8(r27)
	LW	r3, 4(r27)
	stw	r0, 0(r30)
	stw	r2, 4(r30)
	stw	r3, 8(r30)
	mflr	r29
	mr	r26, r1
	mr	r1, r0
	mr	r0, r26
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	veccpy.2486
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	LW	r0, 0(r0)
	SUBI	r1, r0, 1
	lwz	r0, 0(r30)
	lwz	r27, 4(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
is_rect_outside.2719:
	stfd	f2, 0(r30)
	stfd	f1, 8(r30)
	stw	r0, 16(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_fabs
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	stfd	f0, 24(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	o_param_a.2532
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 24(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fless
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8802
	LI	r0, 0
	b	beq_cont.8803
beq_else.8802:
	lfd	f0, 8(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fabs
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	stfd	f0, 32(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	o_param_b.2534
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 32(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_fless
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8804
	LI	r0, 0
	b	beq_cont.8805
beq_else.8804:
	lfd	f0, 0(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_fabs
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	stfd	f0, 40(r30)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	o_param_c.2536
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 40(r30)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_fless
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
beq_cont.8805:
beq_cont.8803:
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8806
	lwz	r0, 16(r30)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	o_isinvert.2528
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8807
	LI	r0, 1
	blr
beq_else.8807:
	LI	r0, 0
	blr
beq_else.8806:
	lwz	r0, 16(r30)
	b	o_isinvert.2528
is_plane_outside.2724:
	stw	r0, 0(r30)
	stfd	f2, 8(r30)
	stfd	f1, 16(r30)
	stfd	f0, 24(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	o_param_abc.2538
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f0, 24(r30)
	lfd	f1, 16(r30)
	lfd	f2, 8(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	veciprod2.2500
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	stfd	f0, 32(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	o_isinvert.2528
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lfd	f0, 32(r30)
	stw	r0, 40(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_fisneg
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 40(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	xor.2465
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8809
	LI	r0, 1
	blr
beq_else.8809:
	LI	r0, 0
	blr
is_second_outside.2729:
	stw	r0, 0(r30)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	quadratic.2637
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	stfd	f0, 8(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_form.2524
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	cmpwi	cr7, r0, 3
	bne	cr7, beq_else.8811
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	lfd	f1, 8(r30)
	fsub	f0, f1, f0
	b	beq_cont.8812
beq_else.8811:
	lfd	f0, 8(r30)
beq_cont.8812:
	lwz	r0, 0(r30)
	stfd	f0, 16(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	o_isinvert.2528
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lfd	f0, 16(r30)
	stw	r0, 24(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_fisneg
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 24(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	xor.2465
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8813
	LI	r0, 1
	blr
beq_else.8813:
	LI	r0, 0
	blr
is_outside.2734:
	stfd	f2, 0(r30)
	stfd	f1, 8(r30)
	stw	r0, 16(r30)
	stfd	f0, 24(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	o_param_x.2540
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fsub	f0, f1, f0
	lwz	r0, 16(r30)
	stfd	f0, 32(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	o_param_y.2542
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lfd	f1, 8(r30)
	fsub	f0, f1, f0
	lwz	r0, 16(r30)
	stfd	f0, 40(r30)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	o_param_z.2544
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lfd	f1, 0(r30)
	fsub	f0, f1, f0
	lwz	r0, 16(r30)
	stfd	f0, 48(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	o_form.2524
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	cmpwi	cr7, r0, 1
	bne	cr7, beq_else.8815
	lfd	f0, 32(r30)
	lfd	f1, 40(r30)
	lfd	f2, 48(r30)
	lwz	r0, 16(r30)
	b	is_rect_outside.2719
beq_else.8815:
	cmpwi	cr7, r0, 2
	bne	cr7, beq_else.8816
	lfd	f0, 32(r30)
	lfd	f1, 40(r30)
	lfd	f2, 48(r30)
	lwz	r0, 16(r30)
	b	is_plane_outside.2724
beq_else.8816:
	lfd	f0, 32(r30)
	lfd	f1, 40(r30)
	lfd	f2, 48(r30)
	lwz	r0, 16(r30)
	b	is_second_outside.2729
check_all_inside.2739:
	LW	r2, 4(r27)
	SLL	r3, r0, 2
	LW	r3, r1, r3
	cmpwi	cr7, r3, -1
	bne	cr7, beq_else.8817
	LI	r0, 1
	blr
beq_else.8817:
	SLL	r3, r3, 2
	LW	r2, r2, r3
	stfd	f2, 0(r30)
	stfd	f1, 8(r30)
	stfd	f0, 16(r30)
	stw	r1, 24(r30)
	stw	r27, 28(r30)
	stw	r0, 32(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	is_outside.2734
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8818
	lwz	r0, 32(r30)
	ADDI	r0, r0, 1
	lfd	f0, 16(r30)
	lfd	f1, 8(r30)
	lfd	f2, 0(r30)
	lwz	r1, 24(r30)
	lwz	r27, 28(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8818:
	LI	r0, 0
	blr
shadow_check_and_group.2745:
	LW	r2, 28(r27)
	LW	r3, 24(r27)
	LW	r4, 20(r27)
	LW	r5, 16(r27)
	LW	r6, 12(r27)
	LW	r7, 8(r27)
	LW	r8, 4(r27)
	SLL	r9, r0, 2
	LW	r9, r1, r9
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else.8819
	LI	r0, 0
	blr
beq_else.8819:
	SLL	r9, r0, 2
	LW	r9, r1, r9
	stw	r8, 0(r30)
	stw	r7, 4(r30)
	stw	r6, 8(r30)
	stw	r1, 12(r30)
	stw	r27, 16(r30)
	stw	r0, 20(r30)
	stw	r4, 24(r30)
	stw	r9, 28(r30)
	stw	r3, 32(r30)
	mflr	r29
	mr	r1, r5
	mr	r0, r9
	mr	r27, r2
	mr	r2, r7
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r1, 32(r30)
	lfd	f0, 0(r1)
	stfd	f0, 40(r30)
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8821
	LI	r0, 0
	b	beq_cont.8822
beq_else.8821:
	lis	r29, ha16(l.6317)
	ADDI	r29, r29, lo16(l.6317)
	lfd	f1, 0(r29)
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_fless
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
beq_cont.8822:
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8823
	lwz	r0, 28(r30)
	SLL	r0, r0, 2
	lwz	r1, 24(r30)
	LW	r0, r1, r0
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	o_isinvert.2528
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8824
	LI	r0, 0
	blr
beq_else.8824:
	lwz	r0, 20(r30)
	ADDI	r0, r0, 1
	lwz	r1, 12(r30)
	lwz	r27, 16(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8823:
	lis	r29, ha16(l.6318)
	ADDI	r29, r29, lo16(l.6318)
	lfd	f0, 0(r29)
	lfd	f1, 40(r30)
	fadd	f0, f1, f0
	lwz	r0, 8(r30)
	lfd	f1, 0(r0)
	fmul	f1, f1, f0
	lwz	r1, 4(r30)
	lfd	f2, 0(r1)
	fadd	f1, f1, f2
	lfd	f2, 8(r0)
	fmul	f2, f2, f0
	lfd	f3, 8(r1)
	fadd	f2, f2, f3
	lfd	f3, 16(r0)
	fmul	f0, f3, f0
	lfd	f3, 16(r1)
	fadd	f0, f0, f3
	LI	r0, 0
	lwz	r1, 12(r30)
	lwz	r27, 0(r30)
	mflr	r29
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	stw	r29, 52(r30)
	addi	r30, r30, 56
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8825
	lwz	r0, 20(r30)
	ADDI	r0, r0, 1
	lwz	r1, 12(r30)
	lwz	r27, 16(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8825:
	LI	r0, 1
	blr
shadow_check_one_or_group.2748:
	LW	r2, 8(r27)
	LW	r3, 4(r27)
	SLL	r4, r0, 2
	LW	r4, r1, r4
	cmpwi	cr7, r4, -1
	bne	cr7, beq_else.8826
	LI	r0, 0
	blr
beq_else.8826:
	SLL	r4, r4, 2
	LW	r3, r3, r4
	LI	r4, 0
	stw	r1, 0(r30)
	stw	r27, 4(r30)
	stw	r0, 8(r30)
	mflr	r29
	mr	r1, r3
	mr	r0, r4
	mr	r27, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8827
	lwz	r0, 8(r30)
	ADDI	r0, r0, 1
	lwz	r1, 0(r30)
	lwz	r27, 4(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8827:
	LI	r0, 1
	blr
shadow_check_one_or_matrix.2751:
	LW	r2, 20(r27)
	LW	r3, 16(r27)
	LW	r4, 12(r27)
	LW	r5, 8(r27)
	LW	r6, 4(r27)
	SLL	r7, r0, 2
	LW	r7, r1, r7
	LW	r8, 0(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else.8828
	LI	r0, 0
	blr
beq_else.8828:
	stw	r7, 0(r30)
	stw	r4, 4(r30)
	stw	r1, 8(r30)
	stw	r27, 12(r30)
	stw	r0, 16(r30)
	cmpwi	cr7, r8, 99
	bne	cr7, beq_else.8829
	LI	r0, 1
	b	beq_cont.8830
beq_else.8829:
	stw	r3, 20(r30)
	mflr	r29
	mr	r1, r5
	mr	r0, r8
	mr	r27, r2
	mr	r2, r6
	stw	r29, 28(r30)
	addi	r30, r30, 32
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8831
	LI	r0, 0
	b	beq_cont.8832
beq_else.8831:
	lwz	r0, 20(r30)
	lfd	f0, 0(r0)
	lis	r29, ha16(l.6331)
	ADDI	r29, r29, lo16(l.6331)
	lfd	f1, 0(r29)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_fless
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8833
	LI	r0, 0
	b	beq_cont.8834
beq_else.8833:
	LI	r0, 1
	lwz	r1, 0(r30)
	lwz	r27, 4(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8835
	LI	r0, 0
	b	beq_cont.8836
beq_else.8835:
	LI	r0, 1
beq_cont.8836:
beq_cont.8834:
beq_cont.8832:
beq_cont.8830:
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8837
	lwz	r0, 16(r30)
	ADDI	r0, r0, 1
	lwz	r1, 8(r30)
	lwz	r27, 12(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8837:
	LI	r0, 1
	lwz	r1, 0(r30)
	lwz	r27, 4(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8838
	lwz	r0, 16(r30)
	ADDI	r0, r0, 1
	lwz	r1, 8(r30)
	lwz	r27, 12(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8838:
	LI	r0, 1
	blr
solve_each_element.2754:
	LW	r3, 36(r27)
	LW	r4, 32(r27)
	LW	r5, 28(r27)
	LW	r6, 24(r27)
	LW	r7, 20(r27)
	LW	r8, 16(r27)
	LW	r9, 12(r27)
	LW	r10, 8(r27)
	LW	r11, 4(r27)
	SLL	r12, r0, 2
	LW	r12, r1, r12
	cmpwi	cr7, r12, -1
	bne	cr7, beq_else.8839
	blr
beq_else.8839:
	stw	r8, 0(r30)
	stw	r10, 4(r30)
	stw	r9, 8(r30)
	stw	r11, 12(r30)
	stw	r4, 16(r30)
	stw	r3, 20(r30)
	stw	r5, 24(r30)
	stw	r2, 28(r30)
	stw	r1, 32(r30)
	stw	r27, 36(r30)
	stw	r0, 40(r30)
	stw	r7, 44(r30)
	stw	r12, 48(r30)
	mflr	r29
	mr	r1, r2
	mr	r0, r12
	mr	r27, r6
	mr	r2, r4
	stw	r29, 52(r30)
	addi	r30, r30, 56
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8841
	lwz	r0, 48(r30)
	SLL	r0, r0, 2
	lwz	r1, 44(r30)
	LW	r0, r1, r0
	mflr	r29
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	o_isinvert.2528
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8842
	blr
beq_else.8842:
	lwz	r0, 40(r30)
	ADDI	r0, r0, 1
	lwz	r1, 32(r30)
	lwz	r2, 28(r30)
	lwz	r27, 36(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8841:
	lwz	r1, 24(r30)
	lfd	f1, 0(r1)
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 52(r30)
	stfd	f1, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fless
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8844
	b	beq_cont.8845
beq_else.8844:
	lwz	r0, 20(r30)
	lfd	f1, 0(r0)
	lfd	f0, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_fless
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8846
	b	beq_cont.8847
beq_else.8846:
	lis	r29, ha16(l.6318)
	ADDI	r29, r29, lo16(l.6318)
	lfd	f0, 0(r29)
	lfd	f1, 56(r30)
	fadd	f0, f1, f0
	lwz	r0, 28(r30)
	lfd	f1, 0(r0)
	fmul	f1, f1, f0
	lwz	r1, 16(r30)
	lfd	f2, 0(r1)
	fadd	f1, f1, f2
	lfd	f2, 8(r0)
	fmul	f2, f2, f0
	lfd	f3, 8(r1)
	fadd	f2, f2, f3
	lfd	f3, 16(r0)
	fmul	f3, f3, f0
	lfd	f4, 16(r1)
	fadd	f3, f3, f4
	LI	r1, 0
	lwz	r2, 32(r30)
	lwz	r27, 12(r30)
	stfd	f3, 64(r30)
	stfd	f2, 72(r30)
	stfd	f1, 80(r30)
	stfd	f0, 88(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r29, 100(r30)
	addi	r30, r30, 104
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8848
	b	beq_cont.8849
beq_else.8848:
	lwz	r0, 20(r30)
	lfd	f0, 88(r30)
	stfd	f0, 0(r0)
	lfd	f0, 80(r30)
	lfd	f1, 72(r30)
	lfd	f2, 64(r30)
	lwz	r0, 8(r30)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	vecset.2476
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lwz	r1, 48(r30)
	SW	r1, 0(r0)
	lwz	r0, 0(r30)
	lwz	r1, 52(r30)
	SW	r1, 0(r0)
beq_cont.8849:
beq_cont.8847:
beq_cont.8845:
	lwz	r0, 40(r30)
	ADDI	r0, r0, 1
	lwz	r1, 32(r30)
	lwz	r2, 28(r30)
	lwz	r27, 36(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
solve_one_or_network.2758:
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	SLL	r5, r0, 2
	LW	r5, r1, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else.8850
	blr
beq_else.8850:
	SLL	r5, r5, 2
	LW	r4, r4, r5
	LI	r5, 0
	stw	r2, 0(r30)
	stw	r1, 4(r30)
	stw	r27, 8(r30)
	stw	r0, 12(r30)
	mflr	r29
	mr	r1, r4
	mr	r0, r5
	mr	r27, r3
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 12(r30)
	ADDI	r0, r0, 1
	lwz	r1, 4(r30)
	lwz	r2, 0(r30)
	lwz	r27, 8(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
trace_or_matrix.2762:
	LW	r3, 20(r27)
	LW	r4, 16(r27)
	LW	r5, 12(r27)
	LW	r6, 8(r27)
	LW	r7, 4(r27)
	SLL	r8, r0, 2
	LW	r8, r1, r8
	LW	r9, 0(r8)
	cmpwi	cr7, r9, -1
	bne	cr7, beq_else.8852
	blr
beq_else.8852:
	stw	r2, 0(r30)
	stw	r1, 4(r30)
	stw	r27, 8(r30)
	stw	r0, 12(r30)
	cmpwi	cr7, r9, 99
	bne	cr7, beq_else.8854
	LI	r3, 1
	mflr	r29
	mr	r1, r8
	mr	r0, r3
	mr	r27, r7
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	b	beq_cont.8855
beq_else.8854:
	stw	r8, 16(r30)
	stw	r7, 20(r30)
	stw	r3, 24(r30)
	stw	r5, 28(r30)
	mflr	r29
	mr	r1, r2
	mr	r0, r9
	mr	r27, r6
	mr	r2, r4
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8856
	b	beq_cont.8857
beq_else.8856:
	lwz	r0, 28(r30)
	lfd	f0, 0(r0)
	lwz	r0, 24(r30)
	lfd	f1, 0(r0)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fless
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8858
	b	beq_cont.8859
beq_else.8858:
	LI	r0, 1
	lwz	r1, 16(r30)
	lwz	r2, 0(r30)
	lwz	r27, 20(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
beq_cont.8859:
beq_cont.8857:
beq_cont.8855:
	lwz	r0, 12(r30)
	ADDI	r0, r0, 1
	lwz	r1, 4(r30)
	lwz	r2, 0(r30)
	lwz	r27, 8(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
judge_intersection.2766:
	LW	r1, 12(r27)
	LW	r2, 8(r27)
	LW	r3, 4(r27)
	lis	r29, ha16(l.6351)
	ADDI	r29, r29, lo16(l.6351)
	lfd	f0, 0(r29)
	stfd	f0, 0(r2)
	LI	r4, 0
	LW	r3, 0(r3)
	stw	r2, 0(r30)
	mflr	r29
	mr	r2, r0
	mr	r27, r1
	mr	r1, r3
	mr	r0, r4
	stw	r29, 4(r30)
	addi	r30, r30, 8
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	lfd	f1, 0(r0)
	lis	r29, ha16(l.6331)
	ADDI	r29, r29, lo16(l.6331)
	lfd	f0, 0(r29)
	stfd	f1, 8(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_fless
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8861
	LI	r0, 0
	blr
beq_else.8861:
	lis	r29, ha16(l.6355)
	ADDI	r29, r29, lo16(l.6355)
	lfd	f1, 0(r29)
	lfd	f0, 8(r30)
	b	min_caml_fless
solve_each_element_fast.2768:
	LW	r3, 36(r27)
	LW	r4, 32(r27)
	LW	r5, 28(r27)
	LW	r6, 24(r27)
	LW	r7, 20(r27)
	LW	r8, 16(r27)
	LW	r9, 12(r27)
	LW	r10, 8(r27)
	LW	r11, 4(r27)
	stw	r8, 0(r30)
	stw	r10, 4(r30)
	stw	r9, 8(r30)
	stw	r11, 12(r30)
	stw	r4, 16(r30)
	stw	r3, 20(r30)
	stw	r6, 24(r30)
	stw	r27, 28(r30)
	stw	r7, 32(r30)
	stw	r2, 36(r30)
	stw	r5, 40(r30)
	stw	r1, 44(r30)
	stw	r0, 48(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	d_vec.2583
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lwz	r1, 48(r30)
	SLL	r2, r1, 2
	lwz	r3, 44(r30)
	LW	r2, r3, r2
	cmpwi	cr7, r2, -1
	bne	cr7, beq_else.8862
	blr
beq_else.8862:
	lwz	r4, 36(r30)
	lwz	r27, 40(r30)
	stw	r0, 52(r30)
	stw	r2, 56(r30)
	mflr	r29
	mr	r1, r4
	mr	r0, r2
	stw	r29, 60(r30)
	addi	r30, r30, 64
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8864
	lwz	r0, 56(r30)
	SLL	r0, r0, 2
	lwz	r1, 32(r30)
	LW	r0, r1, r0
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	o_isinvert.2528
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8865
	blr
beq_else.8865:
	lwz	r0, 48(r30)
	ADDI	r0, r0, 1
	lwz	r1, 44(r30)
	lwz	r2, 36(r30)
	lwz	r27, 28(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8864:
	lwz	r1, 24(r30)
	lfd	f1, 0(r1)
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 60(r30)
	stfd	f1, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fless
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8867
	b	beq_cont.8868
beq_else.8867:
	lwz	r0, 20(r30)
	lfd	f1, 0(r0)
	lfd	f0, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fless
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8869
	b	beq_cont.8870
beq_else.8869:
	lis	r29, ha16(l.6318)
	ADDI	r29, r29, lo16(l.6318)
	lfd	f0, 0(r29)
	lfd	f1, 64(r30)
	fadd	f0, f1, f0
	lwz	r0, 52(r30)
	lfd	f1, 0(r0)
	fmul	f1, f1, f0
	lwz	r1, 16(r30)
	lfd	f2, 0(r1)
	fadd	f1, f1, f2
	lfd	f2, 8(r0)
	fmul	f2, f2, f0
	lfd	f3, 8(r1)
	fadd	f2, f2, f3
	lfd	f3, 16(r0)
	fmul	f3, f3, f0
	lfd	f4, 16(r1)
	fadd	f3, f3, f4
	LI	r0, 0
	lwz	r1, 44(r30)
	lwz	r27, 12(r30)
	stfd	f3, 72(r30)
	stfd	f2, 80(r30)
	stfd	f1, 88(r30)
	stfd	f0, 96(r30)
	mflr	r29
	fmr	f0, f1
	fmr	f1, f2
	fmr	f2, f3
	stw	r29, 108(r30)
	addi	r30, r30, 112
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8871
	b	beq_cont.8872
beq_else.8871:
	lwz	r0, 20(r30)
	lfd	f0, 96(r30)
	stfd	f0, 0(r0)
	lfd	f0, 88(r30)
	lfd	f1, 80(r30)
	lfd	f2, 72(r30)
	lwz	r0, 8(r30)
	mflr	r29
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	vecset.2476
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	lwz	r1, 56(r30)
	SW	r1, 0(r0)
	lwz	r0, 0(r30)
	lwz	r1, 60(r30)
	SW	r1, 0(r0)
beq_cont.8872:
beq_cont.8870:
beq_cont.8868:
	lwz	r0, 48(r30)
	ADDI	r0, r0, 1
	lwz	r1, 44(r30)
	lwz	r2, 36(r30)
	lwz	r27, 28(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
solve_one_or_network_fast.2772:
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	SLL	r5, r0, 2
	LW	r5, r1, r5
	cmpwi	cr7, r5, -1
	bne	cr7, beq_else.8873
	blr
beq_else.8873:
	SLL	r5, r5, 2
	LW	r4, r4, r5
	LI	r5, 0
	stw	r2, 0(r30)
	stw	r1, 4(r30)
	stw	r27, 8(r30)
	stw	r0, 12(r30)
	mflr	r29
	mr	r1, r4
	mr	r0, r5
	mr	r27, r3
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 12(r30)
	ADDI	r0, r0, 1
	lwz	r1, 4(r30)
	lwz	r2, 0(r30)
	lwz	r27, 8(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
trace_or_matrix_fast.2776:
	LW	r3, 16(r27)
	LW	r4, 12(r27)
	LW	r5, 8(r27)
	LW	r6, 4(r27)
	SLL	r7, r0, 2
	LW	r7, r1, r7
	LW	r8, 0(r7)
	cmpwi	cr7, r8, -1
	bne	cr7, beq_else.8875
	blr
beq_else.8875:
	stw	r2, 0(r30)
	stw	r1, 4(r30)
	stw	r27, 8(r30)
	stw	r0, 12(r30)
	cmpwi	cr7, r8, 99
	bne	cr7, beq_else.8877
	LI	r3, 1
	mflr	r29
	mr	r1, r7
	mr	r0, r3
	mr	r27, r6
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	b	beq_cont.8878
beq_else.8877:
	stw	r7, 16(r30)
	stw	r6, 20(r30)
	stw	r3, 24(r30)
	stw	r5, 28(r30)
	mflr	r29
	mr	r1, r2
	mr	r0, r8
	mr	r27, r4
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8879
	b	beq_cont.8880
beq_else.8879:
	lwz	r0, 28(r30)
	lfd	f0, 0(r0)
	lwz	r0, 24(r30)
	lfd	f1, 0(r0)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fless
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8881
	b	beq_cont.8882
beq_else.8881:
	LI	r0, 1
	lwz	r1, 16(r30)
	lwz	r2, 0(r30)
	lwz	r27, 20(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
beq_cont.8882:
beq_cont.8880:
beq_cont.8878:
	lwz	r0, 12(r30)
	ADDI	r0, r0, 1
	lwz	r1, 4(r30)
	lwz	r2, 0(r30)
	lwz	r27, 8(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
judge_intersection_fast.2780:
	LW	r1, 12(r27)
	LW	r2, 8(r27)
	LW	r3, 4(r27)
	lis	r29, ha16(l.6351)
	ADDI	r29, r29, lo16(l.6351)
	lfd	f0, 0(r29)
	stfd	f0, 0(r2)
	LI	r4, 0
	LW	r3, 0(r3)
	stw	r2, 0(r30)
	mflr	r29
	mr	r2, r0
	mr	r27, r1
	mr	r1, r3
	mr	r0, r4
	stw	r29, 4(r30)
	addi	r30, r30, 8
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	lfd	f1, 0(r0)
	lis	r29, ha16(l.6331)
	ADDI	r29, r29, lo16(l.6331)
	lfd	f0, 0(r29)
	stfd	f1, 8(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_fless
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8884
	LI	r0, 0
	blr
beq_else.8884:
	lis	r29, ha16(l.6355)
	ADDI	r29, r29, lo16(l.6355)
	lfd	f1, 0(r29)
	lfd	f0, 8(r30)
	b	min_caml_fless
get_nvector_rect.2782:
	LW	r1, 8(r27)
	LW	r2, 4(r27)
	LW	r2, 0(r2)
	stw	r1, 0(r30)
	stw	r0, 4(r30)
	stw	r2, 8(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	vecbzero.2484
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	SUBI	r1, r0, 1
	SUBI	r0, r0, 1
	SLL	r0, r0, 3
	lwz	r2, 4(r30)
	lfdx	f0, r2, r0
	stw	r1, 12(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	sgn.2468
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_fneg
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 12(r30)
	SLL	r0, r0, 3
	lwz	r1, 0(r30)
	stfdx	f0, r1, r0
	blr
get_nvector_plane.2784:
	LW	r1, 4(r27)
	stw	r0, 0(r30)
	stw	r1, 4(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	o_param_a.2532
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_fneg
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	stfd	f0, 0(r0)
	lwz	r1, 0(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	o_param_b.2534
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_fneg
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	stfd	f0, 8(r0)
	lwz	r1, 0(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	o_param_c.2536
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_fneg
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	stfd	f0, 16(r0)
	blr
get_nvector_second.2786:
	LW	r1, 8(r27)
	LW	r2, 4(r27)
	lfd	f0, 0(r2)
	stw	r1, 0(r30)
	stw	r0, 4(r30)
	stw	r2, 8(r30)
	stfd	f0, 16(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	o_param_x.2540
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lfd	f1, 16(r30)
	fsub	f0, f1, f0
	lwz	r0, 8(r30)
	lfd	f1, 8(r0)
	lwz	r1, 4(r30)
	stfd	f0, 24(r30)
	stfd	f1, 32(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	o_param_y.2542
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lfd	f1, 32(r30)
	fsub	f0, f1, f0
	lwz	r0, 8(r30)
	lfd	f1, 16(r0)
	lwz	r0, 4(r30)
	stfd	f0, 40(r30)
	stfd	f1, 48(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	o_param_z.2544
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lfd	f1, 48(r30)
	fsub	f0, f1, f0
	lwz	r0, 4(r30)
	stfd	f0, 56(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_param_a.2532
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	stfd	f0, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	o_param_b.2534
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f1, 40(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	stfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	o_param_c.2536
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	stfd	f0, 80(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	o_isrot.2530
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8888
	lwz	r0, 0(r30)
	lfd	f0, 64(r30)
	stfd	f0, 0(r0)
	lfd	f0, 72(r30)
	stfd	f0, 8(r0)
	lfd	f0, 80(r30)
	stfd	f0, 16(r0)
	b	beq_cont.8889
beq_else.8888:
	lwz	r0, 4(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	o_param_r3.2560
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lfd	f1, 40(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	stfd	f0, 88(r30)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	o_param_r2.2558
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fmul	f0, f1, f0
	lfd	f2, 88(r30)
	fadd	f0, f2, f0
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	min_caml_fhalf
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lfd	f1, 64(r30)
	fadd	f0, f1, f0
	lwz	r0, 0(r30)
	stfd	f0, 0(r0)
	lwz	r1, 4(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	o_param_r3.2560
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	stfd	f0, 96(r30)
	mflr	r29
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	o_param_r1.2556
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fmul	f0, f1, f0
	lfd	f1, 96(r30)
	fadd	f0, f1, f0
	mflr	r29
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	min_caml_fhalf
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lfd	f1, 72(r30)
	fadd	f0, f1, f0
	lwz	r0, 0(r30)
	stfd	f0, 8(r0)
	lwz	r1, 4(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	o_param_r2.2558
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	stfd	f0, 104(r30)
	mflr	r29
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	o_param_r1.2556
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	lfd	f1, 40(r30)
	fmul	f0, f1, f0
	lfd	f1, 104(r30)
	fadd	f0, f1, f0
	mflr	r29
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	min_caml_fhalf
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	lfd	f1, 80(r30)
	fadd	f0, f1, f0
	lwz	r0, 0(r30)
	stfd	f0, 16(r0)
beq_cont.8889:
	lwz	r1, 4(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	o_isinvert.2528
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 0(r30)
	b	vecunit_sgn.2494
get_nvector.2788:
	LW	r2, 12(r27)
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	stw	r2, 0(r30)
	stw	r0, 4(r30)
	stw	r4, 8(r30)
	stw	r1, 12(r30)
	stw	r3, 16(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_form.2524
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	cmpwi	cr7, r0, 1
	bne	cr7, beq_else.8890
	lwz	r0, 12(r30)
	lwz	r27, 16(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8890:
	cmpwi	cr7, r0, 2
	bne	cr7, beq_else.8891
	lwz	r0, 4(r30)
	lwz	r27, 8(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8891:
	lwz	r0, 4(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
utexture.2791:
	LW	r2, 4(r27)
	stw	r1, 0(r30)
	stw	r2, 4(r30)
	stw	r0, 8(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	o_texturetype.2522
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r1, 8(r30)
	stw	r0, 12(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_color_red.2550
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	stfd	f0, 0(r0)
	lwz	r1, 8(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_color_green.2552
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	stfd	f0, 8(r0)
	lwz	r1, 8(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_color_blue.2554
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	stfd	f0, 16(r0)
	lwz	r1, 12(r30)
	cmpwi	cr7, r1, 1
	bne	cr7, beq_else.8892
	lwz	r1, 0(r30)
	lfd	f0, 0(r1)
	lwz	r2, 8(r30)
	stfd	f0, 16(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	o_param_x.2540
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lfd	f1, 16(r30)
	fsub	f0, f1, f0
	lis	r29, ha16(l.6418)
	ADDI	r29, r29, lo16(l.6418)
	lfd	f1, 0(r29)
	fmul	f1, f0, f1
	stfd	f0, 24(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_floor
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lis	r29, ha16(l.6419)
	ADDI	r29, r29, lo16(l.6419)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	lfd	f1, 24(r30)
	fsub	f0, f1, f0
	lis	r29, ha16(l.6410)
	ADDI	r29, r29, lo16(l.6410)
	lfd	f1, 0(r29)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fless
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	lfd	f0, 16(r1)
	lwz	r1, 8(r30)
	stw	r0, 32(r30)
	stfd	f0, 40(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	o_param_z.2544
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lfd	f1, 40(r30)
	fsub	f0, f1, f0
	lis	r29, ha16(l.6418)
	ADDI	r29, r29, lo16(l.6418)
	lfd	f1, 0(r29)
	fmul	f1, f0, f1
	stfd	f0, 48(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_floor
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lis	r29, ha16(l.6419)
	ADDI	r29, r29, lo16(l.6419)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	lfd	f1, 48(r30)
	fsub	f0, f1, f0
	lis	r29, ha16(l.6410)
	ADDI	r29, r29, lo16(l.6410)
	lfd	f1, 0(r29)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_fless
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lwz	r1, 32(r30)
	cmpwi	cr7, r1, 0
	bne	cr7, beq_else.8894
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8896
	lis	r29, ha16(l.6405)
	ADDI	r29, r29, lo16(l.6405)
	lfd	f0, 0(r29)
	b	beq_cont.8897
beq_else.8896:
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
beq_cont.8897:
	b	beq_cont.8895
beq_else.8894:
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8898
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	b	beq_cont.8899
beq_else.8898:
	lis	r29, ha16(l.6405)
	ADDI	r29, r29, lo16(l.6405)
	lfd	f0, 0(r29)
beq_cont.8899:
beq_cont.8895:
	lwz	r0, 4(r30)
	stfd	f0, 8(r0)
	blr
beq_else.8892:
	cmpwi	cr7, r1, 2
	bne	cr7, beq_else.8901
	lwz	r1, 0(r30)
	lfd	f0, 8(r1)
	lis	r29, ha16(l.6414)
	ADDI	r29, r29, lo16(l.6414)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_sin
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_fsqr
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lis	r29, ha16(l.6405)
	ADDI	r29, r29, lo16(l.6405)
	lfd	f1, 0(r29)
	fmul	f1, f1, f0
	lwz	r0, 4(r30)
	stfd	f1, 0(r0)
	lis	r29, ha16(l.6405)
	ADDI	r29, r29, lo16(l.6405)
	lfd	f1, 0(r29)
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f2, 0(r29)
	fsub	f0, f2, f0
	fmul	f0, f1, f0
	stfd	f0, 8(r0)
	blr
beq_else.8901:
	cmpwi	cr7, r1, 3
	bne	cr7, beq_else.8903
	lwz	r1, 0(r30)
	lfd	f0, 0(r1)
	lwz	r2, 8(r30)
	stfd	f0, 56(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	o_param_x.2540
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	fsub	f0, f1, f0
	lwz	r0, 0(r30)
	lfd	f1, 16(r0)
	lwz	r0, 8(r30)
	stfd	f0, 64(r30)
	stfd	f1, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	o_param_z.2544
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 72(r30)
	fsub	f0, f1, f0
	lfd	f1, 64(r30)
	stfd	f0, 80(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_fsqr
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lfd	f1, 80(r30)
	stfd	f0, 88(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	min_caml_fsqr
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lfd	f1, 88(r30)
	fadd	f0, f1, f0
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	min_caml_sqrt
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lis	r29, ha16(l.6410)
	ADDI	r29, r29, lo16(l.6410)
	lfd	f1, 0(r29)
	fdiv	f0, f0, f1
	stfd	f0, 96(r30)
	mflr	r29
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	min_caml_floor
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lfd	f1, 96(r30)
	fsub	f0, f1, f0
	lis	r29, ha16(l.6401)
	ADDI	r29, r29, lo16(l.6401)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	mflr	r29
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	min_caml_cos
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	min_caml_fsqr
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lis	r29, ha16(l.6405)
	ADDI	r29, r29, lo16(l.6405)
	lfd	f1, 0(r29)
	fmul	f1, f0, f1
	lwz	r0, 4(r30)
	stfd	f1, 8(r0)
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f1, 0(r29)
	fsub	f0, f1, f0
	lis	r29, ha16(l.6405)
	ADDI	r29, r29, lo16(l.6405)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	stfd	f0, 16(r0)
	blr
beq_else.8903:
	cmpwi	cr7, r1, 4
	bne	cr7, beq_else.8905
	lwz	r1, 0(r30)
	lfd	f0, 0(r1)
	lwz	r2, 8(r30)
	stfd	f0, 104(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	o_param_x.2540
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	lfd	f1, 104(r30)
	fsub	f0, f1, f0
	lwz	r0, 8(r30)
	stfd	f0, 112(r30)
	mflr	r29
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	o_param_a.2532
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	min_caml_sqrt
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	lfd	f1, 112(r30)
	fmul	f0, f1, f0
	lwz	r0, 0(r30)
	lfd	f1, 16(r0)
	lwz	r1, 8(r30)
	stfd	f0, 120(r30)
	stfd	f1, 128(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 140(r30)
	addi	r30, r30, 144
	bl	o_param_z.2544
	subi	r30, r30, 144
	lwz	r29, 140(r30)
	mtlr	r29
	lfd	f1, 128(r30)
	fsub	f0, f1, f0
	lwz	r0, 8(r30)
	stfd	f0, 136(r30)
	mflr	r29
	stw	r29, 148(r30)
	addi	r30, r30, 152
	bl	o_param_c.2536
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 148(r30)
	addi	r30, r30, 152
	bl	min_caml_sqrt
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
	lfd	f1, 136(r30)
	fmul	f0, f1, f0
	lfd	f1, 120(r30)
	stfd	f0, 144(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 156(r30)
	addi	r30, r30, 160
	bl	min_caml_fsqr
	subi	r30, r30, 160
	lwz	r29, 156(r30)
	mtlr	r29
	lfd	f1, 144(r30)
	stfd	f0, 152(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	min_caml_fsqr
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lfd	f1, 152(r30)
	fadd	f0, f1, f0
	lfd	f1, 120(r30)
	stfd	f0, 160(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 172(r30)
	addi	r30, r30, 176
	bl	min_caml_fabs
	subi	r30, r30, 176
	lwz	r29, 172(r30)
	mtlr	r29
	lis	r29, ha16(l.6398)
	ADDI	r29, r29, lo16(l.6398)
	lfd	f1, 0(r29)
	mflr	r29
	stw	r29, 172(r30)
	addi	r30, r30, 176
	bl	min_caml_fless
	subi	r30, r30, 176
	lwz	r29, 172(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8906
	lfd	f0, 120(r30)
	lfd	f1, 144(r30)
	fdiv	f0, f1, f0
	mflr	r29
	stw	r29, 172(r30)
	addi	r30, r30, 176
	bl	min_caml_fabs
	subi	r30, r30, 176
	lwz	r29, 172(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 172(r30)
	addi	r30, r30, 176
	bl	min_caml_atan
	subi	r30, r30, 176
	lwz	r29, 172(r30)
	mtlr	r29
	lis	r29, ha16(l.6400)
	ADDI	r29, r29, lo16(l.6400)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	lis	r29, ha16(l.6401)
	ADDI	r29, r29, lo16(l.6401)
	lfd	f1, 0(r29)
	fdiv	f0, f0, f1
	b	beq_cont.8907
beq_else.8906:
	lis	r29, ha16(l.6399)
	ADDI	r29, r29, lo16(l.6399)
	lfd	f0, 0(r29)
beq_cont.8907:
	stfd	f0, 168(r30)
	mflr	r29
	stw	r29, 180(r30)
	addi	r30, r30, 184
	bl	min_caml_floor
	subi	r30, r30, 184
	lwz	r29, 180(r30)
	mtlr	r29
	lfd	f1, 168(r30)
	fsub	f0, f1, f0
	lwz	r0, 0(r30)
	lfd	f1, 8(r0)
	lwz	r0, 8(r30)
	stfd	f0, 176(r30)
	stfd	f1, 184(r30)
	mflr	r29
	stw	r29, 196(r30)
	addi	r30, r30, 200
	bl	o_param_y.2542
	subi	r30, r30, 200
	lwz	r29, 196(r30)
	mtlr	r29
	lfd	f1, 184(r30)
	fsub	f0, f1, f0
	lwz	r0, 8(r30)
	stfd	f0, 192(r30)
	mflr	r29
	stw	r29, 204(r30)
	addi	r30, r30, 208
	bl	o_param_b.2534
	subi	r30, r30, 208
	lwz	r29, 204(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 204(r30)
	addi	r30, r30, 208
	bl	min_caml_sqrt
	subi	r30, r30, 208
	lwz	r29, 204(r30)
	mtlr	r29
	lfd	f1, 192(r30)
	fmul	f0, f1, f0
	lfd	f1, 160(r30)
	stfd	f0, 200(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 212(r30)
	addi	r30, r30, 216
	bl	min_caml_fabs
	subi	r30, r30, 216
	lwz	r29, 212(r30)
	mtlr	r29
	lis	r29, ha16(l.6398)
	ADDI	r29, r29, lo16(l.6398)
	lfd	f1, 0(r29)
	mflr	r29
	stw	r29, 212(r30)
	addi	r30, r30, 216
	bl	min_caml_fless
	subi	r30, r30, 216
	lwz	r29, 212(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8908
	lfd	f0, 160(r30)
	lfd	f1, 200(r30)
	fdiv	f0, f1, f0
	mflr	r29
	stw	r29, 212(r30)
	addi	r30, r30, 216
	bl	min_caml_fabs
	subi	r30, r30, 216
	lwz	r29, 212(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 212(r30)
	addi	r30, r30, 216
	bl	min_caml_atan
	subi	r30, r30, 216
	lwz	r29, 212(r30)
	mtlr	r29
	lis	r29, ha16(l.6400)
	ADDI	r29, r29, lo16(l.6400)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	lis	r29, ha16(l.6401)
	ADDI	r29, r29, lo16(l.6401)
	lfd	f1, 0(r29)
	fdiv	f0, f0, f1
	b	beq_cont.8909
beq_else.8908:
	lis	r29, ha16(l.6399)
	ADDI	r29, r29, lo16(l.6399)
	lfd	f0, 0(r29)
beq_cont.8909:
	stfd	f0, 208(r30)
	mflr	r29
	stw	r29, 220(r30)
	addi	r30, r30, 224
	bl	min_caml_floor
	subi	r30, r30, 224
	lwz	r29, 220(r30)
	mtlr	r29
	lfd	f1, 208(r30)
	fsub	f0, f1, f0
	lis	r29, ha16(l.6403)
	ADDI	r29, r29, lo16(l.6403)
	lfd	f1, 0(r29)
	lis	r29, ha16(l.6404)
	ADDI	r29, r29, lo16(l.6404)
	lfd	f2, 0(r29)
	lfd	f3, 176(r30)
	fsub	f2, f2, f3
	stfd	f0, 216(r30)
	stfd	f1, 224(r30)
	mflr	r29
	fmr	f0, f2
	stw	r29, 236(r30)
	addi	r30, r30, 240
	bl	min_caml_fsqr
	subi	r30, r30, 240
	lwz	r29, 236(r30)
	mtlr	r29
	lfd	f1, 224(r30)
	fsub	f0, f1, f0
	lis	r29, ha16(l.6404)
	ADDI	r29, r29, lo16(l.6404)
	lfd	f1, 0(r29)
	lfd	f2, 216(r30)
	fsub	f1, f1, f2
	stfd	f0, 232(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 244(r30)
	addi	r30, r30, 248
	bl	min_caml_fsqr
	subi	r30, r30, 248
	lwz	r29, 244(r30)
	mtlr	r29
	lfd	f1, 232(r30)
	fsub	f0, f1, f0
	stfd	f0, 240(r30)
	mflr	r29
	stw	r29, 252(r30)
	addi	r30, r30, 256
	bl	min_caml_fisneg
	subi	r30, r30, 256
	lwz	r29, 252(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8910
	lfd	f0, 240(r30)
	b	beq_cont.8911
beq_else.8910:
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
beq_cont.8911:
	lis	r29, ha16(l.6405)
	ADDI	r29, r29, lo16(l.6405)
	lfd	f1, 0(r29)
	fmul	f0, f1, f0
	lis	r29, ha16(l.6406)
	ADDI	r29, r29, lo16(l.6406)
	lfd	f1, 0(r29)
	fdiv	f0, f0, f1
	lwz	r0, 4(r30)
	stfd	f0, 16(r0)
	blr
beq_else.8905:
	blr
add_light.2794:
	LW	r0, 8(r27)
	LW	r1, 4(r27)
	stfd	f2, 0(r30)
	stfd	f1, 8(r30)
	stfd	f0, 16(r30)
	stw	r0, 24(r30)
	stw	r1, 28(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fispos
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8914
	b	beq_cont.8915
beq_else.8914:
	lfd	f0, 16(r30)
	lwz	r0, 28(r30)
	lwz	r1, 24(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	vecaccum.2505
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
beq_cont.8915:
	lfd	f0, 8(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fispos
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8916
	blr
beq_else.8916:
	lfd	f0, 8(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fsqr
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fsqr
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 0(r30)
	fmul	f0, f0, f1
	lwz	r0, 28(r30)
	lfd	f1, 0(r0)
	fadd	f1, f1, f0
	stfd	f1, 0(r0)
	lfd	f1, 8(r0)
	fadd	f1, f1, f0
	stfd	f1, 8(r0)
	lfd	f1, 16(r0)
	fadd	f0, f1, f0
	stfd	f0, 16(r0)
	blr
trace_reflections.2798:
	LW	r2, 32(r27)
	LW	r3, 28(r27)
	LW	r4, 24(r27)
	LW	r5, 20(r27)
	LW	r6, 16(r27)
	LW	r7, 12(r27)
	LW	r8, 8(r27)
	LW	r9, 4(r27)
	cmpwi	cr7, r0, 0
	blt	cr7, bge_else.8919
	SLL	r10, r0, 2
	LW	r3, r3, r10
	stw	r27, 0(r30)
	stw	r0, 4(r30)
	stfd	f1, 8(r30)
	stw	r9, 16(r30)
	stw	r1, 20(r30)
	stfd	f0, 24(r30)
	stw	r5, 32(r30)
	stw	r2, 36(r30)
	stw	r4, 40(r30)
	stw	r3, 44(r30)
	stw	r7, 48(r30)
	stw	r8, 52(r30)
	stw	r6, 56(r30)
	mflr	r29
	mr	r0, r3
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	r_dvec.2589
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lwz	r27, 56(r30)
	stw	r0, 60(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8920
	b	beq_cont.8921
beq_else.8920:
	lwz	r0, 52(r30)
	LW	r0, 0(r0)
	ADDI	r0, r0, 4
	lwz	r1, 48(r30)
	LW	r1, 0(r1)
	ADD	r0, r0, r1
	lwz	r1, 44(r30)
	stw	r0, 64(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	r_surface_id.2587
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r1, 64(r30)
	cmpw	cr7, r1, r0
	bne	cr7, beq_else.8922
	LI	r0, 0
	lwz	r1, 40(r30)
	LW	r1, 0(r1)
	lwz	r27, 36(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8924
	lwz	r0, 60(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	d_vec.2583
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 32(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	veciprod.2497
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 44(r30)
	stfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	r_bright.2591
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fmul	f2, f0, f1
	lfd	f3, 72(r30)
	fmul	f2, f2, f3
	lwz	r0, 60(r30)
	stfd	f2, 80(r30)
	stfd	f0, 88(r30)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	d_vec.2583
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 20(r30)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	veciprod.2497
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	lfd	f1, 88(r30)
	fmul	f1, f1, f0
	lfd	f0, 80(r30)
	lfd	f2, 8(r30)
	lwz	r27, 16(r30)
	mflr	r29
	stw	r29, 100(r30)
	addi	r30, r30, 104
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	b	beq_cont.8925
beq_else.8924:
beq_cont.8925:
	b	beq_cont.8923
beq_else.8922:
beq_cont.8923:
beq_cont.8921:
	lwz	r0, 4(r30)
	SUBI	r0, r0, 1
	lfd	f0, 24(r30)
	lfd	f1, 8(r30)
	lwz	r1, 20(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.8919:
	blr
trace_ray.2803:
	LW	r3, 80(r27)
	LW	r4, 76(r27)
	LW	r5, 72(r27)
	LW	r6, 68(r27)
	LW	r7, 64(r27)
	LW	r8, 60(r27)
	LW	r9, 56(r27)
	LW	r10, 52(r27)
	LW	r11, 48(r27)
	LW	r12, 44(r27)
	LW	r13, 40(r27)
	LW	r14, 36(r27)
	LW	r15, 32(r27)
	LW	r16, 28(r27)
	LW	r17, 24(r27)
	LW	r18, 20(r27)
	LW	r19, 16(r27)
	LW	r20, 12(r27)
	LW	r21, 8(r27)
	LW	r22, 4(r27)
	cmpwi	cr7, r0, 4
	bgt	cr7, ble_else.8928
	stw	r27, 0(r30)
	stfd	f1, 8(r30)
	stw	r5, 16(r30)
	stw	r4, 20(r30)
	stw	r14, 24(r30)
	stw	r9, 28(r30)
	stw	r22, 32(r30)
	stw	r8, 36(r30)
	stw	r11, 40(r30)
	stw	r13, 44(r30)
	stw	r6, 48(r30)
	stw	r2, 52(r30)
	stw	r17, 56(r30)
	stw	r3, 60(r30)
	stw	r18, 64(r30)
	stw	r7, 68(r30)
	stw	r20, 72(r30)
	stw	r12, 76(r30)
	stw	r19, 80(r30)
	stw	r10, 84(r30)
	stw	r21, 88(r30)
	stfd	f0, 96(r30)
	stw	r15, 104(r30)
	stw	r0, 108(r30)
	stw	r1, 112(r30)
	stw	r16, 116(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	p_surface_ids.2568
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	lwz	r1, 112(r30)
	lwz	r27, 116(r30)
	stw	r0, 120(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 124(r30)
	addi	r30, r30, 128
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8931
	LI	r0, -1
	lwz	r1, 108(r30)
	SLL	r2, r1, 2
	lwz	r3, 120(r30)
	SW	r0, r3, r2
	cmpwi	cr7, r1, 0
	bne	cr7, beq_else.8932
	blr
beq_else.8932:
	lwz	r0, 112(r30)
	lwz	r1, 104(r30)
	mflr	r29
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	veciprod.2497
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	min_caml_fneg
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	stfd	f0, 128(r30)
	mflr	r29
	stw	r29, 140(r30)
	addi	r30, r30, 144
	bl	min_caml_fispos
	subi	r30, r30, 144
	lwz	r29, 140(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8935
	blr
beq_else.8935:
	lfd	f0, 128(r30)
	mflr	r29
	stw	r29, 140(r30)
	addi	r30, r30, 144
	bl	min_caml_fsqr
	subi	r30, r30, 144
	lwz	r29, 140(r30)
	mtlr	r29
	lfd	f1, 128(r30)
	fmul	f0, f0, f1
	lfd	f1, 96(r30)
	fmul	f0, f0, f1
	lwz	r0, 88(r30)
	lfd	f1, 0(r0)
	fmul	f0, f0, f1
	lwz	r0, 84(r30)
	lfd	f1, 0(r0)
	fadd	f1, f1, f0
	stfd	f1, 0(r0)
	lfd	f1, 8(r0)
	fadd	f1, f1, f0
	stfd	f1, 8(r0)
	lfd	f1, 16(r0)
	fadd	f0, f1, f0
	stfd	f0, 16(r0)
	blr
beq_else.8931:
	lwz	r0, 80(r30)
	LW	r0, 0(r0)
	SLL	r1, r0, 2
	lwz	r2, 76(r30)
	LW	r1, r2, r1
	stw	r0, 136(r30)
	stw	r1, 140(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 148(r30)
	addi	r30, r30, 152
	bl	o_reflectiontype.2526
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
	lwz	r1, 140(r30)
	stw	r0, 144(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 148(r30)
	addi	r30, r30, 152
	bl	o_diffuse.2546
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
	lfd	f1, 96(r30)
	fmul	f0, f0, f1
	lwz	r0, 140(r30)
	lwz	r1, 112(r30)
	lwz	r27, 72(r30)
	stfd	f0, 152(r30)
	mflr	r29
	stw	r29, 164(r30)
	addi	r30, r30, 168
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lwz	r0, 68(r30)
	lwz	r1, 64(r30)
	mflr	r29
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	veccpy.2486
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lwz	r0, 140(r30)
	lwz	r1, 64(r30)
	lwz	r27, 60(r30)
	mflr	r29
	stw	r29, 164(r30)
	addi	r30, r30, 168
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lwz	r0, 136(r30)
	ADDI	r0, r0, 4
	lwz	r1, 56(r30)
	LW	r1, 0(r1)
	ADD	r0, r0, r1
	lwz	r1, 108(r30)
	SLL	r2, r1, 2
	lwz	r3, 120(r30)
	SW	r0, r3, r2
	lwz	r0, 52(r30)
	mflr	r29
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	p_intersection_points.2566
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lwz	r1, 108(r30)
	SLL	r2, r1, 2
	LW	r0, r0, r2
	lwz	r2, 64(r30)
	mflr	r29
	mr	r1, r2
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	veccpy.2486
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lwz	r0, 52(r30)
	mflr	r29
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	p_calc_diffuse.2570
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lwz	r1, 140(r30)
	stw	r0, 160(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	o_diffuse.2546
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lis	r29, ha16(l.6404)
	ADDI	r29, r29, lo16(l.6404)
	lfd	f1, 0(r29)
	mflr	r29
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	min_caml_fless
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8939
	LI	r0, 1
	lwz	r1, 108(r30)
	SLL	r2, r1, 2
	lwz	r3, 160(r30)
	SW	r0, r3, r2
	lwz	r0, 52(r30)
	mflr	r29
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	p_energy.2572
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lwz	r1, 108(r30)
	SLL	r2, r1, 2
	LW	r2, r0, r2
	lwz	r3, 48(r30)
	stw	r0, 164(r30)
	mflr	r29
	mr	r1, r3
	mr	r0, r2
	stw	r29, 172(r30)
	addi	r30, r30, 176
	bl	veccpy.2486
	subi	r30, r30, 176
	lwz	r29, 172(r30)
	mtlr	r29
	lwz	r0, 108(r30)
	SLL	r1, r0, 2
	lwz	r2, 164(r30)
	LW	r1, r2, r1
	lis	r29, ha16(l.6441)
	ADDI	r29, r29, lo16(l.6441)
	lfd	f0, 0(r29)
	lfd	f1, 152(r30)
	fmul	f0, f0, f1
	mflr	r29
	mr	r0, r1
	stw	r29, 172(r30)
	addi	r30, r30, 176
	bl	vecscale.2515
	subi	r30, r30, 176
	lwz	r29, 172(r30)
	mtlr	r29
	lwz	r0, 52(r30)
	mflr	r29
	stw	r29, 172(r30)
	addi	r30, r30, 176
	bl	p_nvectors.2581
	subi	r30, r30, 176
	lwz	r29, 172(r30)
	mtlr	r29
	lwz	r1, 108(r30)
	SLL	r2, r1, 2
	LW	r0, r0, r2
	lwz	r2, 44(r30)
	mflr	r29
	mr	r1, r2
	stw	r29, 172(r30)
	addi	r30, r30, 176
	bl	veccpy.2486
	subi	r30, r30, 176
	lwz	r29, 172(r30)
	mtlr	r29
	b	beq_cont.8940
beq_else.8939:
	LI	r0, 0
	lwz	r1, 108(r30)
	SLL	r2, r1, 2
	lwz	r3, 160(r30)
	SW	r0, r3, r2
beq_cont.8940:
	lis	r29, ha16(l.6443)
	ADDI	r29, r29, lo16(l.6443)
	lfd	f0, 0(r29)
	lwz	r0, 112(r30)
	lwz	r1, 44(r30)
	stfd	f0, 168(r30)
	mflr	r29
	stw	r29, 180(r30)
	addi	r30, r30, 184
	bl	veciprod.2497
	subi	r30, r30, 184
	lwz	r29, 180(r30)
	mtlr	r29
	lfd	f1, 168(r30)
	fmul	f0, f1, f0
	lwz	r0, 112(r30)
	lwz	r1, 44(r30)
	mflr	r29
	stw	r29, 180(r30)
	addi	r30, r30, 184
	bl	vecaccum.2505
	subi	r30, r30, 184
	lwz	r29, 180(r30)
	mtlr	r29
	lwz	r0, 140(r30)
	mflr	r29
	stw	r29, 180(r30)
	addi	r30, r30, 184
	bl	o_hilight.2548
	subi	r30, r30, 184
	lwz	r29, 180(r30)
	mtlr	r29
	lfd	f1, 96(r30)
	fmul	f0, f1, f0
	LI	r0, 0
	lwz	r1, 40(r30)
	LW	r1, 0(r1)
	lwz	r27, 36(r30)
	stfd	f0, 176(r30)
	mflr	r29
	stw	r29, 188(r30)
	addi	r30, r30, 192
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 192
	lwz	r29, 188(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8941
	lwz	r0, 44(r30)
	lwz	r1, 104(r30)
	mflr	r29
	stw	r29, 188(r30)
	addi	r30, r30, 192
	bl	veciprod.2497
	subi	r30, r30, 192
	lwz	r29, 188(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 188(r30)
	addi	r30, r30, 192
	bl	min_caml_fneg
	subi	r30, r30, 192
	lwz	r29, 188(r30)
	mtlr	r29
	lfd	f1, 152(r30)
	fmul	f0, f0, f1
	lwz	r0, 112(r30)
	lwz	r1, 104(r30)
	stfd	f0, 184(r30)
	mflr	r29
	stw	r29, 196(r30)
	addi	r30, r30, 200
	bl	veciprod.2497
	subi	r30, r30, 200
	lwz	r29, 196(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 196(r30)
	addi	r30, r30, 200
	bl	min_caml_fneg
	subi	r30, r30, 200
	lwz	r29, 196(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 184(r30)
	lfd	f2, 176(r30)
	lwz	r27, 32(r30)
	mflr	r29
	stw	r29, 196(r30)
	addi	r30, r30, 200
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 200
	lwz	r29, 196(r30)
	mtlr	r29
	b	beq_cont.8942
beq_else.8941:
beq_cont.8942:
	lwz	r0, 64(r30)
	lwz	r27, 28(r30)
	mflr	r29
	stw	r29, 196(r30)
	addi	r30, r30, 200
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 200
	lwz	r29, 196(r30)
	mtlr	r29
	lwz	r0, 24(r30)
	LW	r0, 0(r0)
	SUBI	r0, r0, 1
	lfd	f0, 152(r30)
	lfd	f1, 176(r30)
	lwz	r1, 112(r30)
	lwz	r27, 20(r30)
	mflr	r29
	stw	r29, 196(r30)
	addi	r30, r30, 200
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 200
	lwz	r29, 196(r30)
	mtlr	r29
	lis	r29, ha16(l.6446)
	ADDI	r29, r29, lo16(l.6446)
	lfd	f0, 0(r29)
	lfd	f1, 96(r30)
	mflr	r29
	stw	r29, 196(r30)
	addi	r30, r30, 200
	bl	min_caml_fless
	subi	r30, r30, 200
	lwz	r29, 196(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8943
	blr
beq_else.8943:
	lwz	r0, 108(r30)
	cmpwi	cr7, r0, 4
	blt	cr7, bge_else.8945
	b	bge_cont.8946
bge_else.8945:
	ADDI	r1, r0, 1
	LI	r2, -1
	SLL	r1, r1, 2
	lwz	r3, 120(r30)
	SW	r2, r3, r1
bge_cont.8946:
	lwz	r1, 144(r30)
	cmpwi	cr7, r1, 2
	bne	cr7, beq_else.8947
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	lwz	r1, 140(r30)
	stfd	f0, 192(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 204(r30)
	addi	r30, r30, 208
	bl	o_diffuse.2546
	subi	r30, r30, 208
	lwz	r29, 204(r30)
	mtlr	r29
	lfd	f1, 192(r30)
	fsub	f0, f1, f0
	lfd	f1, 96(r30)
	fmul	f0, f1, f0
	lwz	r0, 108(r30)
	ADDI	r0, r0, 1
	lwz	r1, 16(r30)
	lfd	f1, 0(r1)
	lfd	f2, 8(r30)
	fadd	f1, f2, f1
	lwz	r1, 112(r30)
	lwz	r2, 52(r30)
	lwz	r27, 0(r30)
	mflr	r29
	stw	r29, 204(r30)
	addi	r30, r30, 208
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 208
	lwz	r29, 204(r30)
	mtlr	r29
	b	beq_cont.8948
beq_else.8947:
beq_cont.8948:
	blr
ble_else.8928:
	blr
trace_diffuse_ray.2809:
	LW	r1, 48(r27)
	LW	r2, 44(r27)
	LW	r3, 40(r27)
	LW	r4, 36(r27)
	LW	r5, 32(r27)
	LW	r6, 28(r27)
	LW	r7, 24(r27)
	LW	r8, 20(r27)
	LW	r9, 16(r27)
	LW	r10, 12(r27)
	LW	r11, 8(r27)
	LW	r12, 4(r27)
	stw	r2, 0(r30)
	stw	r12, 4(r30)
	stfd	f0, 8(r30)
	stw	r7, 16(r30)
	stw	r6, 20(r30)
	stw	r3, 24(r30)
	stw	r4, 28(r30)
	stw	r9, 32(r30)
	stw	r1, 36(r30)
	stw	r11, 40(r30)
	stw	r0, 44(r30)
	stw	r5, 48(r30)
	stw	r10, 52(r30)
	mflr	r29
	mr	r27, r8
	stw	r29, 60(r30)
	addi	r30, r30, 64
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8951
	blr
beq_else.8951:
	lwz	r0, 52(r30)
	LW	r0, 0(r0)
	SLL	r0, r0, 2
	lwz	r1, 48(r30)
	LW	r0, r1, r0
	lwz	r1, 44(r30)
	stw	r0, 56(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	d_vec.2583
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 56(r30)
	lwz	r27, 40(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lwz	r0, 56(r30)
	lwz	r1, 32(r30)
	lwz	r27, 36(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	LI	r0, 0
	lwz	r1, 28(r30)
	LW	r1, 0(r1)
	lwz	r27, 24(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8953
	lwz	r0, 20(r30)
	lwz	r1, 16(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	veciprod.2497
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_fneg
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	stfd	f0, 64(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fispos
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8955
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	b	beq_cont.8956
beq_else.8955:
	lfd	f0, 64(r30)
beq_cont.8956:
	lfd	f1, 8(r30)
	fmul	f0, f1, f0
	lwz	r0, 56(r30)
	stfd	f0, 72(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	o_diffuse.2546
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 72(r30)
	fmul	f0, f1, f0
	lwz	r0, 4(r30)
	lwz	r1, 0(r30)
	b	vecaccum.2505
beq_else.8953:
	blr
iter_trace_diffuse_rays.2812:
	LW	r4, 4(r27)
	cmpwi	cr7, r3, 0
	blt	cr7, bge_else.8958
	SLL	r5, r3, 2
	LW	r5, r0, r5
	stw	r2, 0(r30)
	stw	r27, 4(r30)
	stw	r4, 8(r30)
	stw	r0, 12(r30)
	stw	r3, 16(r30)
	stw	r1, 20(r30)
	mflr	r29
	mr	r0, r5
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	d_vec.2583
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	veciprod.2497
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	stfd	f0, 24(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fisneg
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8959
	lwz	r0, 16(r30)
	SLL	r1, r0, 2
	lwz	r2, 12(r30)
	LW	r1, r2, r1
	lis	r29, ha16(l.6464)
	ADDI	r29, r29, lo16(l.6464)
	lfd	f0, 0(r29)
	lfd	f1, 24(r30)
	fdiv	f0, f1, f0
	lwz	r27, 8(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	b	beq_cont.8960
beq_else.8959:
	lwz	r0, 16(r30)
	ADDI	r1, r0, 1
	SLL	r1, r1, 2
	lwz	r2, 12(r30)
	LW	r1, r2, r1
	lis	r29, ha16(l.6462)
	ADDI	r29, r29, lo16(l.6462)
	lfd	f0, 0(r29)
	lfd	f1, 24(r30)
	fdiv	f0, f1, f0
	lwz	r27, 8(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
beq_cont.8960:
	lwz	r0, 16(r30)
	SUBI	r3, r0, 2
	lwz	r0, 12(r30)
	lwz	r1, 20(r30)
	lwz	r2, 0(r30)
	lwz	r27, 4(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.8958:
	blr
trace_diffuse_rays.2817:
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	stw	r2, 0(r30)
	stw	r1, 4(r30)
	stw	r0, 8(r30)
	stw	r4, 12(r30)
	mflr	r29
	mr	r0, r2
	mr	r27, r3
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	LI	r3, 118
	lwz	r0, 8(r30)
	lwz	r1, 4(r30)
	lwz	r2, 0(r30)
	lwz	r27, 12(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
trace_diffuse_ray_80percent.2821:
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	stw	r2, 0(r30)
	stw	r1, 4(r30)
	stw	r3, 8(r30)
	stw	r4, 12(r30)
	stw	r0, 16(r30)
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8962
	b	beq_cont.8963
beq_else.8962:
	LW	r5, 0(r4)
	mflr	r29
	mr	r0, r5
	mr	r27, r3
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
beq_cont.8963:
	lwz	r0, 16(r30)
	cmpwi	cr7, r0, 1
	bne	cr7, beq_else.8964
	b	beq_cont.8965
beq_else.8964:
	lwz	r1, 12(r30)
	LW	r2, 4(r1)
	lwz	r3, 4(r30)
	lwz	r4, 0(r30)
	lwz	r27, 8(r30)
	mflr	r29
	mr	r1, r3
	mr	r0, r2
	mr	r2, r4
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
beq_cont.8965:
	lwz	r0, 16(r30)
	cmpwi	cr7, r0, 2
	bne	cr7, beq_else.8966
	b	beq_cont.8967
beq_else.8966:
	lwz	r1, 12(r30)
	LW	r2, 8(r1)
	lwz	r3, 4(r30)
	lwz	r4, 0(r30)
	lwz	r27, 8(r30)
	mflr	r29
	mr	r1, r3
	mr	r0, r2
	mr	r2, r4
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
beq_cont.8967:
	lwz	r0, 16(r30)
	cmpwi	cr7, r0, 3
	bne	cr7, beq_else.8968
	b	beq_cont.8969
beq_else.8968:
	lwz	r1, 12(r30)
	LW	r2, 12(r1)
	lwz	r3, 4(r30)
	lwz	r4, 0(r30)
	lwz	r27, 8(r30)
	mflr	r29
	mr	r1, r3
	mr	r0, r2
	mr	r2, r4
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
beq_cont.8969:
	lwz	r0, 16(r30)
	cmpwi	cr7, r0, 4
	bne	cr7, beq_else.8970
	blr
beq_else.8970:
	lwz	r0, 12(r30)
	LW	r0, 16(r0)
	lwz	r1, 4(r30)
	lwz	r2, 0(r30)
	lwz	r27, 8(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
calc_diffuse_using_1point.2825:
	LW	r2, 12(r27)
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	stw	r3, 0(r30)
	stw	r2, 4(r30)
	stw	r4, 8(r30)
	stw	r1, 12(r30)
	stw	r0, 16(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	p_received_ray_20percent.2574
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 16(r30)
	stw	r0, 20(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	p_nvectors.2581
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 16(r30)
	stw	r0, 24(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	p_intersection_points.2566
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 16(r30)
	stw	r0, 28(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	p_energy.2572
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r1, 12(r30)
	SLL	r2, r1, 2
	lwz	r3, 20(r30)
	LW	r2, r3, r2
	lwz	r3, 8(r30)
	stw	r0, 32(r30)
	mflr	r29
	mr	r1, r2
	mr	r0, r3
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	veccpy.2486
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	p_group_id.2576
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r1, 12(r30)
	SLL	r2, r1, 2
	lwz	r3, 24(r30)
	LW	r2, r3, r2
	SLL	r3, r1, 2
	lwz	r4, 28(r30)
	LW	r3, r4, r3
	lwz	r27, 4(r30)
	mflr	r29
	mr	r1, r2
	mr	r2, r3
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 12(r30)
	SLL	r0, r0, 2
	lwz	r1, 32(r30)
	LW	r1, r1, r0
	lwz	r0, 0(r30)
	lwz	r2, 8(r30)
	b	vecaccumv.2518
calc_diffuse_using_5points.2828:
	LW	r5, 8(r27)
	LW	r6, 4(r27)
	SLL	r7, r0, 2
	LW	r1, r1, r7
	stw	r5, 0(r30)
	stw	r6, 4(r30)
	stw	r4, 8(r30)
	stw	r3, 12(r30)
	stw	r2, 16(r30)
	stw	r0, 20(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	p_received_ray_20percent.2574
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	SUBI	r2, r1, 1
	SLL	r2, r2, 2
	lwz	r3, 16(r30)
	LW	r2, r3, r2
	stw	r0, 24(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	p_received_ray_20percent.2574
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	SLL	r2, r1, 2
	lwz	r3, 16(r30)
	LW	r2, r3, r2
	stw	r0, 28(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	p_received_ray_20percent.2574
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	ADDI	r2, r1, 1
	SLL	r2, r2, 2
	lwz	r3, 16(r30)
	LW	r2, r3, r2
	stw	r0, 32(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	p_received_ray_20percent.2574
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	SLL	r2, r1, 2
	lwz	r3, 12(r30)
	LW	r2, r3, r2
	stw	r0, 36(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	p_received_ray_20percent.2574
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r1, 8(r30)
	SLL	r2, r1, 2
	lwz	r3, 24(r30)
	LW	r2, r3, r2
	lwz	r3, 4(r30)
	stw	r0, 40(r30)
	mflr	r29
	mr	r1, r2
	mr	r0, r3
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	veccpy.2486
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	SLL	r1, r0, 2
	lwz	r2, 28(r30)
	LW	r1, r2, r1
	lwz	r2, 4(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	vecadd.2509
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	SLL	r1, r0, 2
	lwz	r2, 32(r30)
	LW	r1, r2, r1
	lwz	r2, 4(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	vecadd.2509
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	SLL	r1, r0, 2
	lwz	r2, 36(r30)
	LW	r1, r2, r1
	lwz	r2, 4(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	vecadd.2509
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	SLL	r1, r0, 2
	lwz	r2, 40(r30)
	LW	r1, r2, r1
	lwz	r2, 4(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	vecadd.2509
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 20(r30)
	SLL	r0, r0, 2
	lwz	r1, 16(r30)
	LW	r0, r1, r0
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	p_energy.2572
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r1, 8(r30)
	SLL	r1, r1, 2
	LW	r1, r0, r1
	lwz	r0, 0(r30)
	lwz	r2, 4(r30)
	b	vecaccumv.2518
do_without_neighbors.2834:
	LW	r2, 4(r27)
	cmpwi	cr7, r1, 4
	bgt	cr7, ble_else.8972
	stw	r27, 0(r30)
	stw	r2, 4(r30)
	stw	r0, 8(r30)
	stw	r1, 12(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	p_surface_ids.2568
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 12(r30)
	SLL	r2, r1, 2
	LW	r0, r0, r2
	cmpwi	cr7, r0, 0
	blt	cr7, bge_else.8973
	lwz	r0, 8(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	p_calc_diffuse.2570
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 12(r30)
	SLL	r2, r1, 2
	LW	r0, r0, r2
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8974
	b	beq_cont.8975
beq_else.8974:
	lwz	r0, 8(r30)
	lwz	r27, 4(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
beq_cont.8975:
	lwz	r0, 12(r30)
	ADDI	r1, r0, 1
	lwz	r0, 8(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.8973:
	blr
ble_else.8972:
	blr
neighbors_exist.2837:
	LW	r2, 4(r27)
	LW	r3, 4(r2)
	ADDI	r4, r1, 1
	cmpw	cr7, r3, r4
	bgt	cr7, ble_else.8978
	LI	r0, 0
	blr
ble_else.8978:
	cmpwi	cr7, r1, 0
	bgt	cr7, ble_else.8979
	LI	r0, 0
	blr
ble_else.8979:
	LW	r1, 0(r2)
	ADDI	r2, r0, 1
	cmpw	cr7, r1, r2
	bgt	cr7, ble_else.8980
	LI	r0, 0
	blr
ble_else.8980:
	cmpwi	cr7, r0, 0
	bgt	cr7, ble_else.8981
	LI	r0, 0
	blr
ble_else.8981:
	LI	r0, 1
	blr
get_surface_id.2841:
	stw	r1, 0(r30)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	p_surface_ids.2568
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	SLL	r1, r1, 2
	LW	r0, r0, r1
	blr
neighbors_are_available.2844:
	SLL	r5, r0, 2
	LW	r5, r2, r5
	stw	r2, 0(r30)
	stw	r3, 4(r30)
	stw	r4, 8(r30)
	stw	r1, 12(r30)
	stw	r0, 16(r30)
	mflr	r29
	mr	r1, r4
	mr	r0, r5
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	get_surface_id.2841
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 16(r30)
	SLL	r2, r1, 2
	lwz	r3, 12(r30)
	LW	r2, r3, r2
	lwz	r3, 8(r30)
	stw	r0, 20(r30)
	mflr	r29
	mr	r1, r3
	mr	r0, r2
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	get_surface_id.2841
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	cmpw	cr7, r0, r1
	bne	cr7, beq_else.8982
	lwz	r0, 16(r30)
	SLL	r2, r0, 2
	lwz	r3, 4(r30)
	LW	r2, r3, r2
	lwz	r3, 8(r30)
	mflr	r29
	mr	r1, r3
	mr	r0, r2
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	get_surface_id.2841
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	cmpw	cr7, r0, r1
	bne	cr7, beq_else.8983
	lwz	r0, 16(r30)
	SUBI	r2, r0, 1
	SLL	r2, r2, 2
	lwz	r3, 0(r30)
	LW	r2, r3, r2
	lwz	r4, 8(r30)
	mflr	r29
	mr	r1, r4
	mr	r0, r2
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	get_surface_id.2841
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	cmpw	cr7, r0, r1
	bne	cr7, beq_else.8984
	lwz	r0, 16(r30)
	ADDI	r0, r0, 1
	SLL	r0, r0, 2
	lwz	r2, 0(r30)
	LW	r0, r2, r0
	lwz	r2, 8(r30)
	mflr	r29
	mr	r1, r2
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	get_surface_id.2841
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	cmpw	cr7, r0, r1
	bne	cr7, beq_else.8985
	LI	r0, 1
	blr
beq_else.8985:
	LI	r0, 0
	blr
beq_else.8984:
	LI	r0, 0
	blr
beq_else.8983:
	LI	r0, 0
	blr
beq_else.8982:
	LI	r0, 0
	blr
try_exploit_neighbors.2850:
	LW	r6, 8(r27)
	LW	r7, 4(r27)
	SLL	r8, r0, 2
	LW	r8, r3, r8
	cmpwi	cr7, r5, 4
	bgt	cr7, ble_else.8986
	stw	r1, 0(r30)
	stw	r27, 4(r30)
	stw	r7, 8(r30)
	stw	r8, 12(r30)
	stw	r6, 16(r30)
	stw	r5, 20(r30)
	stw	r4, 24(r30)
	stw	r3, 28(r30)
	stw	r2, 32(r30)
	stw	r0, 36(r30)
	mflr	r29
	mr	r1, r5
	mr	r0, r8
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	get_surface_id.2841
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	blt	cr7, bge_else.8987
	lwz	r0, 36(r30)
	lwz	r1, 32(r30)
	lwz	r2, 28(r30)
	lwz	r3, 24(r30)
	lwz	r4, 20(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	neighbors_are_available.2844
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8988
	lwz	r0, 36(r30)
	SLL	r0, r0, 2
	lwz	r1, 28(r30)
	LW	r0, r1, r0
	lwz	r1, 20(r30)
	lwz	r27, 16(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.8988:
	lwz	r0, 12(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	p_calc_diffuse.2570
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r4, 20(r30)
	SLL	r1, r4, 2
	LW	r0, r0, r1
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8989
	b	beq_cont.8990
beq_else.8989:
	lwz	r0, 36(r30)
	lwz	r1, 32(r30)
	lwz	r2, 28(r30)
	lwz	r3, 24(r30)
	lwz	r27, 8(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
beq_cont.8990:
	lwz	r0, 20(r30)
	ADDI	r5, r0, 1
	lwz	r0, 36(r30)
	lwz	r1, 0(r30)
	lwz	r2, 32(r30)
	lwz	r3, 28(r30)
	lwz	r4, 24(r30)
	lwz	r27, 4(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.8987:
	blr
ble_else.8986:
	blr
write_ppm_header.2857:
	LW	r0, 4(r27)
	LI	r1, 80
	stw	r0, 0(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_print_char
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r0, 51
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_print_char
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r0, 10
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_print_char
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	LW	r1, 0(r0)
	mflr	r29
	mr	r0, r1
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_print_int
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r0, 32
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_print_char
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	LW	r0, 4(r0)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_print_int
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r0, 32
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_print_char
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r0, 255
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_print_int
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r0, 10
	b	min_caml_print_char
write_rgb_element.2859:
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_int_of_float
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	cmpwi	cr7, r0, 255
	bgt	cr7, ble_else.8993
	cmpwi	cr7, r0, 0
	blt	cr7, bge_else.8995
	b	bge_cont.8996
bge_else.8995:
	LI	r0, 0
bge_cont.8996:
	b	ble_cont.8994
ble_else.8993:
	LI	r0, 255
ble_cont.8994:
	b	min_caml_print_int
write_rgb.2861:
	LW	r0, 4(r27)
	lfd	f0, 0(r0)
	stw	r0, 0(r30)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	write_rgb_element.2859
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r0, 32
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_print_char
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	lfd	f0, 8(r0)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	write_rgb_element.2859
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r0, 32
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_print_char
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	lfd	f0, 16(r0)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	write_rgb_element.2859
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r0, 10
	b	min_caml_print_char
pretrace_diffuse_rays.2863:
	LW	r2, 12(r27)
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	cmpwi	cr7, r1, 4
	bgt	cr7, ble_else.8997
	stw	r27, 0(r30)
	stw	r2, 4(r30)
	stw	r3, 8(r30)
	stw	r4, 12(r30)
	stw	r1, 16(r30)
	stw	r0, 20(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	get_surface_id.2841
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	blt	cr7, bge_else.8998
	lwz	r0, 20(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	p_calc_diffuse.2570
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 16(r30)
	SLL	r2, r1, 2
	LW	r0, r0, r2
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.8999
	b	beq_cont.9000
beq_else.8999:
	lwz	r0, 20(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	p_group_id.2576
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 12(r30)
	stw	r0, 24(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	vecbzero.2484
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 20(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	p_nvectors.2581
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	stw	r0, 28(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	p_intersection_points.2566
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r1, 24(r30)
	SLL	r1, r1, 2
	lwz	r2, 8(r30)
	LW	r1, r2, r1
	lwz	r2, 16(r30)
	SLL	r3, r2, 2
	lwz	r4, 28(r30)
	LW	r3, r4, r3
	SLL	r4, r2, 2
	LW	r0, r0, r4
	lwz	r27, 4(r30)
	mflr	r29
	mr	r2, r0
	mr	r0, r1
	mr	r1, r3
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r0, 20(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	p_received_ray_20percent.2574
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lwz	r1, 16(r30)
	SLL	r2, r1, 2
	LW	r0, r0, r2
	lwz	r2, 12(r30)
	mflr	r29
	mr	r1, r2
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	veccpy.2486
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
beq_cont.9000:
	lwz	r0, 16(r30)
	ADDI	r1, r0, 1
	lwz	r0, 20(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.8998:
	blr
ble_else.8997:
	blr
pretrace_pixels.2866:
	LW	r3, 36(r27)
	LW	r4, 32(r27)
	LW	r5, 28(r27)
	LW	r6, 24(r27)
	LW	r7, 20(r27)
	LW	r8, 16(r27)
	LW	r9, 12(r27)
	LW	r10, 8(r27)
	LW	r11, 4(r27)
	cmpwi	cr7, r1, 0
	blt	cr7, bge_else.9003
	lfd	f3, 0(r7)
	LW	r7, 0(r11)
	SUB	r7, r1, r7
	stw	r27, 0(r30)
	stw	r10, 4(r30)
	stw	r2, 8(r30)
	stw	r4, 12(r30)
	stw	r0, 16(r30)
	stw	r1, 20(r30)
	stw	r3, 24(r30)
	stw	r5, 28(r30)
	stw	r8, 32(r30)
	stfd	f2, 40(r30)
	stfd	f1, 48(r30)
	stw	r9, 56(r30)
	stfd	f0, 64(r30)
	stw	r6, 72(r30)
	stfd	f3, 80(r30)
	mflr	r29
	mr	r0, r7
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_float_of_int
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lfd	f1, 80(r30)
	fmul	f0, f1, f0
	lwz	r0, 72(r30)
	lfd	f1, 0(r0)
	fmul	f1, f0, f1
	lfd	f2, 64(r30)
	fadd	f1, f1, f2
	lwz	r1, 56(r30)
	stfd	f1, 0(r1)
	lfd	f1, 8(r0)
	fmul	f1, f0, f1
	lfd	f3, 48(r30)
	fadd	f1, f1, f3
	stfd	f1, 8(r1)
	lfd	f1, 16(r0)
	fmul	f0, f0, f1
	lfd	f1, 40(r30)
	fadd	f0, f0, f1
	stfd	f0, 16(r1)
	LI	r0, 0
	mflr	r29
	mr	r26, r1
	mr	r1, r0
	mr	r0, r26
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	vecunit_sgn.2494
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lwz	r0, 32(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	vecbzero.2484
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lwz	r0, 28(r30)
	lwz	r1, 24(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	veccpy.2486
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	LI	r0, 0
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	lwz	r1, 20(r30)
	SLL	r2, r1, 2
	lwz	r3, 16(r30)
	LW	r2, r3, r2
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f1, 0(r29)
	lwz	r4, 56(r30)
	lwz	r27, 12(r30)
	mflr	r29
	mr	r1, r4
	stw	r29, 92(r30)
	addi	r30, r30, 96
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lwz	r0, 20(r30)
	SLL	r1, r0, 2
	lwz	r2, 16(r30)
	LW	r1, r2, r1
	mflr	r29
	mr	r0, r1
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	p_rgb.2564
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lwz	r1, 32(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	veccpy.2486
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lwz	r0, 20(r30)
	SLL	r1, r0, 2
	lwz	r2, 16(r30)
	LW	r1, r2, r1
	lwz	r3, 8(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r3
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	p_set_group_id.2578
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lwz	r0, 20(r30)
	SLL	r1, r0, 2
	lwz	r2, 16(r30)
	LW	r1, r2, r1
	LI	r3, 0
	lwz	r27, 4(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r3
	stw	r29, 92(r30)
	addi	r30, r30, 96
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lwz	r0, 20(r30)
	SUBI	r0, r0, 1
	LI	r1, 1
	lwz	r2, 8(r30)
	stw	r0, 88(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	add_mod5.2473
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mr	r2, r0
	mtlr	r29
	lfd	f0, 64(r30)
	lfd	f1, 48(r30)
	lfd	f2, 40(r30)
	lwz	r0, 16(r30)
	lwz	r1, 88(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.9003:
	blr
pretrace_line.2873:
	LW	r3, 24(r27)
	LW	r4, 20(r27)
	LW	r5, 16(r27)
	LW	r6, 12(r27)
	LW	r7, 8(r27)
	LW	r8, 4(r27)
	lfd	f0, 0(r5)
	LW	r5, 4(r8)
	SUB	r1, r1, r5
	stw	r2, 0(r30)
	stw	r0, 4(r30)
	stw	r6, 8(r30)
	stw	r7, 12(r30)
	stw	r3, 16(r30)
	stw	r4, 20(r30)
	stfd	f0, 24(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_float_of_int
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fmul	f0, f1, f0
	lwz	r0, 20(r30)
	lfd	f1, 0(r0)
	fmul	f1, f0, f1
	lwz	r1, 16(r30)
	lfd	f2, 0(r1)
	fadd	f1, f1, f2
	lfd	f2, 8(r0)
	fmul	f2, f0, f2
	lfd	f3, 8(r1)
	fadd	f2, f2, f3
	lfd	f3, 16(r0)
	fmul	f0, f0, f3
	lfd	f3, 16(r1)
	fadd	f0, f0, f3
	lwz	r0, 12(r30)
	LW	r0, 0(r0)
	SUBI	r1, r0, 1
	lwz	r0, 4(r30)
	lwz	r2, 0(r30)
	lwz	r27, 8(r30)
	fmr	f31, f2
	fmr	f2, f0
	fmr	f0, f1
	fmr	f1, f31
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
scan_pixel.2877:
	LW	r5, 24(r27)
	LW	r6, 20(r27)
	LW	r7, 16(r27)
	LW	r8, 12(r27)
	LW	r9, 8(r27)
	LW	r10, 4(r27)
	LW	r9, 0(r9)
	cmpw	cr7, r9, r0
	bgt	cr7, ble_else.9008
	blr
ble_else.9008:
	SLL	r9, r0, 2
	LW	r9, r3, r9
	stw	r27, 0(r30)
	stw	r5, 4(r30)
	stw	r2, 8(r30)
	stw	r6, 12(r30)
	stw	r10, 16(r30)
	stw	r3, 20(r30)
	stw	r4, 24(r30)
	stw	r1, 28(r30)
	stw	r0, 32(r30)
	stw	r8, 36(r30)
	stw	r7, 40(r30)
	mflr	r29
	mr	r0, r9
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	p_rgb.2564
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 40(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	veccpy.2486
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 32(r30)
	lwz	r1, 28(r30)
	lwz	r2, 24(r30)
	lwz	r27, 36(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.9010
	lwz	r0, 32(r30)
	SLL	r1, r0, 2
	lwz	r2, 20(r30)
	LW	r1, r2, r1
	LI	r3, 0
	lwz	r27, 16(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r3
	stw	r29, 44(r30)
	addi	r30, r30, 48
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	b	beq_cont.9011
beq_else.9010:
	LI	r5, 0
	lwz	r0, 32(r30)
	lwz	r1, 28(r30)
	lwz	r2, 8(r30)
	lwz	r3, 20(r30)
	lwz	r4, 24(r30)
	lwz	r27, 12(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
beq_cont.9011:
	lwz	r27, 4(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 32(r30)
	ADDI	r0, r0, 1
	lwz	r1, 28(r30)
	lwz	r2, 8(r30)
	lwz	r3, 20(r30)
	lwz	r4, 24(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
scan_line.2883:
	LW	r5, 12(r27)
	LW	r6, 8(r27)
	LW	r7, 4(r27)
	LW	r8, 4(r7)
	cmpw	cr7, r8, r0
	bgt	cr7, ble_else.9012
	blr
ble_else.9012:
	LW	r7, 4(r7)
	SUBI	r7, r7, 1
	stw	r27, 0(r30)
	stw	r4, 4(r30)
	stw	r3, 8(r30)
	stw	r2, 12(r30)
	stw	r1, 16(r30)
	stw	r0, 20(r30)
	stw	r5, 24(r30)
	cmpw	cr7, r7, r0
	bgt	cr7, ble_else.9014
	b	ble_cont.9015
ble_else.9014:
	ADDI	r7, r0, 1
	mflr	r29
	mr	r2, r4
	mr	r1, r7
	mr	r0, r3
	mr	r27, r6
	stw	r29, 28(r30)
	addi	r30, r30, 32
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
ble_cont.9015:
	LI	r0, 0
	lwz	r1, 20(r30)
	lwz	r2, 16(r30)
	lwz	r3, 12(r30)
	lwz	r4, 8(r30)
	lwz	r27, 24(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 20(r30)
	ADDI	r0, r0, 1
	LI	r1, 2
	lwz	r2, 4(r30)
	stw	r0, 28(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	add_mod5.2473
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mr	r4, r0
	mtlr	r29
	lwz	r0, 28(r30)
	lwz	r1, 12(r30)
	lwz	r2, 8(r30)
	lwz	r3, 16(r30)
	lwz	r27, 0(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	blr
create_float5x3array.2889:
	LI	r0, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_float_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mr	r1, r0
	mtlr	r29
	LI	r0, 5
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 0(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_float_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	SW	r0, 4(r1)
	LI	r0, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_float_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	SW	r0, 8(r1)
	LI	r0, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_float_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	SW	r0, 12(r1)
	LI	r0, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_float_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	SW	r0, 16(r1)
	MOV	r0, r1
	blr
create_pixel.2891:
	LI	r0, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_float_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	stw	r0, 0(r30)
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	create_float5x3array.2889
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r1, 5
	LI	r2, 0
	stw	r0, 4(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_create_array
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	LI	r1, 5
	LI	r2, 0
	stw	r0, 8(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_create_array
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	stw	r0, 12(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	create_float5x3array.2889
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	stw	r0, 16(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	create_float5x3array.2889
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	LI	r1, 1
	LI	r2, 0
	stw	r0, 20(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_create_array
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	stw	r0, 24(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	create_float5x3array.2889
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	MOV	r1, r28
	ADDI	r28, r28, 32
	SW	r0, 28(r1)
	lwz	r0, 24(r30)
	SW	r0, 24(r1)
	lwz	r0, 20(r30)
	SW	r0, 20(r1)
	lwz	r0, 16(r30)
	SW	r0, 16(r1)
	lwz	r0, 12(r30)
	SW	r0, 12(r1)
	lwz	r0, 8(r30)
	SW	r0, 8(r1)
	lwz	r0, 4(r30)
	SW	r0, 4(r1)
	lwz	r0, 0(r30)
	SW	r0, 0(r1)
	MOV	r0, r1
	blr
init_line_elements.2893:
	cmpwi	cr7, r1, 0
	blt	cr7, bge_else.9017
	stw	r0, 0(r30)
	stw	r1, 4(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	create_pixel.2891
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r1, 4(r30)
	SLL	r2, r1, 2
	lwz	r3, 0(r30)
	SW	r0, r3, r2
	SUBI	r1, r1, 1
	mr	r0, r3
	b	init_line_elements.2893
bge_else.9017:
	blr
create_pixelline.2896:
	LW	r0, 4(r27)
	LW	r1, 0(r0)
	stw	r0, 0(r30)
	stw	r1, 4(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	create_pixel.2891
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 4(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_create_array
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r1, 0(r30)
	LW	r1, 0(r1)
	SUBI	r1, r1, 2
	b	init_line_elements.2893
tan.2898:
	stfd	f0, 0(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_sin
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lfd	f1, 0(r30)
	stfd	f0, 8(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_cos
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lfd	f1, 8(r30)
	fdiv	f0, f1, f0
	blr
adjust_position.2900:
	fmul	f0, f0, f0
	lis	r29, ha16(l.6446)
	ADDI	r29, r29, lo16(l.6446)
	lfd	f2, 0(r29)
	fadd	f0, f0, f2
	stfd	f1, 0(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_sqrt
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f1, 0(r29)
	fdiv	f1, f1, f0
	stfd	f0, 8(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_atan
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lfd	f1, 0(r30)
	fmul	f0, f0, f1
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	tan.2898
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lfd	f1, 8(r30)
	fmul	f0, f0, f1
	blr
calc_dirvec.2903:
	LW	r3, 4(r27)
	cmpwi	cr7, r0, 5
	blt	cr7, bge_else.9018
	stw	r2, 0(r30)
	stw	r3, 4(r30)
	stw	r1, 8(r30)
	stfd	f0, 16(r30)
	stfd	f1, 24(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_fsqr
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	stfd	f0, 32(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_fsqr
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lfd	f1, 32(r30)
	fadd	f0, f1, f0
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f1, 0(r29)
	fadd	f0, f0, f1
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_sqrt
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lfd	f1, 16(r30)
	fdiv	f1, f1, f0
	lfd	f2, 24(r30)
	fdiv	f2, f2, f0
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f3, 0(r29)
	fdiv	f0, f3, f0
	lwz	r0, 8(r30)
	SLL	r0, r0, 2
	lwz	r1, 4(r30)
	LW	r0, r1, r0
	lwz	r1, 0(r30)
	SLL	r2, r1, 2
	LW	r2, r0, r2
	stw	r0, 40(r30)
	stfd	f0, 48(r30)
	stfd	f2, 56(r30)
	stfd	f1, 64(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	d_vec.2583
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f0, 64(r30)
	lfd	f1, 56(r30)
	lfd	f2, 48(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	vecset.2476
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	ADDI	r1, r0, 40
	SLL	r1, r1, 2
	lwz	r2, 40(r30)
	LW	r1, r2, r1
	mflr	r29
	mr	r0, r1
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	d_vec.2583
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f0, 56(r30)
	stw	r0, 72(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_fneg
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	fmr	f2, f0
	mtlr	r29
	lfd	f0, 64(r30)
	lfd	f1, 48(r30)
	lwz	r0, 72(r30)
	mflr	r29
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	vecset.2476
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	ADDI	r1, r0, 80
	SLL	r1, r1, 2
	lwz	r2, 40(r30)
	LW	r1, r2, r1
	mflr	r29
	mr	r0, r1
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	d_vec.2583
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f0, 64(r30)
	stw	r0, 76(r30)
	mflr	r29
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_fneg
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	stfd	f0, 80(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_fneg
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	fmr	f2, f0
	mtlr	r29
	lfd	f0, 48(r30)
	lfd	f1, 80(r30)
	lwz	r0, 76(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	vecset.2476
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	ADDI	r1, r0, 1
	SLL	r1, r1, 2
	lwz	r2, 40(r30)
	LW	r1, r2, r1
	mflr	r29
	mr	r0, r1
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	d_vec.2583
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lfd	f0, 64(r30)
	stw	r0, 88(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_fneg
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lfd	f1, 56(r30)
	stfd	f0, 96(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	min_caml_fneg
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	lfd	f1, 48(r30)
	stfd	f0, 104(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	min_caml_fneg
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	fmr	f2, f0
	mtlr	r29
	lfd	f0, 96(r30)
	lfd	f1, 104(r30)
	lwz	r0, 88(r30)
	mflr	r29
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	vecset.2476
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	ADDI	r1, r0, 41
	SLL	r1, r1, 2
	lwz	r2, 40(r30)
	LW	r1, r2, r1
	mflr	r29
	mr	r0, r1
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	d_vec.2583
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	lfd	f0, 64(r30)
	stw	r0, 112(r30)
	mflr	r29
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	min_caml_fneg
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	lfd	f1, 48(r30)
	stfd	f0, 120(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 132(r30)
	addi	r30, r30, 136
	bl	min_caml_fneg
	subi	r30, r30, 136
	lwz	r29, 132(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 120(r30)
	lfd	f2, 56(r30)
	lwz	r0, 112(r30)
	mflr	r29
	stw	r29, 132(r30)
	addi	r30, r30, 136
	bl	vecset.2476
	subi	r30, r30, 136
	lwz	r29, 132(r30)
	mtlr	r29
	lwz	r0, 0(r30)
	ADDI	r0, r0, 81
	SLL	r0, r0, 2
	lwz	r1, 40(r30)
	LW	r0, r1, r0
	mflr	r29
	stw	r29, 132(r30)
	addi	r30, r30, 136
	bl	d_vec.2583
	subi	r30, r30, 136
	lwz	r29, 132(r30)
	mtlr	r29
	lfd	f0, 48(r30)
	stw	r0, 128(r30)
	mflr	r29
	stw	r29, 132(r30)
	addi	r30, r30, 136
	bl	min_caml_fneg
	subi	r30, r30, 136
	lwz	r29, 132(r30)
	mtlr	r29
	lfd	f1, 64(r30)
	lfd	f2, 56(r30)
	lwz	r0, 128(r30)
	b	vecset.2476
bge_else.9018:
	stfd	f2, 136(r30)
	stw	r2, 0(r30)
	stw	r1, 8(r30)
	stw	r27, 144(r30)
	stfd	f3, 152(r30)
	stw	r0, 160(r30)
	mflr	r29
	fmr	f0, f1
	fmr	f1, f2
	stw	r29, 164(r30)
	addi	r30, r30, 168
	bl	adjust_position.2900
	subi	r30, r30, 168
	lwz	r29, 164(r30)
	mtlr	r29
	lwz	r0, 160(r30)
	ADDI	r0, r0, 1
	lfd	f1, 152(r30)
	stfd	f0, 168(r30)
	stw	r0, 176(r30)
	mflr	r29
	stw	r29, 180(r30)
	addi	r30, r30, 184
	bl	adjust_position.2900
	subi	r30, r30, 184
	lwz	r29, 180(r30)
	fmr	f1, f0
	mtlr	r29
	lfd	f0, 168(r30)
	lfd	f2, 136(r30)
	lfd	f3, 152(r30)
	lwz	r0, 176(r30)
	lwz	r1, 8(r30)
	lwz	r2, 0(r30)
	lwz	r27, 144(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
calc_dirvecs.2911:
	LW	r3, 4(r27)
	cmpwi	cr7, r0, 0
	blt	cr7, bge_else.9026
	stw	r27, 0(r30)
	stw	r0, 4(r30)
	stfd	f0, 8(r30)
	stw	r2, 16(r30)
	stw	r1, 20(r30)
	stw	r3, 24(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_float_of_int
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lis	r29, ha16(l.6558)
	ADDI	r29, r29, lo16(l.6558)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	lis	r29, ha16(l.6559)
	ADDI	r29, r29, lo16(l.6559)
	lfd	f1, 0(r29)
	fsub	f2, f0, f1
	LI	r0, 0
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f1, 0(r29)
	lfd	f3, 8(r30)
	lwz	r1, 20(r30)
	lwz	r2, 16(r30)
	lwz	r27, 24(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_float_of_int
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lis	r29, ha16(l.6558)
	ADDI	r29, r29, lo16(l.6558)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	lis	r29, ha16(l.6446)
	ADDI	r29, r29, lo16(l.6446)
	lfd	f1, 0(r29)
	fadd	f2, f0, f1
	LI	r0, 0
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f1, 0(r29)
	lwz	r1, 16(r30)
	ADDI	r2, r1, 2
	lfd	f3, 8(r30)
	lwz	r3, 20(r30)
	lwz	r27, 24(r30)
	mflr	r29
	mr	r1, r3
	stw	r29, 28(r30)
	addi	r30, r30, 32
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	SUBI	r0, r0, 1
	LI	r1, 1
	lwz	r2, 20(r30)
	stw	r0, 28(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	add_mod5.2473
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mr	r1, r0
	mtlr	r29
	lfd	f0, 8(r30)
	lwz	r0, 28(r30)
	lwz	r2, 16(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.9026:
	blr
calc_dirvec_rows.2916:
	LW	r3, 4(r27)
	cmpwi	cr7, r0, 0
	blt	cr7, bge_else.9028
	stw	r27, 0(r30)
	stw	r0, 4(r30)
	stw	r2, 8(r30)
	stw	r1, 12(r30)
	stw	r3, 16(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_float_of_int
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lis	r29, ha16(l.6558)
	ADDI	r29, r29, lo16(l.6558)
	lfd	f1, 0(r29)
	fmul	f0, f0, f1
	lis	r29, ha16(l.6559)
	ADDI	r29, r29, lo16(l.6559)
	lfd	f1, 0(r29)
	fsub	f0, f0, f1
	LI	r0, 4
	lwz	r1, 12(r30)
	lwz	r2, 8(r30)
	lwz	r27, 16(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	SUBI	r0, r0, 1
	LI	r1, 2
	lwz	r2, 12(r30)
	stw	r0, 20(r30)
	mflr	r29
	mr	r0, r2
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	add_mod5.2473
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 8(r30)
	ADDI	r2, r0, 4
	lwz	r0, 20(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.9028:
	blr
create_dirvec.2920:
	LW	r0, 4(r27)
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 0(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_float_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 0(r30)
	LW	r0, 0(r0)
	stw	r1, 4(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_create_array
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	MOV	r1, r28
	ADDI	r28, r28, 8
	SW	r0, 4(r1)
	lwz	r0, 4(r30)
	SW	r0, 0(r1)
	MOV	r0, r1
	blr
create_dirvec_elements.2922:
	LW	r2, 4(r27)
	cmpwi	cr7, r1, 0
	blt	cr7, bge_else.9030
	stw	r27, 0(r30)
	stw	r0, 4(r30)
	stw	r1, 8(r30)
	mflr	r29
	mr	r27, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r1, 8(r30)
	SLL	r2, r1, 2
	lwz	r3, 4(r30)
	SW	r0, r3, r2
	SUBI	r1, r1, 1
	lwz	r27, 0(r30)
	mr	r0, r3
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.9030:
	blr
create_dirvecs.2925:
	LW	r1, 12(r27)
	LW	r2, 8(r27)
	LW	r3, 4(r27)
	cmpwi	cr7, r0, 0
	blt	cr7, bge_else.9032
	LI	r4, 120
	stw	r27, 0(r30)
	stw	r2, 4(r30)
	stw	r1, 8(r30)
	stw	r0, 12(r30)
	stw	r4, 16(r30)
	mflr	r29
	mr	r27, r3
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 16(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_create_array
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r1, 12(r30)
	SLL	r2, r1, 2
	lwz	r3, 8(r30)
	SW	r0, r3, r2
	SLL	r0, r1, 2
	LW	r0, r3, r0
	LI	r2, 118
	lwz	r27, 4(r30)
	mflr	r29
	mr	r1, r2
	stw	r29, 20(r30)
	addi	r30, r30, 24
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lwz	r0, 12(r30)
	SUBI	r0, r0, 1
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.9032:
	blr
init_dirvec_constants.2927:
	LW	r2, 4(r27)
	cmpwi	cr7, r1, 0
	blt	cr7, bge_else.9034
	SLL	r3, r1, 2
	LW	r3, r0, r3
	stw	r0, 0(r30)
	stw	r27, 4(r30)
	stw	r1, 8(r30)
	mflr	r29
	mr	r0, r3
	mr	r27, r2
	stw	r29, 12(r30)
	addi	r30, r30, 16
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	SUBI	r1, r0, 1
	lwz	r0, 0(r30)
	lwz	r27, 4(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.9034:
	blr
init_vecset_constants.2930:
	LW	r1, 8(r27)
	LW	r2, 4(r27)
	cmpwi	cr7, r0, 0
	blt	cr7, bge_else.9036
	SLL	r3, r0, 2
	LW	r2, r2, r3
	LI	r3, 119
	stw	r27, 0(r30)
	stw	r0, 4(r30)
	mflr	r29
	mr	r0, r2
	mr	r27, r1
	mr	r1, r3
	stw	r29, 12(r30)
	addi	r30, r30, 16
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	SUBI	r0, r0, 1
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
bge_else.9036:
	blr
init_dirvecs.2932:
	LW	r0, 12(r27)
	LW	r1, 8(r27)
	LW	r2, 4(r27)
	LI	r3, 4
	stw	r0, 0(r30)
	stw	r2, 4(r30)
	mflr	r29
	mr	r0, r3
	mr	r27, r1
	stw	r29, 12(r30)
	addi	r30, r30, 16
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	LI	r0, 9
	LI	r1, 0
	LI	r2, 0
	lwz	r27, 4(r30)
	mflr	r29
	stw	r29, 12(r30)
	addi	r30, r30, 16
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	LI	r0, 4
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
add_reflection.2934:
	LW	r2, 12(r27)
	LW	r3, 8(r27)
	LW	r27, 4(r27)
	stw	r3, 0(r30)
	stw	r0, 4(r30)
	stw	r1, 8(r30)
	stfd	f0, 16(r30)
	stw	r2, 24(r30)
	stfd	f3, 32(r30)
	stfd	f2, 40(r30)
	stfd	f1, 48(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	stw	r0, 56(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	d_vec.2583
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lfd	f0, 48(r30)
	lfd	f1, 40(r30)
	lfd	f2, 32(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	vecset.2476
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lwz	r0, 56(r30)
	lwz	r27, 24(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	MOV	r0, r28
	ADDI	r28, r28, 16
	lfd	f0, 16(r30)
	stfd	f0, 8(r0)
	lwz	r1, 56(r30)
	SW	r1, 4(r0)
	lwz	r1, 8(r30)
	SW	r1, 0(r0)
	lwz	r1, 4(r30)
	SLL	r1, r1, 2
	lwz	r2, 0(r30)
	SW	r0, r2, r1
	blr
setup_rect_reflection.2941:
	LW	r2, 12(r27)
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	ADDI	r0, r0, 4
	LW	r5, 0(r2)
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	stw	r2, 0(r30)
	stw	r5, 4(r30)
	stw	r4, 8(r30)
	stw	r0, 12(r30)
	stw	r3, 16(r30)
	stfd	f0, 24(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	o_diffuse.2546
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fsub	f0, f1, f0
	lwz	r0, 16(r30)
	lfd	f1, 0(r0)
	stfd	f0, 32(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_fneg
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	lfd	f1, 8(r0)
	stfd	f0, 40(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_fneg
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	lwz	r0, 16(r30)
	lfd	f1, 16(r0)
	stfd	f0, 48(r30)
	mflr	r29
	fmr	f0, f1
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_fneg
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	fmr	f3, f0
	mtlr	r29
	lwz	r0, 12(r30)
	ADDI	r1, r0, 1
	lwz	r2, 16(r30)
	lfd	f1, 0(r2)
	lfd	f0, 32(r30)
	lfd	f2, 48(r30)
	lwz	r3, 4(r30)
	lwz	r27, 8(r30)
	stfd	f3, 56(r30)
	mflr	r29
	mr	r0, r3
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	ADDI	r1, r0, 1
	lwz	r2, 12(r30)
	ADDI	r3, r2, 2
	lwz	r4, 16(r30)
	lfd	f2, 8(r4)
	lfd	f0, 32(r30)
	lfd	f1, 40(r30)
	lfd	f3, 56(r30)
	lwz	r27, 8(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r3
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	ADDI	r1, r0, 2
	lwz	r2, 12(r30)
	ADDI	r2, r2, 3
	lwz	r3, 16(r30)
	lfd	f3, 16(r3)
	lfd	f0, 32(r30)
	lfd	f1, 40(r30)
	lfd	f2, 48(r30)
	lwz	r27, 8(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 4(r30)
	ADDI	r0, r0, 3
	lwz	r1, 0(r30)
	SW	r0, 0(r1)
	blr
setup_surface_reflection.2944:
	LW	r2, 12(r27)
	LW	r3, 8(r27)
	LW	r4, 4(r27)
	ADDI	r0, r0, 4
	ADDI	r0, r0, 1
	LW	r5, 0(r2)
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f0, 0(r29)
	stw	r2, 0(r30)
	stw	r0, 4(r30)
	stw	r5, 8(r30)
	stw	r4, 12(r30)
	stw	r3, 16(r30)
	stw	r1, 20(r30)
	stfd	f0, 24(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	o_diffuse.2546
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	lfd	f1, 24(r30)
	fsub	f0, f1, f0
	lwz	r0, 20(r30)
	stfd	f0, 32(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	o_param_abc.2538
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 16(r30)
	mflr	r29
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	veciprod.2497
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	lis	r29, ha16(l.6126)
	ADDI	r29, r29, lo16(l.6126)
	lfd	f1, 0(r29)
	lwz	r0, 20(r30)
	stfd	f0, 40(r30)
	stfd	f1, 48(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	o_param_a.2532
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lfd	f1, 48(r30)
	fmul	f0, f1, f0
	lfd	f1, 40(r30)
	fmul	f0, f0, f1
	lwz	r0, 16(r30)
	lfd	f2, 0(r0)
	fsub	f0, f0, f2
	lis	r29, ha16(l.6126)
	ADDI	r29, r29, lo16(l.6126)
	lfd	f2, 0(r29)
	lwz	r1, 20(r30)
	stfd	f0, 56(r30)
	stfd	f2, 64(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	o_param_b.2534
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	lfd	f1, 64(r30)
	fmul	f0, f1, f0
	lfd	f1, 40(r30)
	fmul	f0, f0, f1
	lwz	r0, 16(r30)
	lfd	f2, 8(r0)
	fsub	f0, f0, f2
	lis	r29, ha16(l.6126)
	ADDI	r29, r29, lo16(l.6126)
	lfd	f2, 0(r29)
	lwz	r1, 20(r30)
	stfd	f0, 72(r30)
	stfd	f2, 80(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	o_param_c.2536
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lfd	f1, 80(r30)
	fmul	f0, f1, f0
	lfd	f1, 40(r30)
	fmul	f0, f0, f1
	lwz	r0, 16(r30)
	lfd	f1, 16(r0)
	fsub	f3, f0, f1
	lfd	f0, 32(r30)
	lfd	f1, 56(r30)
	lfd	f2, 72(r30)
	lwz	r0, 8(r30)
	lwz	r1, 4(r30)
	lwz	r27, 12(r30)
	mflr	r29
	stw	r29, 92(r30)
	addi	r30, r30, 96
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	lwz	r0, 8(r30)
	ADDI	r0, r0, 1
	lwz	r1, 0(r30)
	SW	r0, 0(r1)
	blr
setup_reflections.2947:
	LW	r1, 12(r27)
	LW	r2, 8(r27)
	LW	r3, 4(r27)
	cmpwi	cr7, r0, 0
	blt	cr7, bge_else.9044
	SLL	r4, r0, 2
	LW	r3, r3, r4
	stw	r1, 0(r30)
	stw	r0, 4(r30)
	stw	r2, 8(r30)
	stw	r3, 12(r30)
	mflr	r29
	mr	r0, r3
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_reflectiontype.2526
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	cmpwi	cr7, r0, 2
	bne	cr7, beq_else.9045
	lwz	r0, 12(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_diffuse.2546
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	lis	r29, ha16(l.6002)
	ADDI	r29, r29, lo16(l.6002)
	lfd	f1, 0(r29)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_fless
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	cmpwi	cr7, r0, 0
	bne	cr7, beq_else.9046
	blr
beq_else.9046:
	lwz	r0, 12(r30)
	mflr	r29
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	o_form.2524
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	cmpwi	cr7, r0, 1
	bne	cr7, beq_else.9048
	lwz	r0, 4(r30)
	lwz	r1, 12(r30)
	lwz	r27, 8(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.9048:
	cmpwi	cr7, r0, 2
	bne	cr7, beq_else.9049
	lwz	r0, 4(r30)
	lwz	r1, 12(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
beq_else.9049:
	blr
beq_else.9045:
	blr
bge_else.9044:
	blr
rt.2949:
	LW	r2, 56(r27)
	LW	r3, 52(r27)
	LW	r4, 48(r27)
	LW	r5, 44(r27)
	LW	r6, 40(r27)
	LW	r7, 36(r27)
	LW	r8, 32(r27)
	LW	r9, 28(r27)
	LW	r10, 24(r27)
	LW	r11, 20(r27)
	LW	r12, 16(r27)
	LW	r13, 12(r27)
	LW	r14, 8(r27)
	LW	r15, 4(r27)
	SW	r0, 0(r13)
	SW	r1, 4(r13)
	SUBI	r13, r0, 2
	SW	r13, 0(r14)
	SUBI	r1, r1, 2
	SW	r1, 4(r14)
	lis	r29, ha16(l.6592)
	ADDI	r29, r29, lo16(l.6592)
	lfd	f0, 0(r29)
	stw	r6, 0(r30)
	stw	r8, 4(r30)
	stw	r3, 8(r30)
	stw	r9, 12(r30)
	stw	r4, 16(r30)
	stw	r11, 20(r30)
	stw	r10, 24(r30)
	stw	r12, 28(r30)
	stw	r2, 32(r30)
	stw	r7, 36(r30)
	stw	r15, 40(r30)
	stw	r5, 44(r30)
	stfd	f0, 48(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_float_of_int
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lfd	f1, 48(r30)
	fdiv	f0, f1, f0
	lwz	r0, 44(r30)
	stfd	f0, 0(r0)
	lwz	r27, 40(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lwz	r27, 40(r30)
	stw	r0, 56(r30)
	mflr	r29
	stw	r29, 60(r30)
	addi	r30, r30, 64
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	lwz	r27, 40(r30)
	stw	r0, 60(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r27, 36(r30)
	stw	r0, 64(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r27, 32(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r27, 28(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 24(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	d_vec.2583
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r1, 20(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	veccpy.2486
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 24(r30)
	lwz	r27, 16(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	lwz	r0, 12(r30)
	LW	r0, 0(r0)
	SUBI	r0, r0, 1
	lwz	r27, 8(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	LI	r1, 0
	LI	r2, 0
	lwz	r0, 60(r30)
	lwz	r27, 4(r30)
	mflr	r29
	stw	r29, 68(r30)
	addi	r30, r30, 72
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	LI	r0, 0
	LI	r4, 2
	lwz	r1, 56(r30)
	lwz	r2, 60(r30)
	lwz	r3, 64(r30)
	lwz	r27, 0(r30)
	lwz	r26, 0(r27)
	mtctr	r26
	bctr
_min_caml_start: # main entry point
	mflr	r0
	stmw	r30, -8(r1)
	stw	r0, 8(r1)
	stwu	r1, -96(r1)
   # main program start
	LI	r0, 1
	LI	r1, 0
	mflr	r29
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r1, 0
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 0(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_float_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r1, 60
	LI	r2, 0
	LI	r3, 0
	LI	r4, 0
	LI	r5, 0
	LI	r6, 0
	MOV	r7, r28
	ADDI	r28, r28, 48
	SW	r0, 40(r7)
	SW	r0, 36(r7)
	SW	r0, 32(r7)
	SW	r0, 28(r7)
	SW	r6, 24(r7)
	SW	r0, 20(r7)
	SW	r0, 16(r7)
	SW	r5, 12(r7)
	SW	r4, 8(r7)
	SW	r3, 4(r7)
	SW	r2, 0(r7)
	MOV	r0, r7
	mflr	r29
	mr	r26, r1
	mr	r1, r0
	mr	r0, r26
	stw	r29, 4(r30)
	addi	r30, r30, 8
	bl	min_caml_create_array
	subi	r30, r30, 8
	lwz	r29, 4(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 4(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_create_float_array
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 8(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 12(r30)
	addi	r30, r30, 16
	bl	min_caml_create_float_array
	subi	r30, r30, 16
	lwz	r29, 12(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 12(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_create_float_array
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	LI	r1, 1
	lis	r29, ha16(l.6405)
	ADDI	r29, r29, lo16(l.6405)
	lfd	f0, 0(r29)
	stw	r0, 16(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 20(r30)
	addi	r30, r30, 24
	bl	min_caml_create_float_array
	subi	r30, r30, 24
	lwz	r29, 20(r30)
	mtlr	r29
	LI	r1, 50
	LI	r2, 1
	LI	r3, -1
	stw	r0, 20(r30)
	stw	r1, 24(r30)
	mflr	r29
	mr	r1, r3
	mr	r0, r2
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_create_array
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 24(r30)
	mflr	r29
	stw	r29, 28(r30)
	addi	r30, r30, 32
	bl	min_caml_create_array
	subi	r30, r30, 32
	lwz	r29, 28(r30)
	mtlr	r29
	LI	r1, 1
	LI	r2, 1
	LW	r3, 0(r0)
	stw	r0, 28(r30)
	stw	r1, 32(r30)
	mflr	r29
	mr	r1, r3
	mr	r0, r2
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_create_array
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mr	r1, r0
	mtlr	r29
	lwz	r0, 32(r30)
	mflr	r29
	stw	r29, 36(r30)
	addi	r30, r30, 40
	bl	min_caml_create_array
	subi	r30, r30, 40
	lwz	r29, 36(r30)
	mtlr	r29
	LI	r1, 1
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 36(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_create_float_array
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	LI	r1, 1
	LI	r2, 0
	stw	r0, 40(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	stw	r29, 44(r30)
	addi	r30, r30, 48
	bl	min_caml_create_array
	subi	r30, r30, 48
	lwz	r29, 44(r30)
	mtlr	r29
	LI	r1, 1
	lis	r29, ha16(l.6351)
	ADDI	r29, r29, lo16(l.6351)
	lfd	f0, 0(r29)
	stw	r0, 44(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_create_float_array
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 48(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 52(r30)
	addi	r30, r30, 56
	bl	min_caml_create_float_array
	subi	r30, r30, 56
	lwz	r29, 52(r30)
	mtlr	r29
	LI	r1, 1
	LI	r2, 0
	stw	r0, 52(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_create_array
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 56(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 60(r30)
	addi	r30, r30, 64
	bl	min_caml_create_float_array
	subi	r30, r30, 64
	lwz	r29, 60(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 60(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_create_float_array
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 64(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 68(r30)
	addi	r30, r30, 72
	bl	min_caml_create_float_array
	subi	r30, r30, 72
	lwz	r29, 68(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 68(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_create_float_array
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	LI	r1, 2
	LI	r2, 0
	stw	r0, 72(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	stw	r29, 76(r30)
	addi	r30, r30, 80
	bl	min_caml_create_array
	subi	r30, r30, 80
	lwz	r29, 76(r30)
	mtlr	r29
	LI	r1, 2
	LI	r2, 0
	stw	r0, 76(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_create_array
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	LI	r1, 1
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 80(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 84(r30)
	addi	r30, r30, 88
	bl	min_caml_create_float_array
	subi	r30, r30, 88
	lwz	r29, 84(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 84(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_create_float_array
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 88(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 92(r30)
	addi	r30, r30, 96
	bl	min_caml_create_float_array
	subi	r30, r30, 96
	lwz	r29, 92(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 92(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	min_caml_create_float_array
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 96(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 100(r30)
	addi	r30, r30, 104
	bl	min_caml_create_float_array
	subi	r30, r30, 104
	lwz	r29, 100(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 100(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	min_caml_create_float_array
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 104(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 108(r30)
	addi	r30, r30, 112
	bl	min_caml_create_float_array
	subi	r30, r30, 112
	lwz	r29, 108(r30)
	mtlr	r29
	LI	r1, 0
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 108(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	min_caml_create_float_array
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mr	r1, r0
	mtlr	r29
	LI	r0, 0
	stw	r1, 112(r30)
	mflr	r29
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	min_caml_create_array
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	LI	r1, 0
	MOV	r2, r28
	ADDI	r28, r28, 8
	SW	r0, 4(r2)
	lwz	r0, 112(r30)
	SW	r0, 0(r2)
	MOV	r0, r2
	mflr	r29
	mr	r26, r1
	mr	r1, r0
	mr	r0, r26
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	min_caml_create_array
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mr	r1, r0
	mtlr	r29
	LI	r0, 5
	mflr	r29
	stw	r29, 116(r30)
	addi	r30, r30, 120
	bl	min_caml_create_array
	subi	r30, r30, 120
	lwz	r29, 116(r30)
	mtlr	r29
	LI	r1, 0
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 116(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	min_caml_create_float_array
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	LI	r1, 3
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 120(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 124(r30)
	addi	r30, r30, 128
	bl	min_caml_create_float_array
	subi	r30, r30, 128
	lwz	r29, 124(r30)
	mtlr	r29
	LI	r1, 60
	lwz	r2, 120(r30)
	stw	r0, 124(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	stw	r29, 132(r30)
	addi	r30, r30, 136
	bl	min_caml_create_array
	subi	r30, r30, 136
	lwz	r29, 132(r30)
	mtlr	r29
	MOV	r1, r28
	ADDI	r28, r28, 8
	SW	r0, 4(r1)
	lwz	r0, 124(r30)
	SW	r0, 0(r1)
	MOV	r0, r1
	LI	r1, 0
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	stw	r0, 128(r30)
	mflr	r29
	mr	r0, r1
	stw	r29, 132(r30)
	addi	r30, r30, 136
	bl	min_caml_create_float_array
	subi	r30, r30, 136
	lwz	r29, 132(r30)
	mr	r1, r0
	mtlr	r29
	LI	r0, 0
	stw	r1, 132(r30)
	mflr	r29
	stw	r29, 140(r30)
	addi	r30, r30, 144
	bl	min_caml_create_array
	subi	r30, r30, 144
	lwz	r29, 140(r30)
	mtlr	r29
	MOV	r1, r28
	ADDI	r28, r28, 8
	SW	r0, 4(r1)
	lwz	r0, 132(r30)
	SW	r0, 0(r1)
	MOV	r0, r1
	LI	r1, 180
	LI	r2, 0
	lis	r29, ha16(l.6001)
	ADDI	r29, r29, lo16(l.6001)
	lfd	f0, 0(r29)
	MOV	r3, r28
	ADDI	r28, r28, 16
	stfd	f0, 8(r3)
	SW	r0, 4(r3)
	SW	r2, 0(r3)
	MOV	r0, r3
	mflr	r29
	mr	r26, r1
	mr	r1, r0
	mr	r0, r26
	stw	r29, 140(r30)
	addi	r30, r30, 144
	bl	min_caml_create_array
	subi	r30, r30, 144
	lwz	r29, 140(r30)
	mtlr	r29
	LI	r1, 1
	LI	r2, 0
	stw	r0, 136(r30)
	mflr	r29
	mr	r0, r1
	mr	r1, r2
	stw	r29, 140(r30)
	addi	r30, r30, 144
	bl	min_caml_create_array
	subi	r30, r30, 144
	lwz	r29, 140(r30)
	mtlr	r29
	MOV	r1, r28
	ADDI	r28, r28, 24
	lis	r2, ha16(read_screen_settings.2595)
	ADDI	r2, r2, lo16(read_screen_settings.2595)
	SW	r2, 0(r1)
	lwz	r2, 12(r30)
	SW	r2, 20(r1)
	lwz	r3, 104(r30)
	SW	r3, 16(r1)
	lwz	r4, 100(r30)
	SW	r4, 12(r1)
	lwz	r5, 96(r30)
	SW	r5, 8(r1)
	lwz	r6, 8(r30)
	SW	r6, 4(r1)
	MOV	r6, r28
	ADDI	r28, r28, 16
	lis	r7, ha16(read_light.2597)
	ADDI	r7, r7, lo16(read_light.2597)
	SW	r7, 0(r6)
	lwz	r7, 16(r30)
	SW	r7, 8(r6)
	lwz	r8, 20(r30)
	SW	r8, 4(r6)
	MOV	r9, r28
	ADDI	r28, r28, 8
	lis	r10, ha16(read_nth_object.2602)
	ADDI	r10, r10, lo16(read_nth_object.2602)
	SW	r10, 0(r9)
	lwz	r10, 4(r30)
	SW	r10, 4(r9)
	MOV	r11, r28
	ADDI	r28, r28, 16
	lis	r12, ha16(read_object.2604)
	ADDI	r12, r12, lo16(read_object.2604)
	SW	r12, 0(r11)
	SW	r9, 8(r11)
	lwz	r9, 0(r30)
	SW	r9, 4(r11)
	MOV	r12, r28
	ADDI	r28, r28, 8
	lis	r13, ha16(read_all_object.2606)
	ADDI	r13, r13, lo16(read_all_object.2606)
	SW	r13, 0(r12)
	SW	r11, 4(r12)
	MOV	r11, r28
	ADDI	r28, r28, 8
	lis	r13, ha16(read_and_network.2612)
	ADDI	r13, r13, lo16(read_and_network.2612)
	SW	r13, 0(r11)
	lwz	r13, 28(r30)
	SW	r13, 4(r11)
	MOV	r14, r28
	ADDI	r28, r28, 24
	lis	r15, ha16(read_parameter.2614)
	ADDI	r15, r15, lo16(read_parameter.2614)
	SW	r15, 0(r14)
	SW	r1, 20(r14)
	SW	r6, 16(r14)
	SW	r11, 12(r14)
	SW	r12, 8(r14)
	lwz	r1, 36(r30)
	SW	r1, 4(r14)
	MOV	r6, r28
	ADDI	r28, r28, 8
	lis	r11, ha16(solver_rect_surface.2616)
	ADDI	r11, r11, lo16(solver_rect_surface.2616)
	SW	r11, 0(r6)
	lwz	r11, 40(r30)
	SW	r11, 4(r6)
	MOV	r12, r28
	ADDI	r28, r28, 8
	lis	r15, ha16(solver_rect.2625)
	ADDI	r15, r15, lo16(solver_rect.2625)
	SW	r15, 0(r12)
	SW	r6, 4(r12)
	MOV	r6, r28
	ADDI	r28, r28, 8
	lis	r15, ha16(solver_surface.2631)
	ADDI	r15, r15, lo16(solver_surface.2631)
	SW	r15, 0(r6)
	SW	r11, 4(r6)
	MOV	r15, r28
	ADDI	r28, r28, 8
	lis	r16, ha16(solver_second.2650)
	ADDI	r16, r16, lo16(solver_second.2650)
	SW	r16, 0(r15)
	SW	r11, 4(r15)
	MOV	r16, r28
	ADDI	r28, r28, 24
	lis	r17, ha16(solver.2656)
	ADDI	r17, r17, lo16(solver.2656)
	SW	r17, 0(r16)
	SW	r6, 16(r16)
	SW	r15, 12(r16)
	SW	r12, 8(r16)
	SW	r10, 4(r16)
	MOV	r6, r28
	ADDI	r28, r28, 8
	lis	r12, ha16(solver_rect_fast.2660)
	ADDI	r12, r12, lo16(solver_rect_fast.2660)
	SW	r12, 0(r6)
	SW	r11, 4(r6)
	MOV	r12, r28
	ADDI	r28, r28, 8
	lis	r15, ha16(solver_surface_fast.2667)
	ADDI	r15, r15, lo16(solver_surface_fast.2667)
	SW	r15, 0(r12)
	SW	r11, 4(r12)
	MOV	r15, r28
	ADDI	r28, r28, 8
	lis	r17, ha16(solver_second_fast.2673)
	ADDI	r17, r17, lo16(solver_second_fast.2673)
	SW	r17, 0(r15)
	SW	r11, 4(r15)
	MOV	r17, r28
	ADDI	r28, r28, 24
	lis	r18, ha16(solver_fast.2679)
	ADDI	r18, r18, lo16(solver_fast.2679)
	SW	r18, 0(r17)
	SW	r12, 16(r17)
	SW	r15, 12(r17)
	SW	r6, 8(r17)
	SW	r10, 4(r17)
	MOV	r12, r28
	ADDI	r28, r28, 8
	lis	r15, ha16(solver_surface_fast2.2683)
	ADDI	r15, r15, lo16(solver_surface_fast2.2683)
	SW	r15, 0(r12)
	SW	r11, 4(r12)
	MOV	r15, r28
	ADDI	r28, r28, 8
	lis	r18, ha16(solver_second_fast2.2690)
	ADDI	r18, r18, lo16(solver_second_fast2.2690)
	SW	r18, 0(r15)
	SW	r11, 4(r15)
	MOV	r18, r28
	ADDI	r28, r28, 24
	lis	r19, ha16(solver_fast2.2697)
	ADDI	r19, r19, lo16(solver_fast2.2697)
	SW	r19, 0(r18)
	SW	r12, 16(r18)
	SW	r15, 12(r18)
	SW	r6, 8(r18)
	SW	r10, 4(r18)
	MOV	r6, r28
	ADDI	r28, r28, 8
	lis	r12, ha16(iter_setup_dirvec_constants.2709)
	ADDI	r12, r12, lo16(iter_setup_dirvec_constants.2709)
	SW	r12, 0(r6)
	SW	r10, 4(r6)
	MOV	r12, r28
	ADDI	r28, r28, 16
	lis	r15, ha16(setup_dirvec_constants.2712)
	ADDI	r15, r15, lo16(setup_dirvec_constants.2712)
	SW	r15, 0(r12)
	SW	r9, 8(r12)
	SW	r6, 4(r12)
	MOV	r6, r28
	ADDI	r28, r28, 8
	lis	r15, ha16(setup_startp_constants.2714)
	ADDI	r15, r15, lo16(setup_startp_constants.2714)
	SW	r15, 0(r6)
	SW	r10, 4(r6)
	MOV	r15, r28
	ADDI	r28, r28, 16
	lis	r19, ha16(setup_startp.2717)
	ADDI	r19, r19, lo16(setup_startp.2717)
	SW	r19, 0(r15)
	lwz	r19, 92(r30)
	SW	r19, 12(r15)
	SW	r6, 8(r15)
	SW	r9, 4(r15)
	MOV	r6, r28
	ADDI	r28, r28, 8
	lis	r20, ha16(check_all_inside.2739)
	ADDI	r20, r20, lo16(check_all_inside.2739)
	SW	r20, 0(r6)
	SW	r10, 4(r6)
	MOV	r20, r28
	ADDI	r28, r28, 32
	lis	r21, ha16(shadow_check_and_group.2745)
	ADDI	r21, r21, lo16(shadow_check_and_group.2745)
	SW	r21, 0(r20)
	SW	r17, 28(r20)
	SW	r11, 24(r20)
	SW	r10, 20(r20)
	lwz	r21, 128(r30)
	SW	r21, 16(r20)
	SW	r7, 12(r20)
	lwz	r22, 52(r30)
	SW	r22, 8(r20)
	SW	r6, 4(r20)
	MOV	r23, r28
	ADDI	r28, r28, 16
	lis	r24, ha16(shadow_check_one_or_group.2748)
	ADDI	r24, r24, lo16(shadow_check_one_or_group.2748)
	SW	r24, 0(r23)
	SW	r20, 8(r23)
	SW	r13, 4(r23)
	MOV	r20, r28
	ADDI	r28, r28, 24
	lis	r24, ha16(shadow_check_one_or_matrix.2751)
	ADDI	r24, r24, lo16(shadow_check_one_or_matrix.2751)
	SW	r24, 0(r20)
	SW	r17, 20(r20)
	SW	r11, 16(r20)
	SW	r23, 12(r20)
	SW	r21, 8(r20)
	SW	r22, 4(r20)
	MOV	r17, r28
	ADDI	r28, r28, 40
	lis	r23, ha16(solve_each_element.2754)
	ADDI	r23, r23, lo16(solve_each_element.2754)
	SW	r23, 0(r17)
	lwz	r23, 48(r30)
	SW	r23, 36(r17)
	lwz	r24, 88(r30)
	SW	r24, 32(r17)
	SW	r11, 28(r17)
	SW	r16, 24(r17)
	SW	r10, 20(r17)
	lwz	r25, 44(r30)
	SW	r25, 16(r17)
	SW	r22, 12(r17)
	lwz	r26, 56(r30)
	SW	r26, 8(r17)
	SW	r6, 4(r17)
	MOV	r27, r28
	ADDI	r28, r28, 16
	lis	r21, ha16(solve_one_or_network.2758)
	ADDI	r21, r21, lo16(solve_one_or_network.2758)
	SW	r21, 0(r27)
	SW	r17, 8(r27)
	SW	r13, 4(r27)
	MOV	r17, r28
	ADDI	r28, r28, 24
	lis	r21, ha16(trace_or_matrix.2762)
	ADDI	r21, r21, lo16(trace_or_matrix.2762)
	SW	r21, 0(r17)
	SW	r23, 20(r17)
	SW	r24, 16(r17)
	SW	r11, 12(r17)
	SW	r16, 8(r17)
	SW	r27, 4(r17)
	MOV	r16, r28
	ADDI	r28, r28, 16
	lis	r21, ha16(judge_intersection.2766)
	ADDI	r21, r21, lo16(judge_intersection.2766)
	SW	r21, 0(r16)
	SW	r17, 12(r16)
	SW	r23, 8(r16)
	SW	r1, 4(r16)
	MOV	r17, r28
	ADDI	r28, r28, 40
	lis	r21, ha16(solve_each_element_fast.2768)
	ADDI	r21, r21, lo16(solve_each_element_fast.2768)
	SW	r21, 0(r17)
	SW	r23, 36(r17)
	SW	r19, 32(r17)
	SW	r18, 28(r17)
	SW	r11, 24(r17)
	SW	r10, 20(r17)
	SW	r25, 16(r17)
	SW	r22, 12(r17)
	SW	r26, 8(r17)
	SW	r6, 4(r17)
	MOV	r6, r28
	ADDI	r28, r28, 16
	lis	r19, ha16(solve_one_or_network_fast.2772)
	ADDI	r19, r19, lo16(solve_one_or_network_fast.2772)
	SW	r19, 0(r6)
	SW	r17, 8(r6)
	SW	r13, 4(r6)
	MOV	r13, r28
	ADDI	r28, r28, 24
	lis	r17, ha16(trace_or_matrix_fast.2776)
	ADDI	r17, r17, lo16(trace_or_matrix_fast.2776)
	SW	r17, 0(r13)
	SW	r23, 16(r13)
	SW	r18, 12(r13)
	SW	r11, 8(r13)
	SW	r6, 4(r13)
	MOV	r6, r28
	ADDI	r28, r28, 16
	lis	r11, ha16(judge_intersection_fast.2780)
	ADDI	r11, r11, lo16(judge_intersection_fast.2780)
	SW	r11, 0(r6)
	SW	r13, 12(r6)
	SW	r23, 8(r6)
	SW	r1, 4(r6)
	MOV	r11, r28
	ADDI	r28, r28, 16
	lis	r13, ha16(get_nvector_rect.2782)
	ADDI	r13, r13, lo16(get_nvector_rect.2782)
	SW	r13, 0(r11)
	lwz	r13, 60(r30)
	SW	r13, 8(r11)
	SW	r25, 4(r11)
	MOV	r17, r28
	ADDI	r28, r28, 8
	lis	r18, ha16(get_nvector_plane.2784)
	ADDI	r18, r18, lo16(get_nvector_plane.2784)
	SW	r18, 0(r17)
	SW	r13, 4(r17)
	MOV	r18, r28
	ADDI	r28, r28, 16
	lis	r19, ha16(get_nvector_second.2786)
	ADDI	r19, r19, lo16(get_nvector_second.2786)
	SW	r19, 0(r18)
	SW	r13, 8(r18)
	SW	r22, 4(r18)
	MOV	r19, r28
	ADDI	r28, r28, 16
	lis	r21, ha16(get_nvector.2788)
	ADDI	r21, r21, lo16(get_nvector.2788)
	SW	r21, 0(r19)
	SW	r18, 12(r19)
	SW	r11, 8(r19)
	SW	r17, 4(r19)
	MOV	r11, r28
	ADDI	r28, r28, 8
	lis	r17, ha16(utexture.2791)
	ADDI	r17, r17, lo16(utexture.2791)
	SW	r17, 0(r11)
	lwz	r17, 64(r30)
	SW	r17, 4(r11)
	MOV	r18, r28
	ADDI	r28, r28, 16
	lis	r21, ha16(add_light.2794)
	ADDI	r21, r21, lo16(add_light.2794)
	SW	r21, 0(r18)
	SW	r17, 8(r18)
	lwz	r21, 72(r30)
	SW	r21, 4(r18)
	MOV	r27, r28
	ADDI	r28, r28, 40
	stw	r14, 140(r30)
	lis	r14, ha16(trace_reflections.2798)
	ADDI	r14, r14, lo16(trace_reflections.2798)
	SW	r14, 0(r27)
	SW	r20, 32(r27)
	lwz	r14, 136(r30)
	SW	r14, 28(r27)
	SW	r1, 24(r27)
	SW	r13, 20(r27)
	SW	r6, 16(r27)
	SW	r25, 12(r27)
	SW	r26, 8(r27)
	SW	r18, 4(r27)
	MOV	r14, r28
	ADDI	r28, r28, 88
	stw	r12, 144(r30)
	lis	r12, ha16(trace_ray.2803)
	ADDI	r12, r12, lo16(trace_ray.2803)
	SW	r12, 0(r14)
	SW	r11, 80(r14)
	SW	r27, 76(r14)
	SW	r23, 72(r14)
	SW	r17, 68(r14)
	SW	r24, 64(r14)
	SW	r20, 60(r14)
	SW	r15, 56(r14)
	SW	r21, 52(r14)
	SW	r1, 48(r14)
	SW	r10, 44(r14)
	SW	r13, 40(r14)
	SW	r0, 36(r14)
	SW	r7, 32(r14)
	SW	r16, 28(r14)
	SW	r25, 24(r14)
	SW	r22, 20(r14)
	SW	r26, 16(r14)
	SW	r19, 12(r14)
	SW	r8, 8(r14)
	SW	r18, 4(r14)
	MOV	r8, r28
	ADDI	r28, r28, 56
	lis	r12, ha16(trace_diffuse_ray.2809)
	ADDI	r12, r12, lo16(trace_diffuse_ray.2809)
	SW	r12, 0(r8)
	SW	r11, 48(r8)
	SW	r17, 44(r8)
	SW	r20, 40(r8)
	SW	r1, 36(r8)
	SW	r10, 32(r8)
	SW	r13, 28(r8)
	SW	r7, 24(r8)
	SW	r6, 20(r8)
	SW	r22, 16(r8)
	SW	r26, 12(r8)
	SW	r19, 8(r8)
	lwz	r1, 68(r30)
	SW	r1, 4(r8)
	MOV	r6, r28
	ADDI	r28, r28, 8
	lis	r11, ha16(iter_trace_diffuse_rays.2812)
	ADDI	r11, r11, lo16(iter_trace_diffuse_rays.2812)
	SW	r11, 0(r6)
	SW	r8, 4(r6)
	MOV	r8, r28
	ADDI	r28, r28, 16
	lis	r11, ha16(trace_diffuse_rays.2817)
	ADDI	r11, r11, lo16(trace_diffuse_rays.2817)
	SW	r11, 0(r8)
	SW	r15, 8(r8)
	SW	r6, 4(r8)
	MOV	r6, r28
	ADDI	r28, r28, 16
	lis	r11, ha16(trace_diffuse_ray_80percent.2821)
	ADDI	r11, r11, lo16(trace_diffuse_ray_80percent.2821)
	SW	r11, 0(r6)
	SW	r8, 8(r6)
	lwz	r11, 116(r30)
	SW	r11, 4(r6)
	MOV	r12, r28
	ADDI	r28, r28, 16
	lis	r13, ha16(calc_diffuse_using_1point.2825)
	ADDI	r13, r13, lo16(calc_diffuse_using_1point.2825)
	SW	r13, 0(r12)
	SW	r6, 12(r12)
	SW	r21, 8(r12)
	SW	r1, 4(r12)
	MOV	r6, r28
	ADDI	r28, r28, 16
	lis	r13, ha16(calc_diffuse_using_5points.2828)
	ADDI	r13, r13, lo16(calc_diffuse_using_5points.2828)
	SW	r13, 0(r6)
	SW	r21, 8(r6)
	SW	r1, 4(r6)
	MOV	r13, r28
	ADDI	r28, r28, 8
	lis	r15, ha16(do_without_neighbors.2834)
	ADDI	r15, r15, lo16(do_without_neighbors.2834)
	SW	r15, 0(r13)
	SW	r12, 4(r13)
	MOV	r12, r28
	ADDI	r28, r28, 8
	lis	r15, ha16(neighbors_exist.2837)
	ADDI	r15, r15, lo16(neighbors_exist.2837)
	SW	r15, 0(r12)
	lwz	r15, 76(r30)
	SW	r15, 4(r12)
	MOV	r16, r28
	ADDI	r28, r28, 16
	lis	r17, ha16(try_exploit_neighbors.2850)
	ADDI	r17, r17, lo16(try_exploit_neighbors.2850)
	SW	r17, 0(r16)
	SW	r13, 8(r16)
	SW	r6, 4(r16)
	MOV	r6, r28
	ADDI	r28, r28, 8
	lis	r17, ha16(write_ppm_header.2857)
	ADDI	r17, r17, lo16(write_ppm_header.2857)
	SW	r17, 0(r6)
	SW	r15, 4(r6)
	MOV	r17, r28
	ADDI	r28, r28, 8
	lis	r18, ha16(write_rgb.2861)
	ADDI	r18, r18, lo16(write_rgb.2861)
	SW	r18, 0(r17)
	SW	r21, 4(r17)
	MOV	r18, r28
	ADDI	r28, r28, 16
	lis	r19, ha16(pretrace_diffuse_rays.2863)
	ADDI	r19, r19, lo16(pretrace_diffuse_rays.2863)
	SW	r19, 0(r18)
	SW	r8, 12(r18)
	SW	r11, 8(r18)
	SW	r1, 4(r18)
	MOV	r1, r28
	ADDI	r28, r28, 40
	lis	r8, ha16(pretrace_pixels.2866)
	ADDI	r8, r8, lo16(pretrace_pixels.2866)
	SW	r8, 0(r1)
	SW	r2, 36(r1)
	SW	r14, 32(r1)
	SW	r24, 28(r1)
	SW	r5, 24(r1)
	lwz	r2, 84(r30)
	SW	r2, 20(r1)
	SW	r21, 16(r1)
	lwz	r5, 108(r30)
	SW	r5, 12(r1)
	SW	r18, 8(r1)
	lwz	r5, 80(r30)
	SW	r5, 4(r1)
	MOV	r8, r28
	ADDI	r28, r28, 32
	lis	r14, ha16(pretrace_line.2873)
	ADDI	r14, r14, lo16(pretrace_line.2873)
	SW	r14, 0(r8)
	SW	r3, 24(r8)
	SW	r4, 20(r8)
	SW	r2, 16(r8)
	SW	r1, 12(r8)
	SW	r15, 8(r8)
	SW	r5, 4(r8)
	MOV	r1, r28
	ADDI	r28, r28, 32
	lis	r3, ha16(scan_pixel.2877)
	ADDI	r3, r3, lo16(scan_pixel.2877)
	SW	r3, 0(r1)
	SW	r17, 24(r1)
	SW	r16, 20(r1)
	SW	r21, 16(r1)
	SW	r12, 12(r1)
	SW	r15, 8(r1)
	SW	r13, 4(r1)
	MOV	r3, r28
	ADDI	r28, r28, 16
	lis	r4, ha16(scan_line.2883)
	ADDI	r4, r4, lo16(scan_line.2883)
	SW	r4, 0(r3)
	SW	r1, 12(r3)
	SW	r8, 8(r3)
	SW	r15, 4(r3)
	MOV	r1, r28
	ADDI	r28, r28, 8
	lis	r4, ha16(create_pixelline.2896)
	ADDI	r4, r4, lo16(create_pixelline.2896)
	SW	r4, 0(r1)
	SW	r15, 4(r1)
	MOV	r4, r28
	ADDI	r28, r28, 8
	lis	r12, ha16(calc_dirvec.2903)
	ADDI	r12, r12, lo16(calc_dirvec.2903)
	SW	r12, 0(r4)
	SW	r11, 4(r4)
	MOV	r12, r28
	ADDI	r28, r28, 8
	lis	r13, ha16(calc_dirvecs.2911)
	ADDI	r13, r13, lo16(calc_dirvecs.2911)
	SW	r13, 0(r12)
	SW	r4, 4(r12)
	MOV	r4, r28
	ADDI	r28, r28, 8
	lis	r13, ha16(calc_dirvec_rows.2916)
	ADDI	r13, r13, lo16(calc_dirvec_rows.2916)
	SW	r13, 0(r4)
	SW	r12, 4(r4)
	MOV	r12, r28
	ADDI	r28, r28, 8
	lis	r13, ha16(create_dirvec.2920)
	ADDI	r13, r13, lo16(create_dirvec.2920)
	SW	r13, 0(r12)
	SW	r9, 4(r12)
	MOV	r13, r28
	ADDI	r28, r28, 8
	lis	r14, ha16(create_dirvec_elements.2922)
	ADDI	r14, r14, lo16(create_dirvec_elements.2922)
	SW	r14, 0(r13)
	SW	r12, 4(r13)
	MOV	r14, r28
	ADDI	r28, r28, 16
	lis	r16, ha16(create_dirvecs.2925)
	ADDI	r16, r16, lo16(create_dirvecs.2925)
	SW	r16, 0(r14)
	SW	r11, 12(r14)
	SW	r13, 8(r14)
	SW	r12, 4(r14)
	MOV	r13, r28
	ADDI	r28, r28, 8
	lis	r16, ha16(init_dirvec_constants.2927)
	ADDI	r16, r16, lo16(init_dirvec_constants.2927)
	SW	r16, 0(r13)
	lwz	r16, 144(r30)
	SW	r16, 4(r13)
	MOV	r17, r28
	ADDI	r28, r28, 16
	lis	r18, ha16(init_vecset_constants.2930)
	ADDI	r18, r18, lo16(init_vecset_constants.2930)
	SW	r18, 0(r17)
	SW	r13, 8(r17)
	SW	r11, 4(r17)
	MOV	r11, r28
	ADDI	r28, r28, 16
	lis	r13, ha16(init_dirvecs.2932)
	ADDI	r13, r13, lo16(init_dirvecs.2932)
	SW	r13, 0(r11)
	SW	r17, 12(r11)
	SW	r14, 8(r11)
	SW	r4, 4(r11)
	MOV	r4, r28
	ADDI	r28, r28, 16
	lis	r13, ha16(add_reflection.2934)
	ADDI	r13, r13, lo16(add_reflection.2934)
	SW	r13, 0(r4)
	SW	r16, 12(r4)
	lwz	r13, 136(r30)
	SW	r13, 8(r4)
	SW	r12, 4(r4)
	MOV	r12, r28
	ADDI	r28, r28, 16
	lis	r13, ha16(setup_rect_reflection.2941)
	ADDI	r13, r13, lo16(setup_rect_reflection.2941)
	SW	r13, 0(r12)
	SW	r0, 12(r12)
	SW	r7, 8(r12)
	SW	r4, 4(r12)
	MOV	r13, r28
	ADDI	r28, r28, 16
	lis	r14, ha16(setup_surface_reflection.2944)
	ADDI	r14, r14, lo16(setup_surface_reflection.2944)
	SW	r14, 0(r13)
	SW	r0, 12(r13)
	SW	r7, 8(r13)
	SW	r4, 4(r13)
	MOV	r0, r28
	ADDI	r28, r28, 16
	lis	r4, ha16(setup_reflections.2947)
	ADDI	r4, r4, lo16(setup_reflections.2947)
	SW	r4, 0(r0)
	SW	r13, 12(r0)
	SW	r12, 8(r0)
	SW	r10, 4(r0)
	MOV	r27, r28
	ADDI	r28, r28, 64
	lis	r4, ha16(rt.2949)
	ADDI	r4, r4, lo16(rt.2949)
	SW	r4, 0(r27)
	SW	r6, 56(r27)
	SW	r0, 52(r27)
	SW	r16, 48(r27)
	SW	r2, 44(r27)
	SW	r3, 40(r27)
	lwz	r0, 140(r30)
	SW	r0, 36(r27)
	SW	r8, 32(r27)
	SW	r9, 28(r27)
	lwz	r0, 128(r30)
	SW	r0, 24(r27)
	SW	r7, 20(r27)
	SW	r11, 16(r27)
	SW	r15, 12(r27)
	SW	r5, 8(r27)
	SW	r1, 4(r27)
	LI	r0, 512
	LI	r1, 512
	mflr	r29
	stw	r29, 148(r30)
	addi	r30, r30, 152
	lwz	r29, 0(r27)
	mtctr	r29
	bctrl
	subi	r30, r30, 152
	lwz	r29, 148(r30)
	mtlr	r29
   # main program end
	lwz	r1, 0(r1)
	lwz	r0, 8(r1)
	mtlr	r0
	lmw	r30, -8(r1)
	blr
