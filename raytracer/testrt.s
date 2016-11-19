	.data
l.6616:	 # 128.000000
	.word	1124073472
l.6583:	 # 0.900000
	.word	1063675494
l.6582:	 # 0.200000
	.word	1045220557
l.6488:	 # 150.000000
	.word	1125515264
l.6486:	 # -150.000000
	.word	-1021968384
l.6470:	 # 0.100000
	.word	1036831949
l.6467:	 # -2.000000
	.word	-1073741824
l.6465:	 # 256.000000
	.word	1132462080
l.6443:	 # 20.000000
	.word	1101004800
l.6442:	 # 0.050000
	.word	1028443341
l.6438:	 # 0.250000
	.word	1048576000
l.6434:	 # 10.000000
	.word	1092616192
l.6430:	 # 0.300000
	.word	1050253722
l.6429:	 # 255.000000
	.word	1132396544
l.6428:	 # 0.500000
	.word	1056964608
l.6427:	 # 0.150000
	.word	1041865114
l.6425:	 # 3.141593
	.word	1078530011
l.6424:	 # 30.000000
	.word	1106247680
l.6423:	 # 15.000000
	.word	1097859072
l.6422:	 # 0.000100
	.word	953267991
l.6379:	 # 100000000.000000
	.word	1287568416
l.6375:	 # 1000000000.000000
	.word	1315859240
l.6355:	 # -0.100000
	.word	-1110651699
l.6342:	 # 0.010000
	.word	1008981770
l.6341:	 # -0.200000
	.word	-1102263091
l.6150:	 # 2.000000
	.word	1073741824
l.6116:	 # -200.000000
	.word	-1018691584
l.6114:	 # 200.000000
	.word	1128792064
l.6110:	 # 0.017453
	.word	1016003125
l.6003:	 # -1.000000
	.word	-1082130432
l.6002:	 # 1.000000
	.word	1065353216
l.6001:	 # 0.000000
	.word	0
	.text
	.globl  _min_caml_start
xor.2465:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8689
	ADDI	%r1, %r2, 0
	JR	%r31
BEQ_else.8689:
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.8690
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8690:
	ADDI	%r1, %r0, 0
	JR	%r31
sgn.2468:
	SWC1	%f1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8691
	LWC1	%f1, 0(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8692
	LA	%r29, l.6003
	LWC1	%f1, 0(%r29)
	JR	%r31
BEQ_else.8692:
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	JR	%r31
BEQ_else.8691:
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	JR	%r31
fneg_cond.2470:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8693
	J	min_caml_fneg
BEQ_else.8693:
	JR	%r31
add_mod5.2473:
	ADD	%r1, %r1, %r2
	ADDI	%r27, %r0, 5
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8694
	ADDI	%r1, %r1, -5
	JR	%r31
BEQ_else.8694:
	JR	%r31
vecset.2476:
	SWC1	%f1, 0(%r1)
	SWC1	%f2, 4(%r1)
	SWC1	%f3, 8(%r1)
	JR	%r31
vecfill.2481:
	SWC1	%f1, 0(%r1)
	SWC1	%f1, 4(%r1)
	SWC1	%f1, 8(%r1)
	JR	%r31
vecbzero.2484:
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	J	vecfill.2481
veccpy.2486:
	LWC1	%f1, 0(%r2)
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 4(%r2)
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 8(%r2)
	SWC1	%f1, 8(%r1)
	JR	%r31
vecdist2.2489:
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 0(%r2)
	SUB.s	%f1, %f1, %f2
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	LWC1	%f3, 4(%r2)
	SUB.s	%f2, %f2, %f3
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 0(%r30) # restore1
	LWC1	%f3, 8(%r1)
	SUB.s	%f2, %f2, %f3
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
vecunit.2492:
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 0(%r1)
	SWC1	%f1, 0(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 0(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LWC1	%f2, 4(%r1)
	MUL.s	%f2, %f2, %f1
	SWC1	%f2, 4(%r1)
	LWC1	%f2, 8(%r1)
	MUL.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	JR	%r31
vecunit_sgn.2494:
	LWC1	%f1, 0(%r1)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8700
	LW	%r1, 0(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8702
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 24(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	J	BEQ_cont.8703
BEQ_else.8702:
	LA	%r29, l.6003
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 24(%r30) # restore2
	DIV.s	%f1, %f1, %f2
BEQ_cont.8703:
	J	BEQ_cont.8701
BEQ_else.8700:
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
BEQ_cont.8701:
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LWC1	%f2, 4(%r1)
	MUL.s	%f2, %f2, %f1
	SWC1	%f2, 4(%r1)
	LWC1	%f2, 8(%r1)
	MUL.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	JR	%r31
veciprod.2497:
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 0(%r2)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 4(%r2)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	LWC1	%f2, 8(%r1)
	LWC1	%f3, 8(%r2)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	JR	%r31
veciprod2.2500:
	LWC1	%f4, 0(%r1)
	MUL.s	%f1, %f4, %f1
	LWC1	%f4, 4(%r1)
	MUL.s	%f2, %f4, %f2
	ADD.s	%f1, %f1, %f2
	LWC1	%f2, 8(%r1)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	JR	%r31
vecaccum.2505:
	LWC1	%f2, 0(%r1)
	LWC1	%f3, 0(%r2)
	MUL.s	%f3, %f1, %f3
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 0(%r1)
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 4(%r2)
	MUL.s	%f3, %f1, %f3
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 4(%r1)
	LWC1	%f2, 8(%r1)
	LWC1	%f3, 8(%r2)
	MUL.s	%f1, %f1, %f3
	ADD.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	JR	%r31
vecadd.2509:
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 0(%r2)
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 4(%r1)
	LWC1	%f2, 4(%r2)
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 8(%r1)
	LWC1	%f2, 8(%r2)
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	JR	%r31
vecmul.2512:
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 0(%r2)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 4(%r1)
	LWC1	%f2, 4(%r2)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 8(%r1)
	LWC1	%f2, 8(%r2)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	JR	%r31
vecscale.2515:
	LWC1	%f2, 0(%r1)
	MUL.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LWC1	%f2, 4(%r1)
	MUL.s	%f2, %f2, %f1
	SWC1	%f2, 4(%r1)
	LWC1	%f2, 8(%r1)
	MUL.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	JR	%r31
vecaccumv.2518:
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 0(%r2)
	LWC1	%f3, 0(%r3)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 4(%r1)
	LWC1	%f2, 4(%r2)
	LWC1	%f3, 4(%r3)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 8(%r1)
	LWC1	%f2, 8(%r2)
	LWC1	%f3, 8(%r3)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	JR	%r31
o_texturetype.2522:
	LW	%r1, 0(%r1)
	JR	%r31
o_form.2524:
	LW	%r1, 4(%r1)
	JR	%r31
o_reflectiontype.2526:
	LW	%r1, 8(%r1)
	JR	%r31
o_isinvert.2528:
	LW	%r1, 24(%r1)
	JR	%r31
o_isrot.2530:
	LW	%r1, 12(%r1)
	JR	%r31
o_param_a.2532:
	LW	%r1, 16(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_b.2534:
	LW	%r1, 16(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_c.2536:
	LW	%r1, 16(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_param_abc.2538:
	LW	%r1, 16(%r1)
	JR	%r31
o_param_x.2540:
	LW	%r1, 20(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_y.2542:
	LW	%r1, 20(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_z.2544:
	LW	%r1, 20(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_diffuse.2546:
	LW	%r1, 28(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_hilight.2548:
	LW	%r1, 28(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_color_red.2550:
	LW	%r1, 32(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_color_green.2552:
	LW	%r1, 32(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_color_blue.2554:
	LW	%r1, 32(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_param_r1.2556:
	LW	%r1, 36(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_r2.2558:
	LW	%r1, 36(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_r3.2560:
	LW	%r1, 36(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_param_ctbl.2562:
	LW	%r1, 40(%r1)
	JR	%r31
p_rgb.2564:
	LW	%r1, 0(%r1)
	JR	%r31
p_intersection_points.2566:
	LW	%r1, 4(%r1)
	JR	%r31
p_surface_ids.2568:
	LW	%r1, 8(%r1)
	JR	%r31
p_calc_diffuse.2570:
	LW	%r1, 12(%r1)
	JR	%r31
p_energy.2572:
	LW	%r1, 16(%r1)
	JR	%r31
p_received_ray_20percent.2574:
	LW	%r1, 20(%r1)
	JR	%r31
p_group_id.2576:
	LW	%r1, 24(%r1)
	LW	%r1, 0(%r1)
	JR	%r31
p_set_group_id.2578:
	LW	%r1, 24(%r1)
	SW	%r2, 0(%r1)
	JR	%r31
p_nvectors.2581:
	LW	%r1, 28(%r1)
	JR	%r31
d_vec.2583:
	LW	%r1, 0(%r1)
	JR	%r31
d_const.2585:
	LW	%r1, 4(%r1)
	JR	%r31
r_surface_id.2587:
	LW	%r1, 0(%r1)
	JR	%r31
r_dvec.2589:
	LW	%r1, 4(%r1)
	JR	%r31
r_bright.2591:
	LWC1	%f1, 8(%r1)
	JR	%r31
rad.2593:
	LA	%r29, l.6110
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	JR	%r31
read_screen_settings.2595:
	LW	%r1, 20(%r26)
	LW	%r2, 16(%r26)
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SW	%r1, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r2, 12(%r30)
	SW	%r5, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	rad.2593
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_cos
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_sin
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	rad.2593
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	min_caml_cos
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_sin
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	MUL.s	%f3, %f2, %f1
	LA	%r29, l.6114
	LWC1	%f4, 0(%r29)
	MUL.s	%f3, %f3, %f4
	LW	%r1, 12(%r30) # restore1
	SWC1	%f3, 0(%r1)
	LA	%r29, l.6116
	LWC1	%f3, 0(%r29)
	LWC1	%f4, 40(%r30) # restore2
	MUL.s	%f3, %f4, %f3
	SWC1	%f3, 4(%r1)
	LWC1	%f3, 56(%r30) # restore2
	MUL.s	%f5, %f2, %f3
	LA	%r29, l.6114
	LWC1	%f6, 0(%r29)
	MUL.s	%f5, %f5, %f6
	SWC1	%f5, 8(%r1)
	LW	%r2, 8(%r30) # restore1
	SWC1	%f3, 0(%r2)
	LA	%r29, l.6001
	LWC1	%f5, 0(%r29)
	SWC1	%f5, 4(%r2)
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LWC1	%f1, 40(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 32(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 40(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r1, 16(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r2, 12(%r30) # restore1
	LWC1	%f2, 0(%r2)
	SUB.s	%f1, %f1, %f2
	LW	%r3, 0(%r30) # restore1
	SWC1	%f1, 0(%r3)
	LWC1	%f1, 4(%r1)
	LWC1	%f2, 4(%r2)
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r3)
	LWC1	%f1, 8(%r1)
	LWC1	%f2, 8(%r2)
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r3)
	JR	%r31
read_light.2597:
	LW	%r1, 8(%r26)
	LW	%r2, 4(%r26)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	rad.2593
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_sin
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	rad.2593
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	min_caml_cos
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_sin
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 16(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_cos
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	JR	%r31
rotate_quadratic_matrix.2599:
	LWC1	%f1, 0(%r2)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_cos
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_sin
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	min_caml_cos
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_sin
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_cos
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_sin
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 24(%r30) # restore2
	MUL.s	%f4, %f3, %f2
	LWC1	%f5, 32(%r30) # restore2
	LWC1	%f6, 16(%r30) # restore2
	MUL.s	%f7, %f6, %f5
	MUL.s	%f7, %f7, %f2
	LWC1	%f8, 8(%r30) # restore2
	MUL.s	%f9, %f8, %f1
	SUB.s	%f7, %f7, %f9
	MUL.s	%f9, %f8, %f5
	MUL.s	%f9, %f9, %f2
	MUL.s	%f10, %f6, %f1
	ADD.s	%f9, %f9, %f10
	MUL.s	%f10, %f3, %f1
	MUL.s	%f11, %f6, %f5
	MUL.s	%f11, %f11, %f1
	MUL.s	%f12, %f8, %f2
	ADD.s	%f11, %f11, %f12
	MUL.s	%f12, %f8, %f5
	MUL.s	%f1, %f12, %f1
	MUL.s	%f2, %f6, %f2
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 48(%r30)
	SWC1	%f9, 56(%r30)
	SWC1	%f11, 64(%r30)
	SWC1	%f7, 72(%r30)
	SWC1	%f10, 80(%r30)
	SWC1	%f4, 88(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f5, %f0 # args
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	LWC1	%f3, 16(%r30) # restore2
	MUL.s	%f3, %f3, %f2
	LWC1	%f4, 8(%r30) # restore2
	MUL.s	%f2, %f4, %f2
	LW	%r1, 0(%r30) # restore1
	LWC1	%f4, 0(%r1)
	LWC1	%f5, 4(%r1)
	LWC1	%f6, 8(%r1)
	LWC1	%f7, 88(%r30) # restore2
	SWC1	%f2, 96(%r30)
	SWC1	%f3, 104(%r30)
	SWC1	%f6, 112(%r30)
	SWC1	%f1, 120(%r30)
	SWC1	%f5, 128(%r30)
	SWC1	%f4, 136(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f7, %f0 # args
	SW	%r29, 144(%r30) # save link register
	ADDI	%r30, %r30, 148
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 148
	SUB	%r30, %r30, %r29
	LW	%r29, 144(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 80(%r30) # restore2
	SWC1	%f1, 144(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 152(%r30) # save link register
	ADDI	%r30, %r30, 156
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 156
	SUB	%r30, %r30, %r29
	LW	%r29, 152(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 144(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LWC1	%f3, 120(%r30) # restore2
	SWC1	%f1, 152(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 160(%r30) # save link register
	ADDI	%r30, %r30, 164
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 164
	SUB	%r30, %r30, %r29
	LW	%r29, 160(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 152(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 72(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 160(%r30) # save link register
	ADDI	%r30, %r30, 164
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 164
	SUB	%r30, %r30, %r29
	LW	%r29, 160(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 64(%r30) # restore2
	SWC1	%f1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 168(%r30) # save link register
	ADDI	%r30, %r30, 172
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 172
	SUB	%r30, %r30, %r29
	LW	%r29, 168(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 160(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LWC1	%f3, 104(%r30) # restore2
	SWC1	%f1, 168(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 176(%r30) # save link register
	ADDI	%r30, %r30, 180
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 180
	SUB	%r30, %r30, %r29
	LW	%r29, 176(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 168(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 56(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 176(%r30) # save link register
	ADDI	%r30, %r30, 180
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 180
	SUB	%r30, %r30, %r29
	LW	%r29, 176(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 48(%r30) # restore2
	SWC1	%f1, 176(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 184(%r30) # save link register
	ADDI	%r30, %r30, 188
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 188
	SUB	%r30, %r30, %r29
	LW	%r29, 184(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 176(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LWC1	%f3, 96(%r30) # restore2
	SWC1	%f1, 184(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 192(%r30) # save link register
	ADDI	%r30, %r30, 196
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 196
	SUB	%r30, %r30, %r29
	LW	%r29, 192(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 184(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LA	%r29, l.6150
	LWC1	%f1, 0(%r29)
	LWC1	%f3, 72(%r30) # restore2
	LWC1	%f4, 136(%r30) # restore2
	MUL.s	%f5, %f4, %f3
	LWC1	%f6, 56(%r30) # restore2
	MUL.s	%f5, %f5, %f6
	LWC1	%f7, 64(%r30) # restore2
	LWC1	%f8, 128(%r30) # restore2
	MUL.s	%f9, %f8, %f7
	LWC1	%f10, 48(%r30) # restore2
	MUL.s	%f9, %f9, %f10
	ADD.s	%f5, %f5, %f9
	LWC1	%f9, 104(%r30) # restore2
	MUL.s	%f11, %f2, %f9
	LWC1	%f12, 96(%r30) # restore2
	MUL.s	%f11, %f11, %f12
	ADD.s	%f5, %f5, %f11
	MUL.s	%f1, %f1, %f5
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r29, l.6150
	LWC1	%f1, 0(%r29)
	LWC1	%f5, 88(%r30) # restore2
	MUL.s	%f11, %f4, %f5
	MUL.s	%f6, %f11, %f6
	LWC1	%f11, 80(%r30) # restore2
	MUL.s	%f13, %f8, %f11
	MUL.s	%f10, %f13, %f10
	ADD.s	%f6, %f6, %f10
	LWC1	%f10, 120(%r30) # restore2
	MUL.s	%f13, %f2, %f10
	MUL.s	%f12, %f13, %f12
	ADD.s	%f6, %f6, %f12
	MUL.s	%f1, %f1, %f6
	SWC1	%f1, 4(%r1)
	LA	%r29, l.6150
	LWC1	%f1, 0(%r29)
	MUL.s	%f4, %f4, %f5
	MUL.s	%f3, %f4, %f3
	MUL.s	%f4, %f8, %f11
	MUL.s	%f4, %f4, %f7
	ADD.s	%f3, %f3, %f4
	MUL.s	%f2, %f2, %f10
	MUL.s	%f2, %f2, %f9
	ADD.s	%f2, %f3, %f2
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	JR	%r31
read_nth_object.2602:
	LW	%r2, 4(%r26)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	SUB	%r29, %r0, %r2
	ADDI	%r2, %r29, 0
	BNE	%r1, %r2, BEQ_else.8715
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8715:
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 2
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 36(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 36(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 36(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 40(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 40(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 40(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.8716
	J	BEQ_cont.8717
BEQ_else.8716:
	SW	%r1, 44(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	rad.2593
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	rad.2593
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	rad.2593
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 8(%r1)
BEQ_cont.8717:
	LW	%r2, 12(%r30) # restore1
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.8718
	ADDI	%r3, %r0, 1
	J	BEQ_cont.8719
BEQ_else.8718:
	LW	%r3, 32(%r30) # restore1
BEQ_cont.8719:
	ADDI	%r4, %r0, 4
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r3, 48(%r30)
	SW	%r1, 44(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 48
	SW	%r1, 40(%r2)
	LW	%r1, 44(%r30) # restore1
	SW	%r1, 36(%r2)
	LW	%r3, 40(%r30) # restore1
	SW	%r3, 32(%r2)
	LW	%r3, 36(%r30) # restore1
	SW	%r3, 28(%r2)
	LW	%r3, 48(%r30) # restore1
	SW	%r3, 24(%r2)
	LW	%r3, 28(%r30) # restore1
	SW	%r3, 20(%r2)
	LW	%r3, 24(%r30) # restore1
	SW	%r3, 16(%r2)
	LW	%r4, 20(%r30) # restore1
	SW	%r4, 12(%r2)
	LW	%r5, 16(%r30) # restore1
	SW	%r5, 8(%r2)
	LW	%r5, 12(%r30) # restore1
	SW	%r5, 4(%r2)
	LW	%r6, 8(%r30) # restore1
	SW	%r6, 0(%r2)
	LW	%r6, 4(%r30) # restore1
	SLL	%r6, %r6, 2
	LW	%r7, 0(%r30) # restore1
	ADD	%r29, %r7, %r6
	SW	%r2, 0(%r29)
	ADDI	%r27, %r0, 3
	BNE	%r5, %r27, BEQ_else.8720
	LWC1	%f1, 0(%r3)
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8723
	LWC1	%f1, 56(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	sgn.2468
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.8724
BEQ_else.8723:
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
BEQ_cont.8724:
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 4(%r1)
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8725
	LWC1	%f1, 72(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	sgn.2468
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.8726
BEQ_else.8725:
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
BEQ_cont.8726:
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 8(%r1)
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8727
	LWC1	%f1, 88(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	sgn.2468
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.8728
BEQ_else.8727:
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
BEQ_cont.8728:
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 8(%r1)
	J	BEQ_cont.8721
BEQ_else.8720:
	ADDI	%r27, %r0, 2
	BNE	%r5, %r27, BEQ_else.8729
	LW	%r2, 32(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.8731
	ADDI	%r2, %r0, 1
	J	BEQ_cont.8732
BEQ_else.8731:
	ADDI	%r2, %r0, 0
BEQ_cont.8732:
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	vecunit_sgn.2494
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8730
BEQ_else.8729:
BEQ_cont.8730:
BEQ_cont.8721:
	LW	%r1, 20(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8733
	J	BEQ_cont.8734
BEQ_else.8733:
	LW	%r1, 24(%r30) # restore1
	LW	%r2, 44(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	rotate_quadratic_matrix.2599
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8734:
	ADDI	%r1, %r0, 1
	JR	%r31
read_object.2604:
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 60
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8735
	JR	%r31
BEQ_else.8735:
	SW	%r26, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r26, %r2, 0 # args
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8737
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	SW	%r2, 0(%r1)
	JR	%r31
BEQ_else.8737:
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
read_all_object.2606:
	LW	%r26, 4(%r26)
	ADDI	%r1, %r0, 0
	LW	%r25, 0(%r26)
	JR	%r25
read_net_item.2608:
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	SUB	%r29, %r0, %r2
	ADDI	%r2, %r29, 0
	BNE	%r1, %r2, BEQ_else.8739
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	ADDI	%r2, %r0, 1
	SUB	%r29, %r0, %r2
	ADDI	%r2, %r29, 0
	J	min_caml_create_array
BEQ_else.8739:
	LW	%r2, 0(%r30) # restore1
	ADDI	%r3, %r2, 1
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	read_net_item.2608
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SLL	%r2, %r2, 2
	LW	%r3, 4(%r30) # restore1
	ADD	%r29, %r1, %r2
	SW	%r3, 0(%r29)
	JR	%r31
read_or_network.2610:
	ADDI	%r2, %r0, 0
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_net_item.2608
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r2)
	ADDI	%r3, %r0, 1
	SUB	%r29, %r0, %r3
	ADDI	%r3, %r29, 0
	BNE	%r1, %r3, BEQ_else.8740
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	J	min_caml_create_array
BEQ_else.8740:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r3, %r1, 1
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	read_or_network.2610
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SLL	%r2, %r2, 2
	LW	%r3, 4(%r30) # restore1
	ADD	%r29, %r1, %r2
	SW	%r3, 0(%r29)
	JR	%r31
read_and_network.2612:
	LW	%r2, 4(%r26)
	ADDI	%r3, %r0, 0
	SW	%r26, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	read_net_item.2608
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r1)
	ADDI	%r3, %r0, 1
	SUB	%r29, %r0, %r3
	ADDI	%r3, %r29, 0
	BNE	%r2, %r3, BEQ_else.8741
	JR	%r31
BEQ_else.8741:
	LW	%r2, 8(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 4(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	ADDI	%r1, %r2, 1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
read_parameter.2614:
	LW	%r1, 20(%r26)
	LW	%r2, 16(%r26)
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SW	%r5, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r2, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r26, %r1, 0 # args
	SW	%r29, 16(%r30)
	ADDI	%r30, %r30, 20
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30)
	ADDI	%r30, %r30, 20
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30)
	ADDI	%r30, %r30, 20
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30)
	ADDI	%r30, %r30, 20
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	read_or_network.2610
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 0(%r2)
	JR	%r31
solver_rect_surface.2616:
	LW	%r6, 4(%r26)
	SLL	%r7, %r3, 2
	ADD	%r29, %r2, %r7
	LWC1	%f4, 0(%r29)
	SW	%r6, 0(%r30)
	SWC1	%f3, 8(%r30)
	SW	%r5, 16(%r30)
	SWC1	%f2, 24(%r30)
	SW	%r4, 32(%r30)
	SWC1	%f1, 40(%r30)
	SW	%r2, 48(%r30)
	SW	%r3, 52(%r30)
	SW	%r1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f4, %f0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8747
	LW	%r1, 56(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_abc.2538
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 56(%r30) # restore1
	SW	%r1, 60(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 52(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 48(%r30) # restore1
	ADD	%r29, %r4, %r3
	LWC1	%f1, 0(%r29)
	SW	%r1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 64(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	xor.2465
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 52(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 60(%r30) # restore1
	ADD	%r29, %r4, %r3
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	fneg_cond.2470
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f1, %f2
	LW	%r1, 52(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 48(%r30) # restore1
	ADD	%r29, %r2, %r1
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	LW	%r1, 32(%r30) # restore1
	SLL	%r3, %r1, 2
	ADD	%r29, %r2, %r3
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	LWC1	%f3, 24(%r30) # restore2
	ADD.s	%f2, %f2, %f3
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 60(%r30) # restore1
	ADD	%r29, %r2, %r1
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_fless
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8749
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8749:
	LW	%r1, 16(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 48(%r30) # restore1
	ADD	%r29, %r3, %r2
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 72(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 8(%r30) # restore2
	ADD.s	%f1, %f1, %f3
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 60(%r30) # restore1
	ADD	%r29, %r2, %r1
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_fless
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8750
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8750:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 72(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8747:
	ADDI	%r1, %r0, 0
	JR	%r31
solver_rect.2625:
	LW	%r26, 4(%r26)
	ADDI	%r3, %r0, 0
	ADDI	%r4, %r0, 1
	ADDI	%r5, %r0, 2
	SWC1	%f1, 0(%r30)
	SWC1	%f3, 8(%r30)
	SWC1	%f2, 16(%r30)
	SW	%r2, 24(%r30)
	SW	%r1, 28(%r30)
	SW	%r26, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8751
	ADDI	%r3, %r0, 1
	ADDI	%r4, %r0, 2
	ADDI	%r5, %r0, 0
	LWC1	%f1, 16(%r30) # restore2
	LWC1	%f2, 8(%r30) # restore2
	LWC1	%f3, 0(%r30) # restore2
	LW	%r1, 28(%r30) # restore1
	LW	%r2, 24(%r30) # restore1
	LW	%r26, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8752
	ADDI	%r3, %r0, 2
	ADDI	%r4, %r0, 0
	ADDI	%r5, %r0, 1
	LWC1	%f1, 8(%r30) # restore2
	LWC1	%f2, 0(%r30) # restore2
	LWC1	%f3, 16(%r30) # restore2
	LW	%r1, 28(%r30) # restore1
	LW	%r2, 24(%r30) # restore1
	LW	%r26, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8753
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8753:
	ADDI	%r1, %r0, 3
	JR	%r31
BEQ_else.8752:
	ADDI	%r1, %r0, 2
	JR	%r31
BEQ_else.8751:
	ADDI	%r1, %r0, 1
	JR	%r31
solver_surface.2631:
	LW	%r3, 4(%r26)
	SW	%r3, 0(%r30)
	SWC1	%f3, 8(%r30)
	SWC1	%f2, 16(%r30)
	SWC1	%f1, 24(%r30)
	SW	%r2, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_abc.2538
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SW	%r2, 36(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	veciprod.2497
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8755
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8755:
	LWC1	%f1, 24(%r30) # restore2
	LWC1	%f2, 16(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	LW	%r1, 36(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	veciprod2.2500
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
quadratic.2637:
	SWC1	%f1, 0(%r30)
	SWC1	%f3, 8(%r30)
	SWC1	%f2, 16(%r30)
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 16(%r30) # restore2
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LWC1	%f2, 8(%r30) # restore2
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 56(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	o_isrot.2530
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8757
	LWC1	%f1, 72(%r30) # restore2
	JR	%r31
BEQ_else.8757:
	LWC1	%f1, 8(%r30) # restore2
	LWC1	%f2, 16(%r30) # restore2
	MUL.s	%f3, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	SWC1	%f3, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	o_param_r1.2556
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 72(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LWC1	%f2, 0(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	MUL.s	%f3, %f3, %f2
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 88(%r30)
	SWC1	%f3, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	o_param_r2.2558
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 88(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LWC1	%f2, 16(%r30) # restore2
	LWC1	%f3, 0(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 104(%r30)
	SWC1	%f2, 112(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 120(%r30) # save link register
	ADDI	%r30, %r30, 124
	JAL	o_param_r3.2560
	ADDI	%r29, %r0, 124
	SUB	%r30, %r30, %r29
	LW	%r29, 120(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 104(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
bilinear.2642:
	MUL.s	%f7, %f1, %f4
	SWC1	%f4, 0(%r30)
	SWC1	%f1, 8(%r30)
	SWC1	%f6, 16(%r30)
	SWC1	%f3, 24(%r30)
	SW	%r1, 32(%r30)
	SWC1	%f5, 40(%r30)
	SWC1	%f2, 48(%r30)
	SWC1	%f7, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	MUL.s	%f4, %f3, %f2
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 64(%r30)
	SWC1	%f4, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 64(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LWC1	%f2, 16(%r30) # restore2
	LWC1	%f3, 24(%r30) # restore2
	MUL.s	%f4, %f3, %f2
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 80(%r30)
	SWC1	%f4, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 80(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	o_isrot.2530
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8759
	LWC1	%f1, 96(%r30) # restore2
	JR	%r31
BEQ_else.8759:
	LWC1	%f1, 40(%r30) # restore2
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f3, %f2, %f1
	LWC1	%f4, 16(%r30) # restore2
	LWC1	%f5, 48(%r30) # restore2
	MUL.s	%f6, %f5, %f4
	ADD.s	%f3, %f3, %f6
	LW	%r1, 32(%r30) # restore1
	SWC1	%f3, 104(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	o_param_r1.2556
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 104(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 16(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LWC1	%f4, 0(%r30) # restore2
	LWC1	%f5, 24(%r30) # restore2
	MUL.s	%f5, %f5, %f4
	ADD.s	%f2, %f2, %f5
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 112(%r30)
	SWC1	%f2, 120(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 128(%r30) # save link register
	ADDI	%r30, %r30, 132
	JAL	o_param_r2.2558
	ADDI	%r29, %r0, 132
	SUB	%r30, %r30, %r29
	LW	%r29, 128(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 120(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 112(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LWC1	%f3, 0(%r30) # restore2
	LWC1	%f4, 48(%r30) # restore2
	MUL.s	%f3, %f4, %f3
	ADD.s	%f2, %f2, %f3
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 128(%r30)
	SWC1	%f2, 136(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 144(%r30) # save link register
	ADDI	%r30, %r30, 148
	JAL	o_param_r3.2560
	ADDI	%r29, %r0, 148
	SUB	%r30, %r30, %r29
	LW	%r29, 144(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 128(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 144(%r30) # save link register
	ADDI	%r30, %r30, 148
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 148
	SUB	%r30, %r30, %r29
	LW	%r29, 144(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
solver_second.2650:
	LW	%r3, 4(%r26)
	LWC1	%f4, 0(%r2)
	LWC1	%f5, 4(%r2)
	LWC1	%f6, 8(%r2)
	SW	%r3, 0(%r30)
	SWC1	%f3, 8(%r30)
	SWC1	%f2, 16(%r30)
	SWC1	%f1, 24(%r30)
	SW	%r1, 32(%r30)
	SW	%r2, 36(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f3, %f6, %f0 # args
	ADD.s	%f2, %f5, %f0 # args
	ADD.s	%f1, %f4, %f0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	quadratic.2637
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8761
	LW	%r1, 36(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 8(%r1)
	LWC1	%f4, 24(%r30) # restore2
	LWC1	%f5, 16(%r30) # restore2
	LWC1	%f6, 8(%r30) # restore2
	LW	%r1, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	bilinear.2642
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	LWC1	%f3, 16(%r30) # restore2
	LWC1	%f4, 8(%r30) # restore2
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	ADD.s	%f2, %f3, %f0 # args
	ADD.s	%f3, %f4, %f0 # args
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	quadratic.2637
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_form.2524
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.8762
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	J	BEQ_cont.8763
BEQ_else.8762:
	LWC1	%f1, 56(%r30) # restore2
BEQ_cont.8763:
	LWC1	%f2, 48(%r30) # restore2
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	LWC1	%f3, 40(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8764
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8764:
	LWC1	%f1, 72(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8765
	LWC1	%f1, 80(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8766
BEQ_else.8765:
	LWC1	%f1, 80(%r30) # restore2
BEQ_cont.8766:
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f1, %f2
	LWC1	%f2, 40(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8761:
	ADDI	%r1, %r0, 0
	JR	%r31
solver.2656:
	LW	%r4, 16(%r26)
	LW	%r5, 12(%r26)
	LW	%r6, 8(%r26)
	LW	%r7, 4(%r26)
	SLL	%r1, %r1, 2
	ADD	%r29, %r7, %r1
	LW	%r1, 0(%r29)
	LWC1	%f1, 0(%r3)
	SW	%r5, 0(%r30)
	SW	%r4, 4(%r30)
	SW	%r2, 8(%r30)
	SW	%r6, 12(%r30)
	SW	%r1, 16(%r30)
	SW	%r3, 20(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	o_param_x.2540
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 20(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 16(%r30) # restore1
	SWC1	%f1, 32(%r30)
	SWC1	%f2, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	o_param_y.2542
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 20(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 48(%r30)
	SWC1	%f2, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_param_z.2544
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	o_form.2524
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8767
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 48(%r30) # restore2
	LWC1	%f3, 64(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8767:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8768
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 48(%r30) # restore2
	LWC1	%f3, 64(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8768:
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 48(%r30) # restore2
	LWC1	%f3, 64(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
solver_rect_fast.2660:
	LW	%r4, 4(%r26)
	LWC1	%f4, 0(%r3)
	SUB.s	%f4, %f4, %f1
	LWC1	%f5, 4(%r3)
	MUL.s	%f4, %f4, %f5
	LWC1	%f5, 4(%r2)
	MUL.s	%f5, %f4, %f5
	ADD.s	%f5, %f5, %f2
	SW	%r4, 0(%r30)
	SWC1	%f1, 8(%r30)
	SWC1	%f2, 16(%r30)
	SW	%r3, 24(%r30)
	SWC1	%f3, 32(%r30)
	SWC1	%f4, 40(%r30)
	SW	%r2, 48(%r30)
	SW	%r1, 52(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f5, %f0 # args
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 56(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fless
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8771
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8772
BEQ_else.8771:
	LW	%r1, 48(%r30) # restore1
	LWC1	%f1, 8(%r1)
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 32(%r30) # restore2
	ADD.s	%f1, %f1, %f3
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 64(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fless
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8773
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8774
BEQ_else.8773:
	LW	%r1, 24(%r30) # restore1
	LWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8775
	ADDI	%r1, %r0, 1
	J	BEQ_cont.8776
BEQ_else.8775:
	ADDI	%r1, %r0, 0
BEQ_cont.8776:
BEQ_cont.8774:
BEQ_cont.8772:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8777
	LW	%r1, 24(%r30) # restore1
	LWC1	%f1, 8(%r1)
	LWC1	%f2, 16(%r30) # restore2
	SUB.s	%f1, %f1, %f2
	LWC1	%f3, 12(%r1)
	MUL.s	%f1, %f1, %f3
	LW	%r2, 48(%r30) # restore1
	LWC1	%f3, 0(%r2)
	MUL.s	%f3, %f1, %f3
	LWC1	%f4, 8(%r30) # restore2
	ADD.s	%f3, %f3, %f4
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 80(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_fless
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8778
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8779
BEQ_else.8778:
	LW	%r1, 48(%r30) # restore1
	LWC1	%f1, 8(%r1)
	LWC1	%f2, 72(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 32(%r30) # restore2
	ADD.s	%f1, %f1, %f3
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 88(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	min_caml_fless
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8780
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8781
BEQ_else.8780:
	LW	%r1, 24(%r30) # restore1
	LWC1	%f1, 12(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8782
	ADDI	%r1, %r0, 1
	J	BEQ_cont.8783
BEQ_else.8782:
	ADDI	%r1, %r0, 0
BEQ_cont.8783:
BEQ_cont.8781:
BEQ_cont.8779:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8784
	LW	%r1, 24(%r30) # restore1
	LWC1	%f1, 16(%r1)
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f1, %f2
	LWC1	%f2, 20(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r2, 48(%r30) # restore1
	LWC1	%f2, 0(%r2)
	MUL.s	%f2, %f1, %f2
	LWC1	%f3, 8(%r30) # restore2
	ADD.s	%f2, %f2, %f3
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 104(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	min_caml_fless
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8785
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8786
BEQ_else.8785:
	LW	%r1, 48(%r30) # restore1
	LWC1	%f1, 4(%r1)
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 16(%r30) # restore2
	ADD.s	%f1, %f1, %f3
	ADDI	%r29, %r31, 0
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 112(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 120(%r30) # save link register
	ADDI	%r30, %r30, 124
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 124
	SUB	%r30, %r30, %r29
	LW	%r29, 120(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 112(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 120(%r30) # save link register
	ADDI	%r30, %r30, 124
	JAL	min_caml_fless
	ADDI	%r29, %r0, 124
	SUB	%r30, %r30, %r29
	LW	%r29, 120(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8787
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8788
BEQ_else.8787:
	LW	%r1, 24(%r30) # restore1
	LWC1	%f1, 20(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 120(%r30) # save link register
	ADDI	%r30, %r30, 124
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 124
	SUB	%r30, %r30, %r29
	LW	%r29, 120(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8789
	ADDI	%r1, %r0, 1
	J	BEQ_cont.8790
BEQ_else.8789:
	ADDI	%r1, %r0, 0
BEQ_cont.8790:
BEQ_cont.8788:
BEQ_cont.8786:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8791
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8791:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 96(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 3
	JR	%r31
BEQ_else.8784:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 72(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 2
	JR	%r31
BEQ_else.8777:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 40(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
solver_surface_fast.2667:
	LW	%r1, 4(%r26)
	LWC1	%f4, 0(%r2)
	SW	%r1, 0(%r30)
	SWC1	%f3, 8(%r30)
	SWC1	%f2, 16(%r30)
	SWC1	%f1, 24(%r30)
	SW	%r2, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f4, %f0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8793
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8793:
	LW	%r1, 32(%r30) # restore1
	LWC1	%f1, 4(%r1)
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 8(%r1)
	LWC1	%f3, 16(%r30) # restore2
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	LWC1	%f2, 12(%r1)
	LWC1	%f3, 8(%r30) # restore2
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
solver_second_fast.2673:
	LW	%r3, 4(%r26)
	LWC1	%f4, 0(%r2)
	SW	%r3, 0(%r30)
	SWC1	%f4, 8(%r30)
	SW	%r1, 16(%r30)
	SWC1	%f3, 24(%r30)
	SWC1	%f2, 32(%r30)
	SWC1	%f1, 40(%r30)
	SW	%r2, 48(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f4, %f0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8796
	LW	%r1, 48(%r30) # restore1
	LWC1	%f1, 4(%r1)
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LWC1	%f3, 8(%r1)
	LWC1	%f4, 32(%r30) # restore2
	MUL.s	%f3, %f3, %f4
	ADD.s	%f1, %f1, %f3
	LWC1	%f3, 12(%r1)
	LWC1	%f5, 24(%r30) # restore2
	MUL.s	%f3, %f3, %f5
	ADD.s	%f1, %f1, %f3
	LW	%r2, 16(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADD.s	%f3, %f5, %f0 # args
	ADD.s	%f1, %f2, %f0 # args
	ADD.s	%f2, %f4, %f0 # args
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	quadratic.2637
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	o_form.2524
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.8798
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 64(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	J	BEQ_cont.8799
BEQ_else.8798:
	LWC1	%f1, 64(%r30) # restore2
BEQ_cont.8799:
	LWC1	%f2, 56(%r30) # restore2
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8800
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8800:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8801
	LWC1	%f1, 80(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 48(%r30) # restore1
	LWC1	%f2, 16(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	J	BEQ_cont.8802
BEQ_else.8801:
	LWC1	%f1, 80(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 48(%r30) # restore1
	LWC1	%f2, 16(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
BEQ_cont.8802:
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8796:
	ADDI	%r1, %r0, 0
	JR	%r31
solver_fast.2679:
	LW	%r4, 16(%r26)
	LW	%r5, 12(%r26)
	LW	%r6, 8(%r26)
	LW	%r7, 4(%r26)
	SLL	%r8, %r1, 2
	ADD	%r29, %r7, %r8
	LW	%r7, 0(%r29)
	LWC1	%f1, 0(%r3)
	SW	%r5, 0(%r30)
	SW	%r4, 4(%r30)
	SW	%r6, 8(%r30)
	SW	%r1, 12(%r30)
	SW	%r2, 16(%r30)
	SW	%r7, 20(%r30)
	SW	%r3, 24(%r30)
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r7, 0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	o_param_x.2540
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 20(%r30) # restore1
	SWC1	%f1, 40(%r30)
	SWC1	%f2, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	o_param_y.2542
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 56(%r30)
	SWC1	%f2, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	o_param_z.2544
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	d_const.2585
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SLL	%r2, %r2, 2
	ADD	%r29, %r1, %r2
	LW	%r1, 0(%r29)
	LW	%r2, 20(%r30) # restore1
	SW	%r1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_form.2524
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8804
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	d_vec.2583
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 40(%r30) # restore2
	LWC1	%f2, 56(%r30) # restore2
	LWC1	%f3, 72(%r30) # restore2
	LW	%r1, 20(%r30) # restore1
	LW	%r3, 80(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8804:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8805
	LWC1	%f1, 40(%r30) # restore2
	LWC1	%f2, 56(%r30) # restore2
	LWC1	%f3, 72(%r30) # restore2
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 80(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8805:
	LWC1	%f1, 40(%r30) # restore2
	LWC1	%f2, 56(%r30) # restore2
	LWC1	%f3, 72(%r30) # restore2
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 80(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
solver_surface_fast2.2683:
	LW	%r1, 4(%r26)
	LWC1	%f1, 0(%r2)
	SW	%r1, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r2, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8806
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8806:
	LW	%r1, 8(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 12(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
solver_second_fast2.2690:
	LW	%r4, 4(%r26)
	LWC1	%f4, 0(%r2)
	SW	%r4, 0(%r30)
	SW	%r1, 4(%r30)
	SWC1	%f4, 8(%r30)
	SW	%r3, 16(%r30)
	SWC1	%f3, 24(%r30)
	SWC1	%f2, 32(%r30)
	SWC1	%f1, 40(%r30)
	SW	%r2, 48(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f4, %f0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8808
	LW	%r1, 48(%r30) # restore1
	LWC1	%f1, 4(%r1)
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 8(%r1)
	LWC1	%f3, 32(%r30) # restore2
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	LWC1	%f2, 12(%r1)
	LWC1	%f3, 24(%r30) # restore2
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	LW	%r2, 16(%r30) # restore1
	LWC1	%f2, 12(%r2)
	SWC1	%f1, 56(%r30)
	SWC1	%f2, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8810
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8810:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8811
	LWC1	%f1, 72(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 48(%r30) # restore1
	LWC1	%f2, 16(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	J	BEQ_cont.8812
BEQ_else.8811:
	LWC1	%f1, 72(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 48(%r30) # restore1
	LWC1	%f2, 16(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
BEQ_cont.8812:
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8808:
	ADDI	%r1, %r0, 0
	JR	%r31
solver_fast2.2697:
	LW	%r3, 16(%r26)
	LW	%r4, 12(%r26)
	LW	%r5, 8(%r26)
	LW	%r6, 4(%r26)
	SLL	%r7, %r1, 2
	ADD	%r29, %r6, %r7
	LW	%r6, 0(%r29)
	SW	%r4, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r5, 8(%r30)
	SW	%r6, 12(%r30)
	SW	%r1, 16(%r30)
	SW	%r2, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r6, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	o_param_ctbl.2562
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 8(%r1)
	LW	%r2, 20(%r30) # restore1
	SW	%r1, 24(%r30)
	SWC1	%f3, 32(%r30)
	SWC1	%f2, 40(%r30)
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	d_const.2585
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SLL	%r2, %r2, 2
	ADD	%r29, %r1, %r2
	LW	%r1, 0(%r29)
	LW	%r2, 12(%r30) # restore1
	SW	%r1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_form.2524
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8814
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	d_vec.2583
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 48(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 32(%r30) # restore2
	LW	%r1, 12(%r30) # restore1
	LW	%r3, 56(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8814:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8815
	LWC1	%f1, 48(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 32(%r30) # restore2
	LW	%r1, 12(%r30) # restore1
	LW	%r2, 56(%r30) # restore1
	LW	%r3, 24(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8815:
	LWC1	%f1, 48(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 32(%r30) # restore2
	LW	%r1, 12(%r30) # restore1
	LW	%r2, 56(%r30) # restore1
	LW	%r3, 24(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
setup_rect_table.2700:
	ADDI	%r3, %r0, 6
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 0(%r2)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8816
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 0(%r2)
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	xor.2465
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	fneg_cond.2470
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f2, 0(%r2)
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r1)
	J	BEQ_cont.8817
BEQ_else.8816:
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 4(%r1)
BEQ_cont.8817:
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 4(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8818
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 4(%r2)
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	xor.2465
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	fneg_cond.2470
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f2, 4(%r2)
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 12(%r1)
	J	BEQ_cont.8819
BEQ_else.8818:
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 12(%r1)
BEQ_cont.8819:
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 8(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8820
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 8(%r2)
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	xor.2465
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	fneg_cond.2470
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 16(%r1)
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f2, 8(%r2)
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 20(%r1)
	J	BEQ_cont.8821
BEQ_else.8820:
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 20(%r1)
BEQ_cont.8821:
	JR	%r31
setup_surface_table.2703:
	ADDI	%r3, %r0, 4
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 0(%r30) # restore1
	SW	%r1, 8(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 24(%r30)
	SWC1	%f2, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 24(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 40(%r30)
	SWC1	%f2, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8823
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 0(%r1)
	J	BEQ_cont.8824
BEQ_else.8823:
	LA	%r29, l.6003
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 56(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 12(%r1)
BEQ_cont.8824:
	JR	%r31
setup_second_table.2706:
	ADDI	%r3, %r0, 5
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LWC1	%f2, 4(%r2)
	LWC1	%f3, 8(%r2)
	LW	%r3, 0(%r30) # restore1
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	quadratic.2637
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	SWC1	%f2, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 32(%r30)
	SWC1	%f2, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 48(%r30)
	SWC1	%f2, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 16(%r30) # restore2
	SWC1	%f2, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	o_isrot.2530
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8826
	LW	%r1, 8(%r30) # restore1
	LWC1	%f1, 32(%r30) # restore2
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 48(%r30) # restore2
	SWC1	%f1, 8(%r1)
	LWC1	%f1, 64(%r30) # restore2
	SWC1	%f1, 12(%r1)
	J	BEQ_cont.8827
BEQ_else.8826:
	LW	%r1, 4(%r30) # restore1
	LWC1	%f1, 8(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	o_param_r2.2558
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 80(%r30)
	SWC1	%f2, 88(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	o_param_r3.2560
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 80(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r3, 0(%r30) # restore1
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	o_param_r1.2556
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 104(%r30)
	SWC1	%f2, 112(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 120(%r30) # save link register
	ADDI	%r30, %r30, 124
	JAL	o_param_r3.2560
	ADDI	%r29, %r0, 124
	SUB	%r30, %r30, %r29
	LW	%r29, 120(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 104(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 120(%r30) # save link register
	ADDI	%r30, %r30, 124
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 124
	SUB	%r30, %r30, %r29
	LW	%r29, 120(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LW	%r3, 0(%r30) # restore1
	SWC1	%f1, 120(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 128(%r30) # save link register
	ADDI	%r30, %r30, 132
	JAL	o_param_r1.2556
	ADDI	%r29, %r0, 132
	SUB	%r30, %r30, %r29
	LW	%r29, 128(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 120(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 128(%r30)
	SWC1	%f2, 136(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 144(%r30) # save link register
	ADDI	%r30, %r30, 148
	JAL	o_param_r2.2558
	ADDI	%r29, %r0, 148
	SUB	%r30, %r30, %r29
	LW	%r29, 144(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 128(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 144(%r30) # save link register
	ADDI	%r30, %r30, 148
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 148
	SUB	%r30, %r30, %r29
	LW	%r29, 144(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 12(%r1)
BEQ_cont.8827:
	LWC1	%f1, 16(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 144(%r30) # save link register
	ADDI	%r30, %r30, 148
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 148
	SUB	%r30, %r30, %r29
	LW	%r29, 144(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8828
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 16(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 16(%r1)
	J	BEQ_cont.8829
BEQ_else.8828:
BEQ_cont.8829:
	LW	%r1, 8(%r30) # restore1
	JR	%r31
iter_setup_dirvec_constants.2709:
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.8830
	SLL	%r4, %r2, 2
	ADD	%r29, %r3, %r4
	LW	%r3, 0(%r29)
	SW	%r26, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r3, 8(%r30)
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	d_const.2585
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	d_vec.2583
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 8(%r30) # restore1
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	o_form.2524
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8831
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	setup_rect_table.2700
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	J	BEQ_cont.8832
BEQ_else.8831:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8833
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	setup_surface_table.2703
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	J	BEQ_cont.8834
BEQ_else.8833:
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	setup_second_table.2706
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
BEQ_cont.8834:
BEQ_cont.8832:
	ADDI	%r2, %r2, -1
	LW	%r1, 12(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8830:
	JR	%r31
setup_dirvec_constants.2712:
	LW	%r2, 8(%r26)
	LW	%r26, 4(%r26)
	LW	%r2, 0(%r2)
	ADDI	%r2, %r2, -1
	LW	%r25, 0(%r26)
	JR	%r25
setup_startp_constants.2714:
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.8836
	SLL	%r4, %r2, 2
	ADD	%r29, %r3, %r4
	LW	%r3, 0(%r29)
	SW	%r26, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	SW	%r3, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	o_param_ctbl.2562
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_form.2524
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 8(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 12(%r30) # restore1
	SW	%r1, 20(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	o_param_x.2540
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 8(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LW	%r3, 12(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	o_param_y.2542
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 8(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r3, 12(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	o_param_z.2544
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r2, 20(%r30) # restore1
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.8837
	LW	%r2, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	o_param_abc.2538
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LWC1	%f2, 4(%r2)
	LWC1	%f3, 8(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	veciprod2.2500
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 12(%r1)
	J	BEQ_cont.8838
BEQ_else.8837:
	ADDI	%r27, %r0, 2
	SLT	%r27, %r27, %r2
	BNE	%r27, %r0, BEQ_else.8839
	J	BEQ_cont.8840
BEQ_else.8839:
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 8(%r1)
	LW	%r3, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	quadratic.2637
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.8841
	LA	%r29, l.6002
	LWC1	%f2, 0(%r29)
	SUB.s	%f1, %f1, %f2
	J	BEQ_cont.8842
BEQ_else.8841:
BEQ_cont.8842:
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 12(%r1)
BEQ_cont.8840:
BEQ_cont.8838:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r2, %r1, -1
	LW	%r1, 8(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8836:
	JR	%r31
setup_startp.2717:
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	SW	%r1, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r4, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r25, %r2, 0 # args
	ADDI	%r2, %r1, 0 # args
	ADDI	%r1, %r25, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	veccpy.2486
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	LW	%r1, 0(%r1)
	ADDI	%r2, %r1, -1
	LW	%r1, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
is_rect_outside.2719:
	SWC1	%f3, 0(%r30)
	SWC1	%f2, 8(%r30)
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 24(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fless
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8845
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8846
BEQ_else.8845:
	LWC1	%f1, 8(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 32(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_fless
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8847
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8848
BEQ_else.8847:
	LWC1	%f1, 0(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 40(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_fless
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8848:
BEQ_cont.8846:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8849
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8850
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8850:
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8849:
	LW	%r1, 16(%r30) # restore1
	J	o_isinvert.2528
is_plane_outside.2724:
	SW	%r1, 0(%r30)
	SWC1	%f3, 8(%r30)
	SWC1	%f2, 16(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	o_param_abc.2538
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 24(%r30) # restore2
	LWC1	%f2, 16(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	veciprod2.2500
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 32(%r30) # restore2
	SW	%r1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 40(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	xor.2465
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8852
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8852:
	ADDI	%r1, %r0, 0
	JR	%r31
is_second_outside.2729:
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	quadratic.2637
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	o_form.2524
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.8854
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 8(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	J	BEQ_cont.8855
BEQ_else.8854:
	LWC1	%f1, 8(%r30) # restore2
BEQ_cont.8855:
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 16(%r30) # restore2
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	xor.2465
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8856
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8856:
	ADDI	%r1, %r0, 0
	JR	%r31
is_outside.2734:
	SWC1	%f3, 0(%r30)
	SWC1	%f2, 8(%r30)
	SW	%r1, 16(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	o_param_x.2540
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	o_param_y.2542
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	o_param_z.2544
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 0(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	o_form.2524
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8858
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	J	is_rect_outside.2719
BEQ_else.8858:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8859
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	J	is_plane_outside.2724
BEQ_else.8859:
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	J	is_second_outside.2729
check_all_inside.2739:
	LW	%r3, 4(%r26)
	SLL	%r4, %r1, 2
	ADD	%r29, %r2, %r4
	LW	%r4, 0(%r29)
	ADDI	%r5, %r0, 1
	SUB	%r29, %r0, %r5
	ADDI	%r5, %r29, 0
	BNE	%r4, %r5, BEQ_else.8860
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8860:
	SLL	%r4, %r4, 2
	ADD	%r29, %r3, %r4
	LW	%r3, 0(%r29)
	SWC1	%f3, 0(%r30)
	SWC1	%f2, 8(%r30)
	SWC1	%f1, 16(%r30)
	SW	%r2, 24(%r30)
	SW	%r26, 28(%r30)
	SW	%r1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	is_outside.2734
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8861
	LW	%r1, 32(%r30) # restore1
	ADDI	%r1, %r1, 1
	LWC1	%f1, 16(%r30) # restore2
	LWC1	%f2, 8(%r30) # restore2
	LWC1	%f3, 0(%r30) # restore2
	LW	%r2, 24(%r30) # restore1
	LW	%r26, 28(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8861:
	ADDI	%r1, %r0, 0
	JR	%r31
shadow_check_and_group.2745:
	LW	%r3, 28(%r26)
	LW	%r4, 24(%r26)
	LW	%r5, 20(%r26)
	LW	%r6, 16(%r26)
	LW	%r7, 12(%r26)
	LW	%r8, 8(%r26)
	LW	%r9, 4(%r26)
	SLL	%r10, %r1, 2
	ADD	%r29, %r2, %r10
	LW	%r10, 0(%r29)
	ADDI	%r11, %r0, 1
	SUB	%r29, %r0, %r11
	ADDI	%r11, %r29, 0
	BNE	%r10, %r11, BEQ_else.8862
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8862:
	SLL	%r10, %r1, 2
	ADD	%r29, %r2, %r10
	LW	%r10, 0(%r29)
	SW	%r9, 0(%r30)
	SW	%r8, 4(%r30)
	SW	%r7, 8(%r30)
	SW	%r2, 12(%r30)
	SW	%r26, 16(%r30)
	SW	%r1, 20(%r30)
	SW	%r5, 24(%r30)
	SW	%r10, 28(%r30)
	SW	%r4, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r6, 0 # args
	ADDI	%r1, %r10, 0 # args
	ADDI	%r26, %r3, 0 # args
	ADDI	%r3, %r8, 0 # args
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 32(%r30) # restore1
	LWC1	%f1, 0(%r2)
	SWC1	%f1, 40(%r30)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8864
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8865
BEQ_else.8864:
	LA	%r29, l.6341
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_fless
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8865:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8866
	LW	%r1, 28(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 24(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8867
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8867:
	LW	%r1, 20(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 12(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8866:
	LA	%r29, l.6342
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 40(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f2, %f2, %f1
	LW	%r2, 4(%r30) # restore1
	LWC1	%f3, 0(%r2)
	ADD.s	%f2, %f2, %f3
	LWC1	%f3, 4(%r1)
	MUL.s	%f3, %f3, %f1
	LWC1	%f4, 4(%r2)
	ADD.s	%f3, %f3, %f4
	LWC1	%f4, 8(%r1)
	MUL.s	%f1, %f4, %f1
	LWC1	%f4, 8(%r2)
	ADD.s	%f1, %f1, %f4
	ADDI	%r1, %r0, 0
	LW	%r2, 12(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADD.s	%f31, %f3, %f0 # args
	ADD.s	%f3, %f1, %f0 # args
	ADD.s	%f1, %f2, %f0 # args
	ADD.s	%f2, %f31, %f0 # args
	SW	%r29, 48(%r30)
	ADDI	%r30, %r30, 52
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8868
	LW	%r1, 20(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 12(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8868:
	ADDI	%r1, %r0, 1
	JR	%r31
shadow_check_one_or_group.2748:
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	SLL	%r5, %r1, 2
	ADD	%r29, %r2, %r5
	LW	%r5, 0(%r29)
	ADDI	%r6, %r0, 1
	SUB	%r29, %r0, %r6
	ADDI	%r6, %r29, 0
	BNE	%r5, %r6, BEQ_else.8869
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8869:
	SLL	%r5, %r5, 2
	ADD	%r29, %r4, %r5
	LW	%r4, 0(%r29)
	ADDI	%r5, %r0, 0
	SW	%r2, 0(%r30)
	SW	%r26, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r5, 0 # args
	ADDI	%r26, %r3, 0 # args
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8870
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8870:
	ADDI	%r1, %r0, 1
	JR	%r31
shadow_check_one_or_matrix.2751:
	LW	%r3, 20(%r26)
	LW	%r4, 16(%r26)
	LW	%r5, 12(%r26)
	LW	%r6, 8(%r26)
	LW	%r7, 4(%r26)
	SLL	%r8, %r1, 2
	ADD	%r29, %r2, %r8
	LW	%r8, 0(%r29)
	LW	%r9, 0(%r8)
	ADDI	%r10, %r0, 1
	SUB	%r29, %r0, %r10
	ADDI	%r10, %r29, 0
	BNE	%r9, %r10, BEQ_else.8871
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8871:
	SW	%r8, 0(%r30)
	SW	%r5, 4(%r30)
	SW	%r2, 8(%r30)
	SW	%r26, 12(%r30)
	SW	%r1, 16(%r30)
	ADDI	%r27, %r0, 99
	BNE	%r9, %r27, BEQ_else.8872
	ADDI	%r1, %r0, 1
	J	BEQ_cont.8873
BEQ_else.8872:
	SW	%r4, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r6, 0 # args
	ADDI	%r1, %r9, 0 # args
	ADDI	%r26, %r3, 0 # args
	ADDI	%r3, %r7, 0 # args
	SW	%r29, 24(%r30)
	ADDI	%r30, %r30, 28
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8874
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8875
BEQ_else.8874:
	LW	%r1, 20(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LA	%r29, l.6355
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	min_caml_fless
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8876
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8877
BEQ_else.8876:
	ADDI	%r1, %r0, 1
	LW	%r2, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30)
	ADDI	%r30, %r30, 28
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8878
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8879
BEQ_else.8878:
	ADDI	%r1, %r0, 1
BEQ_cont.8879:
BEQ_cont.8877:
BEQ_cont.8875:
BEQ_cont.8873:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8880
	LW	%r1, 16(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8880:
	ADDI	%r1, %r0, 1
	LW	%r2, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30)
	ADDI	%r30, %r30, 28
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8881
	LW	%r1, 16(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8881:
	ADDI	%r1, %r0, 1
	JR	%r31
solve_each_element.2754:
	LW	%r4, 36(%r26)
	LW	%r5, 32(%r26)
	LW	%r6, 28(%r26)
	LW	%r7, 24(%r26)
	LW	%r8, 20(%r26)
	LW	%r9, 16(%r26)
	LW	%r10, 12(%r26)
	LW	%r11, 8(%r26)
	LW	%r12, 4(%r26)
	SLL	%r13, %r1, 2
	ADD	%r29, %r2, %r13
	LW	%r13, 0(%r29)
	ADDI	%r14, %r0, 1
	SUB	%r29, %r0, %r14
	ADDI	%r14, %r29, 0
	BNE	%r13, %r14, BEQ_else.8882
	JR	%r31
BEQ_else.8882:
	SW	%r9, 0(%r30)
	SW	%r11, 4(%r30)
	SW	%r10, 8(%r30)
	SW	%r12, 12(%r30)
	SW	%r5, 16(%r30)
	SW	%r4, 20(%r30)
	SW	%r6, 24(%r30)
	SW	%r3, 28(%r30)
	SW	%r2, 32(%r30)
	SW	%r26, 36(%r30)
	SW	%r1, 40(%r30)
	SW	%r8, 44(%r30)
	SW	%r13, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r13, 0 # args
	ADDI	%r26, %r7, 0 # args
	ADDI	%r3, %r5, 0 # args
	SW	%r29, 52(%r30)
	ADDI	%r30, %r30, 56
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8884
	LW	%r1, 48(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 44(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8885
	JR	%r31
BEQ_else.8885:
	LW	%r1, 40(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 32(%r30) # restore1
	LW	%r3, 28(%r30) # restore1
	LW	%r26, 36(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8884:
	LW	%r2, 24(%r30) # restore1
	LWC1	%f2, 0(%r2)
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 52(%r30)
	SWC1	%f2, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fless
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8887
	J	BEQ_cont.8888
BEQ_else.8887:
	LW	%r1, 20(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LWC1	%f1, 56(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_fless
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8889
	J	BEQ_cont.8890
BEQ_else.8889:
	LA	%r29, l.6342
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 56(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 28(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f2, %f2, %f1
	LW	%r2, 16(%r30) # restore1
	LWC1	%f3, 0(%r2)
	ADD.s	%f2, %f2, %f3
	LWC1	%f3, 4(%r1)
	MUL.s	%f3, %f3, %f1
	LWC1	%f4, 4(%r2)
	ADD.s	%f3, %f3, %f4
	LWC1	%f4, 8(%r1)
	MUL.s	%f4, %f4, %f1
	LWC1	%f5, 8(%r2)
	ADD.s	%f4, %f4, %f5
	ADDI	%r2, %r0, 0
	LW	%r3, 32(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	SWC1	%f4, 64(%r30)
	SWC1	%f3, 72(%r30)
	SWC1	%f2, 80(%r30)
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	ADD.s	%f1, %f2, %f0 # args
	ADD.s	%f2, %f3, %f0 # args
	ADD.s	%f3, %f4, %f0 # args
	SW	%r29, 96(%r30)
	ADDI	%r30, %r30, 100
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8891
	J	BEQ_cont.8892
BEQ_else.8891:
	LW	%r1, 20(%r30) # restore1
	LWC1	%f1, 88(%r30) # restore2
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 80(%r30) # restore2
	LWC1	%f2, 72(%r30) # restore2
	LWC1	%f3, 64(%r30) # restore2
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	vecset.2476
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 48(%r30) # restore1
	SW	%r2, 0(%r1)
	LW	%r1, 0(%r30) # restore1
	LW	%r2, 52(%r30) # restore1
	SW	%r2, 0(%r1)
BEQ_cont.8892:
BEQ_cont.8890:
BEQ_cont.8888:
	LW	%r1, 40(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 32(%r30) # restore1
	LW	%r3, 28(%r30) # restore1
	LW	%r26, 36(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
solve_one_or_network.2758:
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SLL	%r6, %r1, 2
	ADD	%r29, %r2, %r6
	LW	%r6, 0(%r29)
	ADDI	%r7, %r0, 1
	SUB	%r29, %r0, %r7
	ADDI	%r7, %r29, 0
	BNE	%r6, %r7, BEQ_else.8893
	JR	%r31
BEQ_else.8893:
	SLL	%r6, %r6, 2
	ADD	%r29, %r5, %r6
	LW	%r5, 0(%r29)
	ADDI	%r6, %r0, 0
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r26, 8(%r30)
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r5, 0 # args
	ADDI	%r1, %r6, 0 # args
	ADDI	%r26, %r4, 0 # args
	SW	%r29, 16(%r30)
	ADDI	%r30, %r30, 20
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
trace_or_matrix.2762:
	LW	%r4, 20(%r26)
	LW	%r5, 16(%r26)
	LW	%r6, 12(%r26)
	LW	%r7, 8(%r26)
	LW	%r8, 4(%r26)
	SLL	%r9, %r1, 2
	ADD	%r29, %r2, %r9
	LW	%r9, 0(%r29)
	LW	%r10, 0(%r9)
	ADDI	%r11, %r0, 1
	SUB	%r29, %r0, %r11
	ADDI	%r11, %r29, 0
	BNE	%r10, %r11, BEQ_else.8895
	JR	%r31
BEQ_else.8895:
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r26, 8(%r30)
	SW	%r1, 12(%r30)
	ADDI	%r27, %r0, 99
	BNE	%r10, %r27, BEQ_else.8897
	ADDI	%r4, %r0, 1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r9, 0 # args
	ADDI	%r1, %r4, 0 # args
	ADDI	%r26, %r8, 0 # args
	SW	%r29, 16(%r30)
	ADDI	%r30, %r30, 20
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8898
BEQ_else.8897:
	SW	%r9, 16(%r30)
	SW	%r8, 20(%r30)
	SW	%r4, 24(%r30)
	SW	%r6, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r10, 0 # args
	ADDI	%r26, %r7, 0 # args
	ADDI	%r3, %r5, 0 # args
	SW	%r29, 32(%r30)
	ADDI	%r30, %r30, 36
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8899
	J	BEQ_cont.8900
BEQ_else.8899:
	LW	%r1, 28(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r1, 24(%r30) # restore1
	LWC1	%f2, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fless
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8901
	J	BEQ_cont.8902
BEQ_else.8901:
	ADDI	%r1, %r0, 1
	LW	%r2, 16(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30)
	ADDI	%r30, %r30, 36
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8902:
BEQ_cont.8900:
BEQ_cont.8898:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
judge_intersection.2766:
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	LA	%r29, l.6375
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 0(%r3)
	ADDI	%r5, %r0, 0
	LW	%r4, 0(%r4)
	SW	%r3, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r3, %r1, 0 # args
	ADDI	%r26, %r2, 0 # args
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r5, 0 # args
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, 8
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LA	%r29, l.6355
	LWC1	%f1, 0(%r29)
	SWC1	%f2, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_fless
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8904
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8904:
	LA	%r29, l.6379
	LWC1	%f2, 0(%r29)
	LWC1	%f1, 8(%r30) # restore2
	J	min_caml_fless
solve_each_element_fast.2768:
	LW	%r4, 36(%r26)
	LW	%r5, 32(%r26)
	LW	%r6, 28(%r26)
	LW	%r7, 24(%r26)
	LW	%r8, 20(%r26)
	LW	%r9, 16(%r26)
	LW	%r10, 12(%r26)
	LW	%r11, 8(%r26)
	LW	%r12, 4(%r26)
	SW	%r9, 0(%r30)
	SW	%r11, 4(%r30)
	SW	%r10, 8(%r30)
	SW	%r12, 12(%r30)
	SW	%r5, 16(%r30)
	SW	%r4, 20(%r30)
	SW	%r7, 24(%r30)
	SW	%r26, 28(%r30)
	SW	%r8, 32(%r30)
	SW	%r3, 36(%r30)
	SW	%r6, 40(%r30)
	SW	%r2, 44(%r30)
	SW	%r1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	d_vec.2583
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 48(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 44(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	ADDI	%r5, %r0, 1
	SUB	%r29, %r0, %r5
	ADDI	%r5, %r29, 0
	BNE	%r3, %r5, BEQ_else.8905
	JR	%r31
BEQ_else.8905:
	LW	%r5, 36(%r30) # restore1
	LW	%r26, 40(%r30) # restore1
	SW	%r1, 52(%r30)
	SW	%r3, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r5, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 60(%r30)
	ADDI	%r30, %r30, 64
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8907
	LW	%r1, 56(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 32(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8908
	JR	%r31
BEQ_else.8908:
	LW	%r1, 48(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 44(%r30) # restore1
	LW	%r3, 36(%r30) # restore1
	LW	%r26, 28(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8907:
	LW	%r2, 24(%r30) # restore1
	LWC1	%f2, 0(%r2)
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 60(%r30)
	SWC1	%f2, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fless
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8910
	J	BEQ_cont.8911
BEQ_else.8910:
	LW	%r1, 20(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LWC1	%f1, 64(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fless
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8912
	J	BEQ_cont.8913
BEQ_else.8912:
	LA	%r29, l.6342
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 64(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 52(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f2, %f2, %f1
	LW	%r2, 16(%r30) # restore1
	LWC1	%f3, 0(%r2)
	ADD.s	%f2, %f2, %f3
	LWC1	%f3, 4(%r1)
	MUL.s	%f3, %f3, %f1
	LWC1	%f4, 4(%r2)
	ADD.s	%f3, %f3, %f4
	LWC1	%f4, 8(%r1)
	MUL.s	%f4, %f4, %f1
	LWC1	%f5, 8(%r2)
	ADD.s	%f4, %f4, %f5
	ADDI	%r1, %r0, 0
	LW	%r2, 44(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	SWC1	%f4, 72(%r30)
	SWC1	%f3, 80(%r30)
	SWC1	%f2, 88(%r30)
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	ADD.s	%f2, %f3, %f0 # args
	ADD.s	%f3, %f4, %f0 # args
	SW	%r29, 104(%r30)
	ADDI	%r30, %r30, 108
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8914
	J	BEQ_cont.8915
BEQ_else.8914:
	LW	%r1, 20(%r30) # restore1
	LWC1	%f1, 96(%r30) # restore2
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 88(%r30) # restore2
	LWC1	%f2, 80(%r30) # restore2
	LWC1	%f3, 72(%r30) # restore2
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	vecset.2476
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 56(%r30) # restore1
	SW	%r2, 0(%r1)
	LW	%r1, 0(%r30) # restore1
	LW	%r2, 60(%r30) # restore1
	SW	%r2, 0(%r1)
BEQ_cont.8915:
BEQ_cont.8913:
BEQ_cont.8911:
	LW	%r1, 48(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 44(%r30) # restore1
	LW	%r3, 36(%r30) # restore1
	LW	%r26, 28(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
solve_one_or_network_fast.2772:
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SLL	%r6, %r1, 2
	ADD	%r29, %r2, %r6
	LW	%r6, 0(%r29)
	ADDI	%r7, %r0, 1
	SUB	%r29, %r0, %r7
	ADDI	%r7, %r29, 0
	BNE	%r6, %r7, BEQ_else.8916
	JR	%r31
BEQ_else.8916:
	SLL	%r6, %r6, 2
	ADD	%r29, %r5, %r6
	LW	%r5, 0(%r29)
	ADDI	%r6, %r0, 0
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r26, 8(%r30)
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r5, 0 # args
	ADDI	%r1, %r6, 0 # args
	ADDI	%r26, %r4, 0 # args
	SW	%r29, 16(%r30)
	ADDI	%r30, %r30, 20
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
trace_or_matrix_fast.2776:
	LW	%r4, 16(%r26)
	LW	%r5, 12(%r26)
	LW	%r6, 8(%r26)
	LW	%r7, 4(%r26)
	SLL	%r8, %r1, 2
	ADD	%r29, %r2, %r8
	LW	%r8, 0(%r29)
	LW	%r9, 0(%r8)
	ADDI	%r10, %r0, 1
	SUB	%r29, %r0, %r10
	ADDI	%r10, %r29, 0
	BNE	%r9, %r10, BEQ_else.8918
	JR	%r31
BEQ_else.8918:
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r26, 8(%r30)
	SW	%r1, 12(%r30)
	ADDI	%r27, %r0, 99
	BNE	%r9, %r27, BEQ_else.8920
	ADDI	%r4, %r0, 1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r8, 0 # args
	ADDI	%r1, %r4, 0 # args
	ADDI	%r26, %r7, 0 # args
	SW	%r29, 16(%r30)
	ADDI	%r30, %r30, 20
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8921
BEQ_else.8920:
	SW	%r8, 16(%r30)
	SW	%r7, 20(%r30)
	SW	%r4, 24(%r30)
	SW	%r6, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r9, 0 # args
	ADDI	%r26, %r5, 0 # args
	SW	%r29, 32(%r30)
	ADDI	%r30, %r30, 36
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8922
	J	BEQ_cont.8923
BEQ_else.8922:
	LW	%r1, 28(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r1, 24(%r30) # restore1
	LWC1	%f2, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fless
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8924
	J	BEQ_cont.8925
BEQ_else.8924:
	ADDI	%r1, %r0, 1
	LW	%r2, 16(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30)
	ADDI	%r30, %r30, 36
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8925:
BEQ_cont.8923:
BEQ_cont.8921:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
judge_intersection_fast.2780:
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	LA	%r29, l.6375
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 0(%r3)
	ADDI	%r5, %r0, 0
	LW	%r4, 0(%r4)
	SW	%r3, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r3, %r1, 0 # args
	ADDI	%r26, %r2, 0 # args
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r5, 0 # args
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, 8
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LA	%r29, l.6355
	LWC1	%f1, 0(%r29)
	SWC1	%f2, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_fless
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8927
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8927:
	LA	%r29, l.6379
	LWC1	%f2, 0(%r29)
	LWC1	%f1, 8(%r30) # restore2
	J	min_caml_fless
get_nvector_rect.2782:
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	LW	%r3, 0(%r3)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r3, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	vecbzero.2484
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	ADDI	%r2, %r1, -1
	ADDI	%r1, %r1, -1
	SLL	%r1, %r1, 2
	LW	%r3, 4(%r30) # restore1
	ADD	%r29, %r3, %r1
	LWC1	%f1, 0(%r29)
	SW	%r2, 12(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	sgn.2468
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 0(%r30) # restore1
	ADD	%r29, %r2, %r1
	SWC1	%f1, 0(%r29)
	JR	%r31
get_nvector_plane.2784:
	LW	%r2, 4(%r26)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	JR	%r31
get_nvector_second.2786:
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	LWC1	%f1, 0(%r3)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r3, 8(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	o_param_x.2540
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 24(%r30)
	SWC1	%f2, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	o_param_y.2542
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 40(%r30)
	SWC1	%f2, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	o_param_z.2544
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	o_isrot.2530
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8931
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 64(%r30) # restore2
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 72(%r30) # restore2
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 80(%r30) # restore2
	SWC1	%f1, 8(%r1)
	J	BEQ_cont.8932
BEQ_else.8931:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	o_param_r3.2560
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	o_param_r2.2558
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 88(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	o_param_r3.2560
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	o_param_r1.2556
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 96(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	o_param_r2.2558
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	o_param_r1.2556
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 104(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 8(%r1)
BEQ_cont.8932:
	LW	%r2, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	o_isinvert.2528
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	J	vecunit_sgn.2494
get_nvector.2788:
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SW	%r3, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r5, 8(%r30)
	SW	%r2, 12(%r30)
	SW	%r4, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_form.2524
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8933
	LW	%r1, 12(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8933:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8934
	LW	%r1, 4(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8934:
	LW	%r1, 4(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
utexture.2791:
	LW	%r3, 4(%r26)
	SW	%r2, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_texturetype.2522
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 8(%r30) # restore1
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	o_color_red.2550
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	o_color_green.2552
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	o_color_blue.2554
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r2, 12(%r30) # restore1
	ADDI	%r27, %r0, 1
	BNE	%r2, %r27, BEQ_else.8935
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	o_param_x.2540
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6442
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_floor
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6443
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6434
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fless
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 8(%r30) # restore1
	SW	%r1, 32(%r30)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	o_param_z.2544
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6442
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	min_caml_floor
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6443
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6434
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	min_caml_fless
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 32(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.8937
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8939
	LA	%r29, l.6429
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.8940
BEQ_else.8939:
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
BEQ_cont.8940:
	J	BEQ_cont.8938
BEQ_else.8937:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8941
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.8942
BEQ_else.8941:
	LA	%r29, l.6429
	LWC1	%f1, 0(%r29)
BEQ_cont.8942:
BEQ_cont.8938:
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	JR	%r31
BEQ_else.8935:
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.8944
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LA	%r29, l.6438
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	min_caml_sin
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6429
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f2, 0(%r1)
	LA	%r29, l.6429
	LWC1	%f2, 0(%r29)
	LA	%r29, l.6002
	LWC1	%f3, 0(%r29)
	SUB.s	%f1, %f3, %f1
	MUL.s	%f1, %f2, %f1
	SWC1	%f1, 4(%r1)
	JR	%r31
BEQ_else.8944:
	ADDI	%r27, %r0, 3
	BNE	%r2, %r27, BEQ_else.8946
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	o_param_x.2540
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 64(%r30)
	SWC1	%f2, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	o_param_z.2544
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LWC1	%f2, 64(%r30) # restore2
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6434
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	min_caml_floor
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6425
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	min_caml_cos
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6429
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	SWC1	%f2, 4(%r1)
	LA	%r29, l.6002
	LWC1	%f2, 0(%r29)
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6429
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.8946:
	ADDI	%r27, %r0, 4
	BNE	%r2, %r27, BEQ_else.8948
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	o_param_x.2540
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 104(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 112(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 120(%r30) # save link register
	ADDI	%r30, %r30, 124
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 124
	SUB	%r30, %r30, %r29
	LW	%r29, 120(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 120(%r30) # save link register
	ADDI	%r30, %r30, 124
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 124
	SUB	%r30, %r30, %r29
	LW	%r29, 120(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r2, 8(%r30) # restore1
	SWC1	%f1, 120(%r30)
	SWC1	%f2, 128(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 136(%r30) # save link register
	ADDI	%r30, %r30, 140
	JAL	o_param_z.2544
	ADDI	%r29, %r0, 140
	SUB	%r30, %r30, %r29
	LW	%r29, 136(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 136(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 144(%r30) # save link register
	ADDI	%r30, %r30, 148
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 148
	SUB	%r30, %r30, %r29
	LW	%r29, 144(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 144(%r30) # save link register
	ADDI	%r30, %r30, 148
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 148
	SUB	%r30, %r30, %r29
	LW	%r29, 144(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 120(%r30) # restore2
	SWC1	%f1, 144(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 152(%r30) # save link register
	ADDI	%r30, %r30, 156
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 156
	SUB	%r30, %r30, %r29
	LW	%r29, 152(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 144(%r30) # restore2
	SWC1	%f1, 152(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 160(%r30) # save link register
	ADDI	%r30, %r30, 164
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 164
	SUB	%r30, %r30, %r29
	LW	%r29, 160(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 152(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LWC1	%f2, 120(%r30) # restore2
	SWC1	%f1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 168(%r30) # save link register
	ADDI	%r30, %r30, 172
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 172
	SUB	%r30, %r30, %r29
	LW	%r29, 168(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6422
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 168(%r30) # save link register
	ADDI	%r30, %r30, 172
	JAL	min_caml_fless
	ADDI	%r29, %r0, 172
	SUB	%r30, %r30, %r29
	LW	%r29, 168(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8949
	LWC1	%f1, 120(%r30) # restore2
	LWC1	%f2, 144(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 168(%r30) # save link register
	ADDI	%r30, %r30, 172
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 172
	SUB	%r30, %r30, %r29
	LW	%r29, 168(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 168(%r30) # save link register
	ADDI	%r30, %r30, 172
	JAL	min_caml_atan
	ADDI	%r29, %r0, 172
	SUB	%r30, %r30, %r29
	LW	%r29, 168(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6424
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.6425
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	J	BEQ_cont.8950
BEQ_else.8949:
	LA	%r29, l.6423
	LWC1	%f1, 0(%r29)
BEQ_cont.8950:
	SWC1	%f1, 168(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 176(%r30) # save link register
	ADDI	%r30, %r30, 180
	JAL	min_caml_floor
	ADDI	%r29, %r0, 180
	SUB	%r30, %r30, %r29
	LW	%r29, 176(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 168(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 176(%r30)
	SWC1	%f2, 184(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 192(%r30) # save link register
	ADDI	%r30, %r30, 196
	JAL	o_param_y.2542
	ADDI	%r29, %r0, 196
	SUB	%r30, %r30, %r29
	LW	%r29, 192(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 184(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 192(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 200(%r30) # save link register
	ADDI	%r30, %r30, 204
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 204
	SUB	%r30, %r30, %r29
	LW	%r29, 200(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 200(%r30) # save link register
	ADDI	%r30, %r30, 204
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 204
	SUB	%r30, %r30, %r29
	LW	%r29, 200(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 192(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 160(%r30) # restore2
	SWC1	%f1, 200(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 208(%r30) # save link register
	ADDI	%r30, %r30, 212
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 212
	SUB	%r30, %r30, %r29
	LW	%r29, 208(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6422
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 208(%r30) # save link register
	ADDI	%r30, %r30, 212
	JAL	min_caml_fless
	ADDI	%r29, %r0, 212
	SUB	%r30, %r30, %r29
	LW	%r29, 208(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8951
	LWC1	%f1, 160(%r30) # restore2
	LWC1	%f2, 200(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 208(%r30) # save link register
	ADDI	%r30, %r30, 212
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 212
	SUB	%r30, %r30, %r29
	LW	%r29, 208(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 208(%r30) # save link register
	ADDI	%r30, %r30, 212
	JAL	min_caml_atan
	ADDI	%r29, %r0, 212
	SUB	%r30, %r30, %r29
	LW	%r29, 208(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6424
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.6425
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	J	BEQ_cont.8952
BEQ_else.8951:
	LA	%r29, l.6423
	LWC1	%f1, 0(%r29)
BEQ_cont.8952:
	SWC1	%f1, 208(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 216(%r30) # save link register
	ADDI	%r30, %r30, 220
	JAL	min_caml_floor
	ADDI	%r29, %r0, 220
	SUB	%r30, %r30, %r29
	LW	%r29, 216(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 208(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6427
	LWC1	%f2, 0(%r29)
	LA	%r29, l.6428
	LWC1	%f3, 0(%r29)
	LWC1	%f4, 176(%r30) # restore2
	SUB.s	%f3, %f3, %f4
	SWC1	%f1, 216(%r30)
	SWC1	%f2, 224(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 232(%r30) # save link register
	ADDI	%r30, %r30, 236
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 236
	SUB	%r30, %r30, %r29
	LW	%r29, 232(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 224(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6428
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 216(%r30) # restore2
	SUB.s	%f2, %f2, %f3
	SWC1	%f1, 232(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 240(%r30) # save link register
	ADDI	%r30, %r30, 244
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 244
	SUB	%r30, %r30, %r29
	LW	%r29, 240(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 232(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	SWC1	%f1, 240(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 248(%r30) # save link register
	ADDI	%r30, %r30, 252
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 252
	SUB	%r30, %r30, %r29
	LW	%r29, 248(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8953
	LWC1	%f1, 240(%r30) # restore2
	J	BEQ_cont.8954
BEQ_else.8953:
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
BEQ_cont.8954:
	LA	%r29, l.6429
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f2, %f1
	LA	%r29, l.6430
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.8948:
	JR	%r31
add_light.2794:
	LW	%r1, 8(%r26)
	LW	%r2, 4(%r26)
	SWC1	%f3, 0(%r30)
	SWC1	%f2, 8(%r30)
	SWC1	%f1, 16(%r30)
	SW	%r1, 24(%r30)
	SW	%r2, 28(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8957
	J	BEQ_cont.8958
BEQ_else.8957:
	LWC1	%f1, 16(%r30) # restore2
	LW	%r1, 28(%r30) # restore1
	LW	%r2, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	vecaccum.2505
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8958:
	LWC1	%f1, 8(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8959
	JR	%r31
BEQ_else.8959:
	LWC1	%f1, 8(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 0(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 28(%r30) # restore1
	LWC1	%f2, 0(%r1)
	ADD.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LWC1	%f2, 4(%r1)
	ADD.s	%f2, %f2, %f1
	SWC1	%f2, 4(%r1)
	LWC1	%f2, 8(%r1)
	ADD.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	JR	%r31
trace_reflections.2798:
	LW	%r3, 32(%r26)
	LW	%r4, 28(%r26)
	LW	%r5, 24(%r26)
	LW	%r6, 20(%r26)
	LW	%r7, 16(%r26)
	LW	%r8, 12(%r26)
	LW	%r9, 8(%r26)
	LW	%r10, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8962
	SLL	%r11, %r1, 2
	ADD	%r29, %r4, %r11
	LW	%r4, 0(%r29)
	SW	%r26, 0(%r30)
	SW	%r1, 4(%r30)
	SWC1	%f2, 8(%r30)
	SW	%r10, 16(%r30)
	SW	%r2, 20(%r30)
	SWC1	%f1, 24(%r30)
	SW	%r6, 32(%r30)
	SW	%r3, 36(%r30)
	SW	%r5, 40(%r30)
	SW	%r4, 44(%r30)
	SW	%r8, 48(%r30)
	SW	%r9, 52(%r30)
	SW	%r7, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	r_dvec.2589
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 56(%r30) # restore1
	SW	%r1, 60(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30)
	ADDI	%r30, %r30, 68
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8963
	J	BEQ_cont.8964
BEQ_else.8963:
	LW	%r1, 52(%r30) # restore1
	LW	%r1, 0(%r1)
	ADDI	%r1, %r1, 4
	LW	%r2, 48(%r30) # restore1
	LW	%r2, 0(%r2)
	ADD	%r1, %r1, %r2
	LW	%r2, 44(%r30) # restore1
	SW	%r1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	r_surface_id.2587
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 64(%r30) # restore1
	BNE	%r2, %r1, BEQ_else.8965
	ADDI	%r1, %r0, 0
	LW	%r2, 40(%r30) # restore1
	LW	%r2, 0(%r2)
	LW	%r26, 36(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8967
	LW	%r1, 60(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	d_vec.2583
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	veciprod.2497
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	r_bright.2591
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f3, %f1, %f2
	LWC1	%f4, 72(%r30) # restore2
	MUL.s	%f3, %f3, %f4
	LW	%r1, 60(%r30) # restore1
	SWC1	%f3, 80(%r30)
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	d_vec.2583
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	veciprod.2497
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	MUL.s	%f2, %f2, %f1
	LWC1	%f1, 80(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	LW	%r26, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 96(%r30)
	ADDI	%r30, %r30, 100
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8968
BEQ_else.8967:
BEQ_cont.8968:
	J	BEQ_cont.8966
BEQ_else.8965:
BEQ_cont.8966:
BEQ_cont.8964:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, -1
	LWC1	%f1, 24(%r30) # restore2
	LWC1	%f2, 8(%r30) # restore2
	LW	%r2, 20(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8962:
	JR	%r31
trace_ray.2803:
	LW	%r4, 80(%r26)
	LW	%r5, 76(%r26)
	LW	%r6, 72(%r26)
	LW	%r7, 68(%r26)
	LW	%r8, 64(%r26)
	LW	%r9, 60(%r26)
	LW	%r10, 56(%r26)
	LW	%r11, 52(%r26)
	LW	%r12, 48(%r26)
	LW	%r13, 44(%r26)
	LW	%r14, 40(%r26)
	LW	%r15, 36(%r26)
	LW	%r16, 32(%r26)
	LW	%r17, 28(%r26)
	LW	%r18, 24(%r26)
	LW	%r19, 20(%r26)
	LW	%r20, 16(%r26)
	LW	%r21, 12(%r26)
	LW	%r22, 8(%r26)
	LW	%r23, 4(%r26)
	ADDI	%r27, %r0, 4
	SLT	%r27, %r27, %r1
	BNE	%r27, %r0, BEQ_else.8971
	SW	%r26, 0(%r30)
	SWC1	%f2, 8(%r30)
	SW	%r6, 16(%r30)
	SW	%r5, 20(%r30)
	SW	%r15, 24(%r30)
	SW	%r10, 28(%r30)
	SW	%r23, 32(%r30)
	SW	%r9, 36(%r30)
	SW	%r12, 40(%r30)
	SW	%r14, 44(%r30)
	SW	%r7, 48(%r30)
	SW	%r3, 52(%r30)
	SW	%r18, 56(%r30)
	SW	%r4, 60(%r30)
	SW	%r19, 64(%r30)
	SW	%r8, 68(%r30)
	SW	%r21, 72(%r30)
	SW	%r13, 76(%r30)
	SW	%r20, 80(%r30)
	SW	%r11, 84(%r30)
	SW	%r22, 88(%r30)
	SWC1	%f1, 96(%r30)
	SW	%r16, 104(%r30)
	SW	%r1, 108(%r30)
	SW	%r2, 112(%r30)
	SW	%r17, 116(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 120(%r30) # save link register
	ADDI	%r30, %r30, 124
	JAL	p_surface_ids.2568
	ADDI	%r29, %r0, 124
	SUB	%r30, %r30, %r29
	LW	%r29, 120(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 112(%r30) # restore1
	LW	%r26, 116(%r30) # restore1
	SW	%r1, 120(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 124(%r30)
	ADDI	%r30, %r30, 128
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8974
	ADDI	%r1, %r0, 1
	SUB	%r29, %r0, %r1
	ADDI	%r1, %r29, 0
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 120(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.8975
	JR	%r31
BEQ_else.8975:
	LW	%r1, 112(%r30) # restore1
	LW	%r2, 104(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	veciprod.2497
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 128(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 136(%r30) # save link register
	ADDI	%r30, %r30, 140
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 140
	SUB	%r30, %r30, %r29
	LW	%r29, 136(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8978
	JR	%r31
BEQ_else.8978:
	LWC1	%f1, 128(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 136(%r30) # save link register
	ADDI	%r30, %r30, 140
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 140
	SUB	%r30, %r30, %r29
	LW	%r29, 136(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 88(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 84(%r30) # restore1
	LWC1	%f2, 0(%r1)
	ADD.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LWC1	%f2, 4(%r1)
	ADD.s	%f2, %f2, %f1
	SWC1	%f2, 4(%r1)
	LWC1	%f2, 8(%r1)
	ADD.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.8974:
	LW	%r1, 80(%r30) # restore1
	LW	%r1, 0(%r1)
	SLL	%r2, %r1, 2
	LW	%r3, 76(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	SW	%r1, 136(%r30)
	SW	%r2, 140(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 144(%r30) # save link register
	ADDI	%r30, %r30, 148
	JAL	o_reflectiontype.2526
	ADDI	%r29, %r0, 148
	SUB	%r30, %r30, %r29
	LW	%r29, 144(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 140(%r30) # restore1
	SW	%r1, 144(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	o_diffuse.2546
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 140(%r30) # restore1
	LW	%r2, 112(%r30) # restore1
	LW	%r26, 72(%r30) # restore1
	SWC1	%f1, 152(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 160(%r30)
	ADDI	%r30, %r30, 164
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 164
	SUB	%r30, %r30, %r29
	LW	%r29, 160(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 68(%r30) # restore1
	LW	%r2, 64(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 160(%r30) # save link register
	ADDI	%r30, %r30, 164
	JAL	veccpy.2486
	ADDI	%r29, %r0, 164
	SUB	%r30, %r30, %r29
	LW	%r29, 160(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 140(%r30) # restore1
	LW	%r2, 64(%r30) # restore1
	LW	%r26, 60(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 160(%r30)
	ADDI	%r30, %r30, 164
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 164
	SUB	%r30, %r30, %r29
	LW	%r29, 160(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 136(%r30) # restore1
	ADDI	%r1, %r1, 4
	LW	%r2, 56(%r30) # restore1
	LW	%r2, 0(%r2)
	ADD	%r1, %r1, %r2
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 120(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	LW	%r1, 52(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 160(%r30) # save link register
	ADDI	%r30, %r30, 164
	JAL	p_intersection_points.2566
	ADDI	%r29, %r0, 164
	SUB	%r30, %r30, %r29
	LW	%r29, 160(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	LW	%r3, 64(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 160(%r30) # save link register
	ADDI	%r30, %r30, 164
	JAL	veccpy.2486
	ADDI	%r29, %r0, 164
	SUB	%r30, %r30, %r29
	LW	%r29, 160(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 160(%r30) # save link register
	ADDI	%r30, %r30, 164
	JAL	p_calc_diffuse.2570
	ADDI	%r29, %r0, 164
	SUB	%r30, %r30, %r29
	LW	%r29, 160(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 140(%r30) # restore1
	SW	%r1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	o_diffuse.2546
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6428
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	min_caml_fless
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8982
	ADDI	%r1, %r0, 1
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 160(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	LW	%r1, 52(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	p_energy.2572
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r3, 0(%r29)
	LW	%r4, 48(%r30) # restore1
	SW	%r1, 164(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 168(%r30) # save link register
	ADDI	%r30, %r30, 172
	JAL	veccpy.2486
	ADDI	%r29, %r0, 172
	SUB	%r30, %r30, %r29
	LW	%r29, 168(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 108(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 164(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LA	%r29, l.6465
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	LWC1	%f2, 152(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 168(%r30) # save link register
	ADDI	%r30, %r30, 172
	JAL	vecscale.2515
	ADDI	%r29, %r0, 172
	SUB	%r30, %r30, %r29
	LW	%r29, 168(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 168(%r30) # save link register
	ADDI	%r30, %r30, 172
	JAL	p_nvectors.2581
	ADDI	%r29, %r0, 172
	SUB	%r30, %r30, %r29
	LW	%r29, 168(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	LW	%r3, 44(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 168(%r30) # save link register
	ADDI	%r30, %r30, 172
	JAL	veccpy.2486
	ADDI	%r29, %r0, 172
	SUB	%r30, %r30, %r29
	LW	%r29, 168(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8983
BEQ_else.8982:
	ADDI	%r1, %r0, 0
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 160(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
BEQ_cont.8983:
	LA	%r29, l.6467
	LWC1	%f1, 0(%r29)
	LW	%r1, 112(%r30) # restore1
	LW	%r2, 44(%r30) # restore1
	SWC1	%f1, 168(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 176(%r30) # save link register
	ADDI	%r30, %r30, 180
	JAL	veciprod.2497
	ADDI	%r29, %r0, 180
	SUB	%r30, %r30, %r29
	LW	%r29, 176(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 168(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 112(%r30) # restore1
	LW	%r2, 44(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 176(%r30) # save link register
	ADDI	%r30, %r30, 180
	JAL	vecaccum.2505
	ADDI	%r29, %r0, 180
	SUB	%r30, %r30, %r29
	LW	%r29, 176(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 140(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 176(%r30) # save link register
	ADDI	%r30, %r30, 180
	JAL	o_hilight.2548
	ADDI	%r29, %r0, 180
	SUB	%r30, %r30, %r29
	LW	%r29, 176(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	ADDI	%r1, %r0, 0
	LW	%r2, 40(%r30) # restore1
	LW	%r2, 0(%r2)
	LW	%r26, 36(%r30) # restore1
	SWC1	%f1, 176(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 184(%r30)
	ADDI	%r30, %r30, 188
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 188
	SUB	%r30, %r30, %r29
	LW	%r29, 184(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8984
	LW	%r1, 44(%r30) # restore1
	LW	%r2, 104(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 184(%r30) # save link register
	ADDI	%r30, %r30, 188
	JAL	veciprod.2497
	ADDI	%r29, %r0, 188
	SUB	%r30, %r30, %r29
	LW	%r29, 184(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 184(%r30) # save link register
	ADDI	%r30, %r30, 188
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 188
	SUB	%r30, %r30, %r29
	LW	%r29, 184(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 152(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 112(%r30) # restore1
	LW	%r2, 104(%r30) # restore1
	SWC1	%f1, 184(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 192(%r30) # save link register
	ADDI	%r30, %r30, 196
	JAL	veciprod.2497
	ADDI	%r29, %r0, 196
	SUB	%r30, %r30, %r29
	LW	%r29, 192(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 192(%r30) # save link register
	ADDI	%r30, %r30, 196
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 196
	SUB	%r30, %r30, %r29
	LW	%r29, 192(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 184(%r30) # restore2
	LWC1	%f3, 176(%r30) # restore2
	LW	%r26, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 192(%r30)
	ADDI	%r30, %r30, 196
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 196
	SUB	%r30, %r30, %r29
	LW	%r29, 192(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8985
BEQ_else.8984:
BEQ_cont.8985:
	LW	%r1, 64(%r30) # restore1
	LW	%r26, 28(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 192(%r30)
	ADDI	%r30, %r30, 196
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 196
	SUB	%r30, %r30, %r29
	LW	%r29, 192(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	LW	%r1, 0(%r1)
	ADDI	%r1, %r1, -1
	LWC1	%f1, 152(%r30) # restore2
	LWC1	%f2, 176(%r30) # restore2
	LW	%r2, 112(%r30) # restore1
	LW	%r26, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 192(%r30)
	ADDI	%r30, %r30, 196
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 196
	SUB	%r30, %r30, %r29
	LW	%r29, 192(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6470
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 96(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 192(%r30) # save link register
	ADDI	%r30, %r30, 196
	JAL	min_caml_fless
	ADDI	%r29, %r0, 196
	SUB	%r30, %r30, %r29
	LW	%r29, 192(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8986
	JR	%r31
BEQ_else.8986:
	LW	%r1, 108(%r30) # restore1
	ADDI	%r27, %r0, 4
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8988
	J	BEQ_cont.8989
BEQ_else.8988:
	ADDI	%r2, %r1, 1
	ADDI	%r3, %r0, 1
	SUB	%r29, %r0, %r3
	ADDI	%r3, %r29, 0
	SLL	%r2, %r2, 2
	LW	%r4, 120(%r30) # restore1
	ADD	%r29, %r4, %r2
	SW	%r3, 0(%r29)
BEQ_cont.8989:
	LW	%r2, 144(%r30) # restore1
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.8990
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LW	%r2, 140(%r30) # restore1
	SWC1	%f1, 192(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 200(%r30) # save link register
	ADDI	%r30, %r30, 204
	JAL	o_diffuse.2546
	ADDI	%r29, %r0, 204
	SUB	%r30, %r30, %r29
	LW	%r29, 200(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 192(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 108(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 16(%r30) # restore1
	LWC1	%f2, 0(%r2)
	LWC1	%f3, 8(%r30) # restore2
	ADD.s	%f2, %f3, %f2
	LW	%r2, 112(%r30) # restore1
	LW	%r3, 52(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 200(%r30)
	ADDI	%r30, %r30, 204
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 204
	SUB	%r30, %r30, %r29
	LW	%r29, 200(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8991
BEQ_else.8990:
BEQ_cont.8991:
	JR	%r31
BEQ_else.8971:
	JR	%r31
trace_diffuse_ray.2809:
	LW	%r2, 48(%r26)
	LW	%r3, 44(%r26)
	LW	%r4, 40(%r26)
	LW	%r5, 36(%r26)
	LW	%r6, 32(%r26)
	LW	%r7, 28(%r26)
	LW	%r8, 24(%r26)
	LW	%r9, 20(%r26)
	LW	%r10, 16(%r26)
	LW	%r11, 12(%r26)
	LW	%r12, 8(%r26)
	LW	%r13, 4(%r26)
	SW	%r3, 0(%r30)
	SW	%r13, 4(%r30)
	SWC1	%f1, 8(%r30)
	SW	%r8, 16(%r30)
	SW	%r7, 20(%r30)
	SW	%r4, 24(%r30)
	SW	%r5, 28(%r30)
	SW	%r10, 32(%r30)
	SW	%r2, 36(%r30)
	SW	%r12, 40(%r30)
	SW	%r1, 44(%r30)
	SW	%r6, 48(%r30)
	SW	%r11, 52(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r26, %r9, 0 # args
	SW	%r29, 56(%r30)
	ADDI	%r30, %r30, 60
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8994
	JR	%r31
BEQ_else.8994:
	LW	%r1, 52(%r30) # restore1
	LW	%r1, 0(%r1)
	SLL	%r1, %r1, 2
	LW	%r2, 48(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	LW	%r2, 44(%r30) # restore1
	SW	%r1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	d_vec.2583
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 56(%r30) # restore1
	LW	%r26, 40(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30)
	ADDI	%r30, %r30, 64
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 56(%r30) # restore1
	LW	%r2, 32(%r30) # restore1
	LW	%r26, 36(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30)
	ADDI	%r30, %r30, 64
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	LW	%r2, 28(%r30) # restore1
	LW	%r2, 0(%r2)
	LW	%r26, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30)
	ADDI	%r30, %r30, 64
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8996
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	veciprod.2497
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8998
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.8999
BEQ_else.8998:
	LWC1	%f1, 64(%r30) # restore2
BEQ_cont.8999:
	LWC1	%f2, 8(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 56(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	o_diffuse.2546
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	J	vecaccum.2505
BEQ_else.8996:
	JR	%r31
iter_trace_diffuse_rays.2812:
	LW	%r5, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r4, %r27
	BNE	%r27, %r0, BEQ_else.9001
	SLL	%r6, %r4, 2
	ADD	%r29, %r1, %r6
	LW	%r6, 0(%r29)
	SW	%r3, 0(%r30)
	SW	%r26, 4(%r30)
	SW	%r5, 8(%r30)
	SW	%r1, 12(%r30)
	SW	%r4, 16(%r30)
	SW	%r2, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r6, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	d_vec.2583
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	veciprod.2497
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.9002
	LW	%r1, 16(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 12(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LA	%r29, l.6488
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 24(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 32(%r30)
	ADDI	%r30, %r30, 36
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.9003
BEQ_else.9002:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r2, %r1, 1
	SLL	%r2, %r2, 2
	LW	%r3, 12(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LA	%r29, l.6486
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 24(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 32(%r30)
	ADDI	%r30, %r30, 36
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.9003:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r4, %r1, -2
	LW	%r1, 12(%r30) # restore1
	LW	%r2, 20(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9001:
	JR	%r31
trace_diffuse_rays.2817:
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	SW	%r5, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	ADDI	%r26, %r4, 0 # args
	SW	%r29, 16(%r30)
	ADDI	%r30, %r30, 20
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r4, %r0, 118
	LW	%r1, 8(%r30) # restore1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
trace_diffuse_ray_80percent.2821:
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r5, 12(%r30)
	SW	%r1, 16(%r30)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.9005
	J	BEQ_cont.9006
BEQ_else.9005:
	LW	%r6, 0(%r5)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r6, 0 # args
	ADDI	%r26, %r4, 0 # args
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.9006:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.9007
	J	BEQ_cont.9008
BEQ_else.9007:
	LW	%r2, 12(%r30) # restore1
	LW	%r3, 4(%r2)
	LW	%r4, 4(%r30) # restore1
	LW	%r5, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	ADDI	%r3, %r5, 0 # args
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.9008:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.9009
	J	BEQ_cont.9010
BEQ_else.9009:
	LW	%r2, 12(%r30) # restore1
	LW	%r3, 8(%r2)
	LW	%r4, 4(%r30) # restore1
	LW	%r5, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	ADDI	%r3, %r5, 0 # args
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.9010:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.9011
	J	BEQ_cont.9012
BEQ_else.9011:
	LW	%r2, 12(%r30) # restore1
	LW	%r3, 12(%r2)
	LW	%r4, 4(%r30) # restore1
	LW	%r5, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	ADDI	%r3, %r5, 0 # args
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.9012:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r27, %r0, 4
	BNE	%r1, %r27, BEQ_else.9013
	JR	%r31
BEQ_else.9013:
	LW	%r1, 12(%r30) # restore1
	LW	%r1, 16(%r1)
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
calc_diffuse_using_1point.2825:
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SW	%r4, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r5, 8(%r30)
	SW	%r2, 12(%r30)
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	p_received_ray_20percent.2574
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	p_nvectors.2581
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	p_intersection_points.2566
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	p_energy.2572
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 20(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	LW	%r4, 8(%r30) # restore1
	SW	%r1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	veccpy.2486
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	p_group_id.2576
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 24(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	SLL	%r4, %r2, 2
	LW	%r5, 28(%r30) # restore1
	ADD	%r29, %r5, %r4
	LW	%r4, 0(%r29)
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r3, %r4, 0 # args
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 32(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r2, 0(%r29)
	LW	%r1, 0(%r30) # restore1
	LW	%r3, 8(%r30) # restore1
	J	vecaccumv.2518
calc_diffuse_using_5points.2828:
	LW	%r6, 8(%r26)
	LW	%r7, 4(%r26)
	SLL	%r8, %r1, 2
	ADD	%r29, %r2, %r8
	LW	%r2, 0(%r29)
	SW	%r6, 0(%r30)
	SW	%r7, 4(%r30)
	SW	%r5, 8(%r30)
	SW	%r4, 12(%r30)
	SW	%r3, 16(%r30)
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	p_received_ray_20percent.2574
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	ADDI	%r3, %r2, -1
	SLL	%r3, %r3, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	p_received_ray_20percent.2574
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	p_received_ray_20percent.2574
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	ADDI	%r3, %r2, 1
	SLL	%r3, %r3, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	SW	%r1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	p_received_ray_20percent.2574
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 12(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	SW	%r1, 36(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	p_received_ray_20percent.2574
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 8(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 24(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	LW	%r4, 4(%r30) # restore1
	SW	%r1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	veccpy.2486
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 28(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LW	%r3, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	vecadd.2509
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 32(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LW	%r3, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	vecadd.2509
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 36(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LW	%r3, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	vecadd.2509
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 40(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LW	%r3, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	vecadd.2509
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 16(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	p_energy.2572
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 8(%r30) # restore1
	SLL	%r2, %r2, 2
	ADD	%r29, %r1, %r2
	LW	%r2, 0(%r29)
	LW	%r1, 0(%r30) # restore1
	LW	%r3, 4(%r30) # restore1
	J	vecaccumv.2518
do_without_neighbors.2834:
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 4
	SLT	%r27, %r27, %r2
	BNE	%r27, %r0, BEQ_else.9015
	SW	%r26, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r1, 8(%r30)
	SW	%r2, 12(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	p_surface_ids.2568
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9016
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	p_calc_diffuse.2570
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.9017
	J	BEQ_cont.9018
BEQ_else.9017:
	LW	%r1, 8(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30)
	ADDI	%r30, %r30, 20
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.9018:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r2, %r1, 1
	LW	%r1, 8(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9016:
	JR	%r31
BEQ_else.9015:
	JR	%r31
neighbors_exist.2837:
	LW	%r3, 4(%r26)
	LW	%r4, 4(%r3)
	ADDI	%r5, %r2, 1
	SLT	%r27, %r5, %r4
	BNE	%r27, %r0, BEQ_else.9021
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.9021:
	ADDI	%r27, %r0, 0
	SLT	%r27, %r27, %r2
	BNE	%r27, %r0, BEQ_else.9022
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.9022:
	LW	%r2, 0(%r3)
	ADDI	%r3, %r1, 1
	SLT	%r27, %r3, %r2
	BNE	%r27, %r0, BEQ_else.9023
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.9023:
	ADDI	%r27, %r0, 0
	SLT	%r27, %r27, %r1
	BNE	%r27, %r0, BEQ_else.9024
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.9024:
	ADDI	%r1, %r0, 1
	JR	%r31
get_surface_id.2841:
	SW	%r2, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	p_surface_ids.2568
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SLL	%r2, %r2, 2
	ADD	%r29, %r1, %r2
	LW	%r1, 0(%r29)
	JR	%r31
neighbors_are_available.2844:
	SLL	%r6, %r1, 2
	ADD	%r29, %r3, %r6
	LW	%r6, 0(%r29)
	SW	%r3, 0(%r30)
	SW	%r4, 4(%r30)
	SW	%r5, 8(%r30)
	SW	%r2, 12(%r30)
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r5, 0 # args
	ADDI	%r1, %r6, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	get_surface_id.2841
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 12(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	LW	%r4, 8(%r30) # restore1
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	get_surface_id.2841
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	BNE	%r1, %r2, BEQ_else.9025
	LW	%r1, 16(%r30) # restore1
	SLL	%r3, %r1, 2
	LW	%r4, 4(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	LW	%r4, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	get_surface_id.2841
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	BNE	%r1, %r2, BEQ_else.9026
	LW	%r1, 16(%r30) # restore1
	ADDI	%r3, %r1, -1
	SLL	%r3, %r3, 2
	LW	%r4, 0(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	LW	%r5, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r5, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	get_surface_id.2841
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	BNE	%r1, %r2, BEQ_else.9027
	LW	%r1, 16(%r30) # restore1
	ADDI	%r1, %r1, 1
	SLL	%r1, %r1, 2
	LW	%r3, 0(%r30) # restore1
	ADD	%r29, %r3, %r1
	LW	%r1, 0(%r29)
	LW	%r3, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	get_surface_id.2841
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	BNE	%r1, %r2, BEQ_else.9028
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.9028:
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.9027:
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.9026:
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.9025:
	ADDI	%r1, %r0, 0
	JR	%r31
try_exploit_neighbors.2850:
	LW	%r7, 8(%r26)
	LW	%r8, 4(%r26)
	SLL	%r9, %r1, 2
	ADD	%r29, %r4, %r9
	LW	%r9, 0(%r29)
	ADDI	%r27, %r0, 4
	SLT	%r27, %r27, %r6
	BNE	%r27, %r0, BEQ_else.9029
	SW	%r2, 0(%r30)
	SW	%r26, 4(%r30)
	SW	%r8, 8(%r30)
	SW	%r9, 12(%r30)
	SW	%r7, 16(%r30)
	SW	%r6, 20(%r30)
	SW	%r5, 24(%r30)
	SW	%r4, 28(%r30)
	SW	%r3, 32(%r30)
	SW	%r1, 36(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r6, 0 # args
	ADDI	%r1, %r9, 0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	get_surface_id.2841
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9030
	LW	%r1, 36(%r30) # restore1
	LW	%r2, 32(%r30) # restore1
	LW	%r3, 28(%r30) # restore1
	LW	%r4, 24(%r30) # restore1
	LW	%r5, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	neighbors_are_available.2844
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.9031
	LW	%r1, 36(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 28(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	LW	%r2, 20(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9031:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	p_calc_diffuse.2570
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LW	%r5, 20(%r30) # restore1
	SLL	%r2, %r5, 2
	ADD	%r29, %r1, %r2
	LW	%r1, 0(%r29)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.9032
	J	BEQ_cont.9033
BEQ_else.9032:
	LW	%r1, 36(%r30) # restore1
	LW	%r2, 32(%r30) # restore1
	LW	%r3, 28(%r30) # restore1
	LW	%r4, 24(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30)
	ADDI	%r30, %r30, 44
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.9033:
	LW	%r1, 20(%r30) # restore1
	ADDI	%r6, %r1, 1
	LW	%r1, 36(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	LW	%r3, 32(%r30) # restore1
	LW	%r4, 28(%r30) # restore1
	LW	%r5, 24(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9030:
	JR	%r31
BEQ_else.9029:
	JR	%r31
write_ppm_header.2857:
	LW	%r1, 4(%r26)
	ADDI	%r2, %r0, 80
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_char
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 48
	ADDI	%r1, %r1, 3
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_char
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 10
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_char
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	LW	%r2, 0(%r1)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 32
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_char
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	LW	%r1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 32
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_char
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 255
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 10
	J	min_caml_print_char
write_rgb_element.2859:
	ADDI	%r29, %r31, 0
	SW	%r29, 0(%r30) # save link register
	ADDI	%r30, %r30, 4
	JAL	min_caml_int_of_float
	ADDI	%r29, %r0, 4
	SUB	%r30, %r30, %r29
	LW	%r29, 0(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 255
	SLT	%r27, %r27, %r1
	BNE	%r27, %r0, BEQ_else.9036
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9038
	J	BEQ_cont.9039
BEQ_else.9038:
	ADDI	%r1, %r0, 0
BEQ_cont.9039:
	J	BEQ_cont.9037
BEQ_else.9036:
	ADDI	%r1, %r0, 255
BEQ_cont.9037:
	J	min_caml_print_int
write_rgb.2861:
	LW	%r1, 4(%r26)
	LWC1	%f1, 0(%r1)
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	write_rgb_element.2859
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 32
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_char
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	write_rgb_element.2859
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 32
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_char
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 8(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	write_rgb_element.2859
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 10
	J	min_caml_print_char
pretrace_diffuse_rays.2863:
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	ADDI	%r27, %r0, 4
	SLT	%r27, %r27, %r2
	BNE	%r27, %r0, BEQ_else.9040
	SW	%r26, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r5, 12(%r30)
	SW	%r2, 16(%r30)
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	get_surface_id.2841
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9041
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	p_calc_diffuse.2570
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.9042
	J	BEQ_cont.9043
BEQ_else.9042:
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	p_group_id.2576
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	vecbzero.2484
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	p_nvectors.2581
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	p_intersection_points.2566
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 24(%r30) # restore1
	SLL	%r2, %r2, 2
	LW	%r3, 8(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LW	%r3, 16(%r30) # restore1
	SLL	%r4, %r3, 2
	LW	%r5, 28(%r30) # restore1
	ADD	%r29, %r5, %r4
	LW	%r4, 0(%r29)
	SLL	%r5, %r3, 2
	ADD	%r29, %r1, %r5
	LW	%r1, 0(%r29)
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r3, %r1, 0 # args
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r4, 0 # args
	SW	%r29, 32(%r30)
	ADDI	%r30, %r30, 36
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	p_received_ray_20percent.2574
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	LW	%r3, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	veccpy.2486
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.9043:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r2, %r1, 1
	LW	%r1, 20(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9041:
	JR	%r31
BEQ_else.9040:
	JR	%r31
pretrace_pixels.2866:
	LW	%r4, 36(%r26)
	LW	%r5, 32(%r26)
	LW	%r6, 28(%r26)
	LW	%r7, 24(%r26)
	LW	%r8, 20(%r26)
	LW	%r9, 16(%r26)
	LW	%r10, 12(%r26)
	LW	%r11, 8(%r26)
	LW	%r12, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.9046
	LWC1	%f4, 0(%r8)
	LW	%r8, 0(%r12)
	SUB	%r8, %r2, %r8
	SW	%r26, 0(%r30)
	SW	%r11, 4(%r30)
	SW	%r3, 8(%r30)
	SW	%r5, 12(%r30)
	SW	%r1, 16(%r30)
	SW	%r2, 20(%r30)
	SW	%r4, 24(%r30)
	SW	%r6, 28(%r30)
	SW	%r9, 32(%r30)
	SWC1	%f3, 40(%r30)
	SWC1	%f2, 48(%r30)
	SW	%r10, 56(%r30)
	SWC1	%f1, 64(%r30)
	SW	%r7, 72(%r30)
	SWC1	%f4, 80(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r8, 0 # args
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 72(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f2, %f1, %f2
	LWC1	%f3, 64(%r30) # restore2
	ADD.s	%f2, %f2, %f3
	LW	%r2, 56(%r30) # restore1
	SWC1	%f2, 0(%r2)
	LWC1	%f2, 4(%r1)
	MUL.s	%f2, %f1, %f2
	LWC1	%f4, 48(%r30) # restore2
	ADD.s	%f2, %f2, %f4
	SWC1	%f2, 4(%r2)
	LWC1	%f2, 8(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 40(%r30) # restore2
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r2)
	ADDI	%r1, %r0, 0
	ADDI	%r29, %r31, 0
	ADDI	%r25, %r2, 0 # args
	ADDI	%r2, %r1, 0 # args
	ADDI	%r1, %r25, 0 # args
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	vecunit_sgn.2494
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	vecbzero.2484
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	LW	%r2, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	veccpy.2486
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	LW	%r2, 20(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	LA	%r29, l.6001
	LWC1	%f2, 0(%r29)
	LW	%r5, 56(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r5, 0 # args
	SW	%r29, 88(%r30)
	ADDI	%r30, %r30, 92
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 16(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	p_rgb.2564
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	veccpy.2486
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 16(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LW	%r4, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r4, 0 # args
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	p_set_group_id.2578
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 16(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r4, %r0, 0
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r4, 0 # args
	SW	%r29, 88(%r30)
	ADDI	%r30, %r30, 92
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r1, %r1, -1
	ADDI	%r2, %r0, 1
	LW	%r3, 8(%r30) # restore1
	SW	%r1, 88(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	add_mod5.2473
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r3, %r1, 0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 64(%r30) # restore2
	LWC1	%f2, 48(%r30) # restore2
	LWC1	%f3, 40(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 88(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9046:
	JR	%r31
pretrace_line.2873:
	LW	%r4, 24(%r26)
	LW	%r5, 20(%r26)
	LW	%r6, 16(%r26)
	LW	%r7, 12(%r26)
	LW	%r8, 8(%r26)
	LW	%r9, 4(%r26)
	LWC1	%f1, 0(%r6)
	LW	%r6, 4(%r9)
	SUB	%r2, %r2, %r6
	SW	%r3, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r7, 8(%r30)
	SW	%r8, 12(%r30)
	SW	%r4, 16(%r30)
	SW	%r5, 20(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 20(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f2, %f1, %f2
	LW	%r2, 16(%r30) # restore1
	LWC1	%f3, 0(%r2)
	ADD.s	%f2, %f2, %f3
	LWC1	%f3, 4(%r1)
	MUL.s	%f3, %f1, %f3
	LWC1	%f4, 4(%r2)
	ADD.s	%f3, %f3, %f4
	LWC1	%f4, 8(%r1)
	MUL.s	%f1, %f1, %f4
	LWC1	%f4, 8(%r2)
	ADD.s	%f1, %f1, %f4
	LW	%r1, 12(%r30) # restore1
	LW	%r1, 0(%r1)
	ADDI	%r2, %r1, -1
	LW	%r1, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	ADD.s	%f31, %f3, %f0 # args
	ADD.s	%f3, %f1, %f0 # args
	ADD.s	%f1, %f2, %f0 # args
	ADD.s	%f2, %f31, %f0 # args
	LW	%r25, 0(%r26)
	JR	%r25
scan_pixel.2877:
	LW	%r6, 24(%r26)
	LW	%r7, 20(%r26)
	LW	%r8, 16(%r26)
	LW	%r9, 12(%r26)
	LW	%r10, 8(%r26)
	LW	%r11, 4(%r26)
	LW	%r10, 0(%r10)
	SLT	%r27, %r1, %r10
	BNE	%r27, %r0, BEQ_else.9051
	JR	%r31
BEQ_else.9051:
	SLL	%r10, %r1, 2
	ADD	%r29, %r4, %r10
	LW	%r10, 0(%r29)
	SW	%r26, 0(%r30)
	SW	%r6, 4(%r30)
	SW	%r3, 8(%r30)
	SW	%r7, 12(%r30)
	SW	%r11, 16(%r30)
	SW	%r4, 20(%r30)
	SW	%r5, 24(%r30)
	SW	%r2, 28(%r30)
	SW	%r1, 32(%r30)
	SW	%r9, 36(%r30)
	SW	%r8, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r10, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	p_rgb.2564
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 40(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	veccpy.2486
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	LW	%r2, 28(%r30) # restore1
	LW	%r3, 24(%r30) # restore1
	LW	%r26, 36(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30)
	ADDI	%r30, %r30, 48
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.9053
	LW	%r1, 32(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 20(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r4, %r0, 0
	LW	%r26, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r4, 0 # args
	SW	%r29, 44(%r30)
	ADDI	%r30, %r30, 48
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.9054
BEQ_else.9053:
	ADDI	%r6, %r0, 0
	LW	%r1, 32(%r30) # restore1
	LW	%r2, 28(%r30) # restore1
	LW	%r3, 8(%r30) # restore1
	LW	%r4, 20(%r30) # restore1
	LW	%r5, 24(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30)
	ADDI	%r30, %r30, 48
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.9054:
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30)
	ADDI	%r30, %r30, 48
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 28(%r30) # restore1
	LW	%r3, 8(%r30) # restore1
	LW	%r4, 20(%r30) # restore1
	LW	%r5, 24(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
scan_line.2883:
	LW	%r6, 12(%r26)
	LW	%r7, 8(%r26)
	LW	%r8, 4(%r26)
	LW	%r9, 4(%r8)
	SLT	%r27, %r1, %r9
	BNE	%r27, %r0, BEQ_else.9055
	JR	%r31
BEQ_else.9055:
	LW	%r8, 4(%r8)
	ADDI	%r8, %r8, -1
	SW	%r26, 0(%r30)
	SW	%r5, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r3, 12(%r30)
	SW	%r2, 16(%r30)
	SW	%r1, 20(%r30)
	SW	%r6, 24(%r30)
	SLT	%r27, %r8, %r1
	BNE	%r27, %r0, BEQ_else.9057
	J	BEQ_cont.9058
BEQ_else.9057:
	ADDI	%r8, %r1, 1
	ADDI	%r29, %r31, 0
	ADDI	%r3, %r5, 0 # args
	ADDI	%r2, %r8, 0 # args
	ADDI	%r1, %r4, 0 # args
	ADDI	%r26, %r7, 0 # args
	SW	%r29, 28(%r30)
	ADDI	%r30, %r30, 32
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.9058:
	ADDI	%r1, %r0, 0
	LW	%r2, 20(%r30) # restore1
	LW	%r3, 16(%r30) # restore1
	LW	%r4, 12(%r30) # restore1
	LW	%r5, 8(%r30) # restore1
	LW	%r26, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30)
	ADDI	%r30, %r30, 32
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r1, %r1, 1
	ADDI	%r2, %r0, 2
	LW	%r3, 4(%r30) # restore1
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	add_mod5.2473
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r5, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	LW	%r2, 12(%r30) # restore1
	LW	%r3, 8(%r30) # restore1
	LW	%r4, 16(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30)
	ADDI	%r30, %r30, 36
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	JR	%r31
create_float5x3array.2889:
	ADDI	%r1, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 0(%r30) # save link register
	ADDI	%r30, %r30, 4
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 4
	SUB	%r30, %r30, %r29
	LW	%r29, 0(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 5
	ADDI	%r29, %r31, 0
	SW	%r29, 0(%r30) # save link register
	ADDI	%r30, %r30, 4
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 4
	SUB	%r30, %r30, %r29
	LW	%r29, 0(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 4(%r2)
	ADDI	%r1, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 8(%r2)
	ADDI	%r1, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 12(%r2)
	ADDI	%r1, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 16(%r2)
	ADDI	%r1, %r2, 0
	JR	%r31
create_pixel.2891:
	ADDI	%r1, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 0(%r30) # save link register
	ADDI	%r30, %r30, 4
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 4
	SUB	%r30, %r30, %r29
	LW	%r29, 0(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	create_float5x3array.2889
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 5
	ADDI	%r3, %r0, 0
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 5
	ADDI	%r3, %r0, 0
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	create_float5x3array.2889
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	create_float5x3array.2889
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	ADDI	%r3, %r0, 0
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	create_float5x3array.2889
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 32
	SW	%r1, 28(%r2)
	LW	%r1, 24(%r30) # restore1
	SW	%r1, 24(%r2)
	LW	%r1, 20(%r30) # restore1
	SW	%r1, 20(%r2)
	LW	%r1, 16(%r30) # restore1
	SW	%r1, 16(%r2)
	LW	%r1, 12(%r30) # restore1
	SW	%r1, 12(%r2)
	LW	%r1, 8(%r30) # restore1
	SW	%r1, 8(%r2)
	LW	%r1, 4(%r30) # restore1
	SW	%r1, 4(%r2)
	LW	%r1, 0(%r30) # restore1
	SW	%r1, 0(%r2)
	ADDI	%r1, %r2, 0
	JR	%r31
init_line_elements.2893:
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.9060
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	create_pixel.2891
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 0(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	ADDI	%r2, %r2, -1
	ADDI	%r1, %r4, 0 # args
	J	init_line_elements.2893
BEQ_else.9060:
	JR	%r31
create_pixelline.2896:
	LW	%r1, 4(%r26)
	LW	%r2, 0(%r1)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	create_pixel.2891
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	LW	%r2, 0(%r2)
	ADDI	%r2, %r2, -2
	J	init_line_elements.2893
tan.2898:
	SWC1	%f1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_sin
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 0(%r30) # restore2
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_cos
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	JR	%r31
adjust_position.2900:
	MUL.s	%f1, %f1, %f1
	LA	%r29, l.6470
	LWC1	%f3, 0(%r29)
	ADD.s	%f1, %f1, %f3
	SWC1	%f2, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6002
	LWC1	%f2, 0(%r29)
	DIV.s	%f2, %f2, %f1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_atan
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 0(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	tan.2898
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	JR	%r31
calc_dirvec.2903:
	LW	%r4, 4(%r26)
	ADDI	%r27, %r0, 5
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9061
	SW	%r3, 0(%r30)
	SW	%r4, 4(%r30)
	SW	%r2, 8(%r30)
	SWC1	%f1, 16(%r30)
	SWC1	%f2, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LA	%r29, l.6002
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	DIV.s	%f2, %f2, %f1
	LWC1	%f3, 24(%r30) # restore2
	DIV.s	%f3, %f3, %f1
	LA	%r29, l.6002
	LWC1	%f4, 0(%r29)
	DIV.s	%f1, %f4, %f1
	LW	%r1, 8(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 4(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	LW	%r2, 0(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r3, 0(%r29)
	SW	%r1, 40(%r30)
	SWC1	%f1, 48(%r30)
	SWC1	%f3, 56(%r30)
	SWC1	%f2, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	d_vec.2583
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 64(%r30) # restore2
	LWC1	%f2, 56(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	vecset.2476
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r2, %r1, 40
	SLL	%r2, %r2, 2
	LW	%r3, 40(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	d_vec.2583
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 56(%r30) # restore2
	SW	%r1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADD.s	%f3, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 64(%r30) # restore2
	LWC1	%f2, 48(%r30) # restore2
	LW	%r1, 72(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	vecset.2476
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r2, %r1, 80
	SLL	%r2, %r2, 2
	LW	%r3, 40(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	d_vec.2583
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 64(%r30) # restore2
	SW	%r1, 76(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADD.s	%f3, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 48(%r30) # restore2
	LWC1	%f2, 80(%r30) # restore2
	LW	%r1, 76(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	vecset.2476
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r2, %r1, 1
	SLL	%r2, %r2, 2
	LW	%r3, 40(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	d_vec.2583
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 64(%r30) # restore2
	SW	%r1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADD.s	%f3, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 96(%r30) # restore2
	LWC1	%f2, 104(%r30) # restore2
	LW	%r1, 88(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	vecset.2476
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r2, %r1, 41
	SLL	%r2, %r2, 2
	LW	%r3, 40(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	d_vec.2583
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 64(%r30) # restore2
	SW	%r1, 112(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SWC1	%f1, 120(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 128(%r30) # save link register
	ADDI	%r30, %r30, 132
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 132
	SUB	%r30, %r30, %r29
	LW	%r29, 128(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 120(%r30) # restore2
	LWC1	%f3, 56(%r30) # restore2
	LW	%r1, 112(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 128(%r30) # save link register
	ADDI	%r30, %r30, 132
	JAL	vecset.2476
	ADDI	%r29, %r0, 132
	SUB	%r30, %r30, %r29
	LW	%r29, 128(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 81
	SLL	%r1, %r1, 2
	LW	%r2, 40(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 128(%r30) # save link register
	ADDI	%r30, %r30, 132
	JAL	d_vec.2583
	ADDI	%r29, %r0, 132
	SUB	%r30, %r30, %r29
	LW	%r29, 128(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 48(%r30) # restore2
	SW	%r1, 128(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	LWC1	%f3, 56(%r30) # restore2
	LW	%r1, 128(%r30) # restore1
	J	vecset.2476
BEQ_else.9061:
	SWC1	%f3, 136(%r30)
	SW	%r3, 0(%r30)
	SW	%r2, 8(%r30)
	SW	%r26, 144(%r30)
	SWC1	%f4, 152(%r30)
	SW	%r1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	ADD.s	%f2, %f3, %f0 # args
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	adjust_position.2900
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 160(%r30) # restore1
	ADDI	%r1, %r1, 1
	LWC1	%f2, 152(%r30) # restore2
	SWC1	%f1, 168(%r30)
	SW	%r1, 176(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	adjust_position.2900
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 168(%r30) # restore2
	LWC1	%f3, 136(%r30) # restore2
	LWC1	%f4, 152(%r30) # restore2
	LW	%r1, 176(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 144(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
calc_dirvecs.2911:
	LW	%r4, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9069
	SW	%r26, 0(%r30)
	SW	%r1, 4(%r30)
	SWC1	%f1, 8(%r30)
	SW	%r3, 16(%r30)
	SW	%r2, 20(%r30)
	SW	%r4, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6582
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.6583
	LWC1	%f2, 0(%r29)
	SUB.s	%f3, %f1, %f2
	ADDI	%r1, %r0, 0
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	LA	%r29, l.6001
	LWC1	%f2, 0(%r29)
	LWC1	%f4, 8(%r30) # restore2
	LW	%r2, 20(%r30) # restore1
	LW	%r3, 16(%r30) # restore1
	LW	%r26, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30)
	ADDI	%r30, %r30, 32
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6582
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.6470
	LWC1	%f2, 0(%r29)
	ADD.s	%f3, %f1, %f2
	ADDI	%r1, %r0, 0
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	LA	%r29, l.6001
	LWC1	%f2, 0(%r29)
	LW	%r2, 16(%r30) # restore1
	ADDI	%r3, %r2, 2
	LWC1	%f4, 8(%r30) # restore2
	LW	%r4, 20(%r30) # restore1
	LW	%r26, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	SW	%r29, 28(%r30)
	ADDI	%r30, %r30, 32
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, -1
	ADDI	%r2, %r0, 1
	LW	%r3, 20(%r30) # restore1
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	add_mod5.2473
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 8(%r30) # restore2
	LW	%r1, 28(%r30) # restore1
	LW	%r3, 16(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9069:
	JR	%r31
calc_dirvec_rows.2916:
	LW	%r4, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9071
	SW	%r26, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r3, 8(%r30)
	SW	%r2, 12(%r30)
	SW	%r4, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6582
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.6583
	LWC1	%f2, 0(%r29)
	SUB.s	%f1, %f1, %f2
	ADDI	%r1, %r0, 4
	LW	%r2, 12(%r30) # restore1
	LW	%r3, 8(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, -1
	ADDI	%r2, %r0, 2
	LW	%r3, 12(%r30) # restore1
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 24(%r30) # save link register
	ADDI	%r30, %r30, 28
	JAL	add_mod5.2473
	ADDI	%r29, %r0, 28
	SUB	%r30, %r30, %r29
	LW	%r29, 24(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	ADDI	%r3, %r1, 4
	LW	%r1, 20(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9071:
	JR	%r31
create_dirvec.2920:
	LW	%r1, 4(%r26)
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	LW	%r1, 0(%r1)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 8
	SW	%r1, 4(%r2)
	LW	%r1, 4(%r30) # restore1
	SW	%r1, 0(%r2)
	ADDI	%r1, %r2, 0
	JR	%r31
create_dirvec_elements.2922:
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.9073
	SW	%r26, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r2, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r26, %r3, 0 # args
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 8(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 4(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	ADDI	%r2, %r2, -1
	LW	%r26, 0(%r30) # restore1
	ADDI	%r1, %r4, 0 # args
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9073:
	JR	%r31
create_dirvecs.2925:
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9075
	ADDI	%r5, %r0, 120
	SW	%r26, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r2, 8(%r30)
	SW	%r1, 12(%r30)
	SW	%r5, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r26, %r4, 0 # args
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 8(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	SLL	%r1, %r2, 2
	ADD	%r29, %r4, %r1
	LW	%r1, 0(%r29)
	ADDI	%r3, %r0, 118
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, -1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9075:
	JR	%r31
init_dirvec_constants.2927:
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.9077
	SLL	%r4, %r2, 2
	ADD	%r29, %r1, %r4
	LW	%r4, 0(%r29)
	SW	%r1, 0(%r30)
	SW	%r26, 4(%r30)
	SW	%r2, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r4, 0 # args
	ADDI	%r26, %r3, 0 # args
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	ADDI	%r2, %r1, -1
	LW	%r1, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9077:
	JR	%r31
init_vecset_constants.2930:
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9079
	SLL	%r4, %r1, 2
	ADD	%r29, %r3, %r4
	LW	%r3, 0(%r29)
	ADDI	%r4, %r0, 119
	SW	%r26, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	ADDI	%r26, %r2, 0 # args
	ADDI	%r2, %r4, 0 # args
	SW	%r29, 8(%r30)
	ADDI	%r30, %r30, 12
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, -1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9079:
	JR	%r31
init_dirvecs.2932:
	LW	%r1, 12(%r26)
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	ADDI	%r4, %r0, 4
	SW	%r1, 0(%r30)
	SW	%r3, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r4, 0 # args
	ADDI	%r26, %r2, 0 # args
	SW	%r29, 8(%r30)
	ADDI	%r30, %r30, 12
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 9
	ADDI	%r2, %r0, 0
	ADDI	%r3, %r0, 0
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 8(%r30)
	ADDI	%r30, %r30, 12
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 4
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
add_reflection.2934:
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r26, 4(%r26)
	SW	%r4, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r2, 8(%r30)
	SWC1	%f1, 16(%r30)
	SW	%r3, 24(%r30)
	SWC1	%f4, 32(%r30)
	SWC1	%f3, 40(%r30)
	SWC1	%f2, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30)
	ADDI	%r30, %r30, 60
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	d_vec.2583
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 48(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 32(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	vecset.2476
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 56(%r30) # restore1
	LW	%r26, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30)
	ADDI	%r30, %r30, 64
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r28, 0
	ADDI	%r28, %r28, 16
	LWC1	%f1, 16(%r30) # restore2
	SWC1	%f1, 8(%r1)
	LW	%r2, 56(%r30) # restore1
	SW	%r2, 4(%r1)
	LW	%r2, 8(%r30) # restore1
	SW	%r2, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	SLL	%r2, %r2, 2
	LW	%r3, 0(%r30) # restore1
	ADD	%r29, %r3, %r2
	SW	%r1, 0(%r29)
	JR	%r31
setup_rect_reflection.2941:
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	ADDI	%r1, %r1, 4
	LW	%r6, 0(%r3)
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	SW	%r3, 0(%r30)
	SW	%r6, 4(%r30)
	SW	%r5, 8(%r30)
	SW	%r1, 12(%r30)
	SW	%r4, 16(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	o_diffuse.2546
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	LWC1	%f2, 0(%r1)
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADD.s	%f4, %f1, %f0
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	ADDI	%r2, %r1, 1
	LW	%r3, 16(%r30) # restore1
	LWC1	%f2, 0(%r3)
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	LW	%r4, 4(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	SWC1	%f4, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 64(%r30)
	ADDI	%r30, %r30, 68
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r2, %r1, 1
	LW	%r3, 12(%r30) # restore1
	ADDI	%r4, %r3, 2
	LW	%r5, 16(%r30) # restore1
	LWC1	%f3, 4(%r5)
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f4, 56(%r30) # restore2
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r4, 0 # args
	SW	%r29, 64(%r30)
	ADDI	%r30, %r30, 68
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r2, %r1, 2
	LW	%r3, 12(%r30) # restore1
	ADDI	%r3, %r3, 3
	LW	%r4, 16(%r30) # restore1
	LWC1	%f4, 8(%r4)
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 64(%r30)
	ADDI	%r30, %r30, 68
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, 3
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 0(%r2)
	JR	%r31
setup_surface_reflection.2944:
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	ADDI	%r1, %r1, 4
	ADDI	%r1, %r1, 1
	LW	%r6, 0(%r3)
	LA	%r29, l.6002
	LWC1	%f1, 0(%r29)
	SW	%r3, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r6, 8(%r30)
	SW	%r5, 12(%r30)
	SW	%r4, 16(%r30)
	SW	%r2, 20(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 32(%r30) # save link register
	ADDI	%r30, %r30, 36
	JAL	o_diffuse.2546
	ADDI	%r29, %r0, 36
	SUB	%r30, %r30, %r29
	LW	%r29, 32(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	o_param_abc.2538
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	veciprod.2497
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6150
	LWC1	%f2, 0(%r29)
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 40(%r30)
	SWC1	%f2, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	o_param_a.2532
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 16(%r30) # restore1
	LWC1	%f3, 0(%r1)
	SUB.s	%f1, %f1, %f3
	LA	%r29, l.6150
	LWC1	%f3, 0(%r29)
	LW	%r2, 20(%r30) # restore1
	SWC1	%f1, 56(%r30)
	SWC1	%f3, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	o_param_b.2534
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 16(%r30) # restore1
	LWC1	%f3, 4(%r1)
	SUB.s	%f1, %f1, %f3
	LA	%r29, l.6150
	LWC1	%f3, 0(%r29)
	LW	%r2, 20(%r30) # restore1
	SWC1	%f1, 72(%r30)
	SWC1	%f3, 80(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	o_param_c.2536
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 16(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SUB.s	%f4, %f1, %f2
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 56(%r30) # restore2
	LWC1	%f3, 72(%r30) # restore2
	LW	%r1, 8(%r30) # restore1
	LW	%r2, 4(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 88(%r30)
	ADDI	%r30, %r30, 92
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 0(%r2)
	JR	%r31
setup_reflections.2947:
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9087
	SLL	%r5, %r1, 2
	ADD	%r29, %r4, %r5
	LW	%r4, 0(%r29)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r3, 8(%r30)
	SW	%r4, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	o_reflectiontype.2526
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.9088
	LW	%r1, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	o_diffuse.2546
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6002
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_fless
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.9089
	JR	%r31
BEQ_else.9089:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	o_form.2524
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.9091
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 12(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9091:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.9092
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 12(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9092:
	JR	%r31
BEQ_else.9088:
	JR	%r31
BEQ_else.9087:
	JR	%r31
rt.2949:
	LW	%r3, 56(%r26)
	LW	%r4, 52(%r26)
	LW	%r5, 48(%r26)
	LW	%r6, 44(%r26)
	LW	%r7, 40(%r26)
	LW	%r8, 36(%r26)
	LW	%r9, 32(%r26)
	LW	%r10, 28(%r26)
	LW	%r11, 24(%r26)
	LW	%r12, 20(%r26)
	LW	%r13, 16(%r26)
	LW	%r14, 12(%r26)
	LW	%r15, 8(%r26)
	LW	%r16, 4(%r26)
	SW	%r1, 0(%r14)
	SW	%r2, 4(%r14)
	ADDI	%r14, %r1, -2
	SW	%r14, 0(%r15)
	ADDI	%r2, %r2, -2
	SW	%r2, 4(%r15)
	LA	%r29, l.6616
	LWC1	%f1, 0(%r29)
	SW	%r7, 0(%r30)
	SW	%r9, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r10, 12(%r30)
	SW	%r5, 16(%r30)
	SW	%r12, 20(%r30)
	SW	%r11, 24(%r30)
	SW	%r13, 28(%r30)
	SW	%r3, 32(%r30)
	SW	%r8, 36(%r30)
	SW	%r16, 40(%r30)
	SW	%r6, 44(%r30)
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r26, 40(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 56(%r30)
	ADDI	%r30, %r30, 60
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 40(%r30) # restore1
	SW	%r1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30)
	ADDI	%r30, %r30, 64
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 40(%r30) # restore1
	SW	%r1, 60(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 64(%r30)
	ADDI	%r30, %r30, 68
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 36(%r30) # restore1
	SW	%r1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 28(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	d_vec.2583
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	veccpy.2486
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	LW	%r1, 0(%r1)
	ADDI	%r1, %r1, -1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 0
	ADDI	%r3, %r0, 0
	LW	%r1, 60(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	ADDI	%r5, %r0, 2
	LW	%r2, 56(%r30) # restore1
	LW	%r3, 60(%r30) # restore1
	LW	%r4, 64(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
_min_caml_start: # main entry point
	SUB	%r0, %r0, %r0
	ADDI	%r28, %r0, 32668
   # main program start
	ADDI	%r1, %r0, 1
	ADDI	%r2, %r0, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 0(%r30) # save link register
	ADDI	%r30, %r30, 4
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 4
	SUB	%r30, %r30, %r29
	LW	%r29, 0(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 0
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 60
	ADDI	%r3, %r0, 0
	ADDI	%r4, %r0, 0
	ADDI	%r5, %r0, 0
	ADDI	%r6, %r0, 0
	ADDI	%r7, %r0, 0
	ADDI	%r8, %r28, 0
	ADDI	%r28, %r28, 48
	SW	%r1, 40(%r8)
	SW	%r1, 36(%r8)
	SW	%r1, 32(%r8)
	SW	%r1, 28(%r8)
	SW	%r7, 24(%r8)
	SW	%r1, 20(%r8)
	SW	%r1, 16(%r8)
	SW	%r6, 12(%r8)
	SW	%r5, 8(%r8)
	SW	%r4, 4(%r8)
	SW	%r3, 0(%r8)
	ADDI	%r1, %r8, 0
	ADDI	%r29, %r31, 0
	ADDI	%r25, %r2, 0 # args
	ADDI	%r2, %r1, 0 # args
	ADDI	%r1, %r25, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 8(%r30) # save link register
	ADDI	%r30, %r30, 12
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 12
	SUB	%r30, %r30, %r29
	LW	%r29, 8(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 16(%r30) # save link register
	ADDI	%r30, %r30, 20
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 20
	SUB	%r30, %r30, %r29
	LW	%r29, 16(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.6429
	LWC1	%f1, 0(%r29)
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 50
	ADDI	%r3, %r0, 1
	ADDI	%r4, %r0, 1
	SUB	%r29, %r0, %r4
	ADDI	%r4, %r29, 0
	SW	%r1, 20(%r30)
	SW	%r2, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	ADDI	%r3, %r0, 1
	LW	%r4, 0(%r1)
	SW	%r1, 28(%r30)
	SW	%r2, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 36(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 40(%r30) # save link register
	ADDI	%r30, %r30, 44
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 44
	SUB	%r30, %r30, %r29
	LW	%r29, 40(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	ADDI	%r3, %r0, 0
	SW	%r1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.6375
	LWC1	%f1, 0(%r29)
	SW	%r1, 44(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 48(%r30) # save link register
	ADDI	%r30, %r30, 52
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 52
	SUB	%r30, %r30, %r29
	LW	%r29, 48(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	ADDI	%r3, %r0, 0
	SW	%r1, 52(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 56(%r30) # save link register
	ADDI	%r30, %r30, 60
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 60
	SUB	%r30, %r30, %r29
	LW	%r29, 56(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 60(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 64(%r30) # save link register
	ADDI	%r30, %r30, 68
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 68
	SUB	%r30, %r30, %r29
	LW	%r29, 64(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 68(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 72(%r30) # save link register
	ADDI	%r30, %r30, 76
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 76
	SUB	%r30, %r30, %r29
	LW	%r29, 72(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 2
	ADDI	%r3, %r0, 0
	SW	%r1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 2
	ADDI	%r3, %r0, 0
	SW	%r1, 76(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 80(%r30) # save link register
	ADDI	%r30, %r30, 84
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 84
	SUB	%r30, %r30, %r29
	LW	%r29, 80(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 84(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 88(%r30) # save link register
	ADDI	%r30, %r30, 92
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 92
	SUB	%r30, %r30, %r29
	LW	%r29, 88(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 88(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 92(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 96(%r30) # save link register
	ADDI	%r30, %r30, 100
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 100
	SUB	%r30, %r30, %r29
	LW	%r29, 96(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 96(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 100(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 104(%r30) # save link register
	ADDI	%r30, %r30, 108
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 108
	SUB	%r30, %r30, %r29
	LW	%r29, 104(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 104(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 0
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 108(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 112(%r30) # save link register
	ADDI	%r30, %r30, 116
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 116
	SUB	%r30, %r30, %r29
	LW	%r29, 112(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	SW	%r2, 112(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 0
	ADDI	%r3, %r28, 0
	ADDI	%r28, %r28, 8
	SW	%r1, 4(%r3)
	LW	%r1, 112(%r30) # restore1
	SW	%r1, 0(%r3)
	ADDI	%r1, %r3, 0
	ADDI	%r29, %r31, 0
	ADDI	%r25, %r2, 0 # args
	ADDI	%r2, %r1, 0 # args
	ADDI	%r1, %r25, 0 # args
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 5
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 0
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 116(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 120(%r30) # save link register
	ADDI	%r30, %r30, 124
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 124
	SUB	%r30, %r30, %r29
	LW	%r29, 120(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 120(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 60
	LW	%r3, 120(%r30) # restore1
	SW	%r1, 124(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 128(%r30) # save link register
	ADDI	%r30, %r30, 132
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 132
	SUB	%r30, %r30, %r29
	LW	%r29, 128(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 8
	SW	%r1, 4(%r2)
	LW	%r1, 124(%r30) # restore1
	SW	%r1, 0(%r2)
	ADDI	%r1, %r2, 0
	ADDI	%r2, %r0, 0
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	SW	%r1, 128(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	SW	%r2, 132(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 136(%r30) # save link register
	ADDI	%r30, %r30, 140
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 140
	SUB	%r30, %r30, %r29
	LW	%r29, 136(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 8
	SW	%r1, 4(%r2)
	LW	%r1, 132(%r30) # restore1
	SW	%r1, 0(%r2)
	ADDI	%r1, %r2, 0
	ADDI	%r2, %r0, 180
	ADDI	%r3, %r0, 0
	LA	%r29, l.6001
	LWC1	%f1, 0(%r29)
	ADDI	%r4, %r28, 0
	ADDI	%r28, %r28, 16
	SWC1	%f1, 8(%r4)
	SW	%r1, 4(%r4)
	SW	%r3, 0(%r4)
	ADDI	%r1, %r4, 0
	ADDI	%r29, %r31, 0
	ADDI	%r25, %r2, 0 # args
	ADDI	%r2, %r1, 0 # args
	ADDI	%r1, %r25, 0 # args
	SW	%r29, 136(%r30) # save link register
	ADDI	%r30, %r30, 140
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 140
	SUB	%r30, %r30, %r29
	LW	%r29, 136(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	ADDI	%r3, %r0, 0
	SW	%r1, 136(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 140(%r30) # save link register
	ADDI	%r30, %r30, 144
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r3, read_screen_settings.2595
	SW	%r3, 0(%r2)
	LW	%r3, 12(%r30) # restore1
	SW	%r3, 20(%r2)
	LW	%r4, 104(%r30) # restore1
	SW	%r4, 16(%r2)
	LW	%r5, 100(%r30) # restore1
	SW	%r5, 12(%r2)
	LW	%r6, 96(%r30) # restore1
	SW	%r6, 8(%r2)
	LW	%r7, 8(%r30) # restore1
	SW	%r7, 4(%r2)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r8, read_light.2597
	SW	%r8, 0(%r7)
	LW	%r8, 16(%r30) # restore1
	SW	%r8, 8(%r7)
	LW	%r9, 20(%r30) # restore1
	SW	%r9, 4(%r7)
	ADDI	%r10, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r11, read_nth_object.2602
	SW	%r11, 0(%r10)
	LW	%r11, 4(%r30) # restore1
	SW	%r11, 4(%r10)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r13, read_object.2604
	SW	%r13, 0(%r12)
	SW	%r10, 8(%r12)
	LW	%r10, 0(%r30) # restore1
	SW	%r10, 4(%r12)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, read_all_object.2606
	SW	%r14, 0(%r13)
	SW	%r12, 4(%r13)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, read_and_network.2612
	SW	%r14, 0(%r12)
	LW	%r14, 28(%r30) # restore1
	SW	%r14, 4(%r12)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r16, read_parameter.2614
	SW	%r16, 0(%r15)
	SW	%r2, 20(%r15)
	SW	%r7, 16(%r15)
	SW	%r12, 12(%r15)
	SW	%r13, 8(%r15)
	LW	%r2, 36(%r30) # restore1
	SW	%r2, 4(%r15)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r12, solver_rect_surface.2616
	SW	%r12, 0(%r7)
	LW	%r12, 40(%r30) # restore1
	SW	%r12, 4(%r7)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, solver_rect.2625
	SW	%r16, 0(%r13)
	SW	%r7, 4(%r13)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, solver_surface.2631
	SW	%r16, 0(%r7)
	SW	%r12, 4(%r7)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, solver_second.2650
	SW	%r17, 0(%r16)
	SW	%r12, 4(%r16)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r18, solver.2656
	SW	%r18, 0(%r17)
	SW	%r7, 16(%r17)
	SW	%r16, 12(%r17)
	SW	%r13, 8(%r17)
	SW	%r11, 4(%r17)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r13, solver_rect_fast.2660
	SW	%r13, 0(%r7)
	SW	%r12, 4(%r7)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, solver_surface_fast.2667
	SW	%r16, 0(%r13)
	SW	%r12, 4(%r13)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r18, solver_second_fast.2673
	SW	%r18, 0(%r16)
	SW	%r12, 4(%r16)
	ADDI	%r18, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r19, solver_fast.2679
	SW	%r19, 0(%r18)
	SW	%r13, 16(%r18)
	SW	%r16, 12(%r18)
	SW	%r7, 8(%r18)
	SW	%r11, 4(%r18)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, solver_surface_fast2.2683
	SW	%r16, 0(%r13)
	SW	%r12, 4(%r13)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r19, solver_second_fast2.2690
	SW	%r19, 0(%r16)
	SW	%r12, 4(%r16)
	ADDI	%r19, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r20, solver_fast2.2697
	SW	%r20, 0(%r19)
	SW	%r13, 16(%r19)
	SW	%r16, 12(%r19)
	SW	%r7, 8(%r19)
	SW	%r11, 4(%r19)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r13, iter_setup_dirvec_constants.2709
	SW	%r13, 0(%r7)
	SW	%r11, 4(%r7)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r16, setup_dirvec_constants.2712
	SW	%r16, 0(%r13)
	SW	%r10, 8(%r13)
	SW	%r7, 4(%r13)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, setup_startp_constants.2714
	SW	%r16, 0(%r7)
	SW	%r11, 4(%r7)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r20, setup_startp.2717
	SW	%r20, 0(%r16)
	LW	%r20, 92(%r30) # restore1
	SW	%r20, 12(%r16)
	SW	%r7, 8(%r16)
	SW	%r10, 4(%r16)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r21, check_all_inside.2739
	SW	%r21, 0(%r7)
	SW	%r11, 4(%r7)
	ADDI	%r21, %r28, 0
	ADDI	%r28, %r28, 32
	LA	%r22, shadow_check_and_group.2745
	SW	%r22, 0(%r21)
	SW	%r18, 28(%r21)
	SW	%r12, 24(%r21)
	SW	%r11, 20(%r21)
	LW	%r22, 128(%r30) # restore1
	SW	%r22, 16(%r21)
	SW	%r8, 12(%r21)
	LW	%r23, 52(%r30) # restore1
	SW	%r23, 8(%r21)
	SW	%r7, 4(%r21)
	ADDI	%r24, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r25, shadow_check_one_or_group.2748
	SW	%r25, 0(%r24)
	SW	%r21, 8(%r24)
	SW	%r14, 4(%r24)
	ADDI	%r21, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r25, shadow_check_one_or_matrix.2751
	SW	%r25, 0(%r21)
	SW	%r18, 20(%r21)
	SW	%r12, 16(%r21)
	SW	%r24, 12(%r21)
	SW	%r22, 8(%r21)
	SW	%r23, 4(%r21)
	ADDI	%r18, %r28, 0
	ADDI	%r28, %r28, 40
	LA	%r24, solve_each_element.2754
	SW	%r24, 0(%r18)
	LW	%r24, 48(%r30) # restore1
	SW	%r24, 36(%r18)
	LW	%r25, 88(%r30) # restore1
	SW	%r25, 32(%r18)
	SW	%r12, 28(%r18)
	SW	%r17, 24(%r18)
	SW	%r11, 20(%r18)
	LW	%r26, 44(%r30) # restore1
	SW	%r26, 16(%r18)
	SW	%r23, 12(%r18)
	LW	%r22, 56(%r30) # restore1
	SW	%r22, 8(%r18)
	SW	%r7, 4(%r18)
	SW	%r15, 140(%r30)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 16
	SW	%r13, 144(%r30)
	LA	%r13, solve_one_or_network.2758
	SW	%r13, 0(%r15)
	SW	%r18, 8(%r15)
	SW	%r14, 4(%r15)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r18, trace_or_matrix.2762
	SW	%r18, 0(%r13)
	SW	%r24, 20(%r13)
	SW	%r25, 16(%r13)
	SW	%r12, 12(%r13)
	SW	%r17, 8(%r13)
	SW	%r15, 4(%r13)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r17, judge_intersection.2766
	SW	%r17, 0(%r15)
	SW	%r13, 12(%r15)
	SW	%r24, 8(%r15)
	SW	%r2, 4(%r15)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 40
	LA	%r17, solve_each_element_fast.2768
	SW	%r17, 0(%r13)
	SW	%r24, 36(%r13)
	SW	%r20, 32(%r13)
	SW	%r19, 28(%r13)
	SW	%r12, 24(%r13)
	SW	%r11, 20(%r13)
	SW	%r26, 16(%r13)
	SW	%r23, 12(%r13)
	SW	%r22, 8(%r13)
	SW	%r7, 4(%r13)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r17, solve_one_or_network_fast.2772
	SW	%r17, 0(%r7)
	SW	%r13, 8(%r7)
	SW	%r14, 4(%r7)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r14, trace_or_matrix_fast.2776
	SW	%r14, 0(%r13)
	SW	%r24, 16(%r13)
	SW	%r19, 12(%r13)
	SW	%r12, 8(%r13)
	SW	%r7, 4(%r13)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r12, judge_intersection_fast.2780
	SW	%r12, 0(%r7)
	SW	%r13, 12(%r7)
	SW	%r24, 8(%r7)
	SW	%r2, 4(%r7)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r13, get_nvector_rect.2782
	SW	%r13, 0(%r12)
	LW	%r13, 60(%r30) # restore1
	SW	%r13, 8(%r12)
	SW	%r26, 4(%r12)
	ADDI	%r14, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, get_nvector_plane.2784
	SW	%r17, 0(%r14)
	SW	%r13, 4(%r14)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r18, get_nvector_second.2786
	SW	%r18, 0(%r17)
	SW	%r13, 8(%r17)
	SW	%r23, 4(%r17)
	ADDI	%r18, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r19, get_nvector.2788
	SW	%r19, 0(%r18)
	SW	%r17, 12(%r18)
	SW	%r12, 8(%r18)
	SW	%r14, 4(%r18)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, utexture.2791
	SW	%r14, 0(%r12)
	LW	%r14, 64(%r30) # restore1
	SW	%r14, 4(%r12)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r19, add_light.2794
	SW	%r19, 0(%r17)
	SW	%r14, 8(%r17)
	LW	%r19, 72(%r30) # restore1
	SW	%r19, 4(%r17)
	ADDI	%r20, %r28, 0
	ADDI	%r28, %r28, 40
	LA	%r10, trace_reflections.2798
	SW	%r10, 0(%r20)
	SW	%r21, 32(%r20)
	LW	%r10, 136(%r30) # restore1
	SW	%r10, 28(%r20)
	SW	%r2, 24(%r20)
	SW	%r13, 20(%r20)
	SW	%r7, 16(%r20)
	SW	%r26, 12(%r20)
	SW	%r22, 8(%r20)
	SW	%r17, 4(%r20)
	ADDI	%r10, %r28, 0
	ADDI	%r28, %r28, 88
	LA	%r5, trace_ray.2803
	SW	%r5, 0(%r10)
	SW	%r12, 80(%r10)
	SW	%r20, 76(%r10)
	SW	%r24, 72(%r10)
	SW	%r14, 68(%r10)
	SW	%r25, 64(%r10)
	SW	%r21, 60(%r10)
	SW	%r16, 56(%r10)
	SW	%r19, 52(%r10)
	SW	%r2, 48(%r10)
	SW	%r11, 44(%r10)
	SW	%r13, 40(%r10)
	SW	%r1, 36(%r10)
	SW	%r8, 32(%r10)
	SW	%r15, 28(%r10)
	SW	%r26, 24(%r10)
	SW	%r23, 20(%r10)
	SW	%r22, 16(%r10)
	SW	%r18, 12(%r10)
	SW	%r9, 8(%r10)
	SW	%r17, 4(%r10)
	ADDI	%r5, %r28, 0
	ADDI	%r28, %r28, 56
	LA	%r9, trace_diffuse_ray.2809
	SW	%r9, 0(%r5)
	SW	%r12, 48(%r5)
	SW	%r14, 44(%r5)
	SW	%r21, 40(%r5)
	SW	%r2, 36(%r5)
	SW	%r11, 32(%r5)
	SW	%r13, 28(%r5)
	SW	%r8, 24(%r5)
	SW	%r7, 20(%r5)
	SW	%r23, 16(%r5)
	SW	%r22, 12(%r5)
	SW	%r18, 8(%r5)
	LW	%r2, 68(%r30) # restore1
	SW	%r2, 4(%r5)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r9, iter_trace_diffuse_rays.2812
	SW	%r9, 0(%r7)
	SW	%r5, 4(%r7)
	ADDI	%r5, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r9, trace_diffuse_rays.2817
	SW	%r9, 0(%r5)
	SW	%r16, 8(%r5)
	SW	%r7, 4(%r5)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r9, trace_diffuse_ray_80percent.2821
	SW	%r9, 0(%r7)
	SW	%r5, 8(%r7)
	LW	%r9, 116(%r30) # restore1
	SW	%r9, 4(%r7)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r13, calc_diffuse_using_1point.2825
	SW	%r13, 0(%r12)
	SW	%r7, 12(%r12)
	SW	%r19, 8(%r12)
	SW	%r2, 4(%r12)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r13, calc_diffuse_using_5points.2828
	SW	%r13, 0(%r7)
	SW	%r19, 8(%r7)
	SW	%r2, 4(%r7)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, do_without_neighbors.2834
	SW	%r14, 0(%r13)
	SW	%r12, 4(%r13)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, neighbors_exist.2837
	SW	%r14, 0(%r12)
	LW	%r14, 76(%r30) # restore1
	SW	%r14, 4(%r12)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r16, try_exploit_neighbors.2850
	SW	%r16, 0(%r15)
	SW	%r13, 8(%r15)
	SW	%r7, 4(%r15)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, write_ppm_header.2857
	SW	%r16, 0(%r7)
	SW	%r14, 4(%r7)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, write_rgb.2861
	SW	%r17, 0(%r16)
	SW	%r19, 4(%r16)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r18, pretrace_diffuse_rays.2863
	SW	%r18, 0(%r17)
	SW	%r5, 12(%r17)
	SW	%r9, 8(%r17)
	SW	%r2, 4(%r17)
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 40
	LA	%r5, pretrace_pixels.2866
	SW	%r5, 0(%r2)
	SW	%r3, 36(%r2)
	SW	%r10, 32(%r2)
	SW	%r25, 28(%r2)
	SW	%r6, 24(%r2)
	LW	%r3, 84(%r30) # restore1
	SW	%r3, 20(%r2)
	SW	%r19, 16(%r2)
	LW	%r5, 108(%r30) # restore1
	SW	%r5, 12(%r2)
	SW	%r17, 8(%r2)
	LW	%r5, 80(%r30) # restore1
	SW	%r5, 4(%r2)
	ADDI	%r6, %r28, 0
	ADDI	%r28, %r28, 32
	LA	%r10, pretrace_line.2873
	SW	%r10, 0(%r6)
	SW	%r4, 24(%r6)
	LW	%r4, 100(%r30) # restore1
	SW	%r4, 20(%r6)
	SW	%r3, 16(%r6)
	SW	%r2, 12(%r6)
	SW	%r14, 8(%r6)
	SW	%r5, 4(%r6)
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 32
	LA	%r4, scan_pixel.2877
	SW	%r4, 0(%r2)
	SW	%r16, 24(%r2)
	SW	%r15, 20(%r2)
	SW	%r19, 16(%r2)
	SW	%r12, 12(%r2)
	SW	%r14, 8(%r2)
	SW	%r13, 4(%r2)
	ADDI	%r4, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r10, scan_line.2883
	SW	%r10, 0(%r4)
	SW	%r2, 12(%r4)
	SW	%r6, 8(%r4)
	SW	%r14, 4(%r4)
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r10, create_pixelline.2896
	SW	%r10, 0(%r2)
	SW	%r14, 4(%r2)
	ADDI	%r10, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r12, calc_dirvec.2903
	SW	%r12, 0(%r10)
	SW	%r9, 4(%r10)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r13, calc_dirvecs.2911
	SW	%r13, 0(%r12)
	SW	%r10, 4(%r12)
	ADDI	%r10, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r13, calc_dirvec_rows.2916
	SW	%r13, 0(%r10)
	SW	%r12, 4(%r10)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r13, create_dirvec.2920
	SW	%r13, 0(%r12)
	LW	%r13, 0(%r30) # restore1
	SW	%r13, 4(%r12)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, create_dirvec_elements.2922
	SW	%r16, 0(%r15)
	SW	%r12, 4(%r15)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r17, create_dirvecs.2925
	SW	%r17, 0(%r16)
	SW	%r9, 12(%r16)
	SW	%r15, 8(%r16)
	SW	%r12, 4(%r16)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, init_dirvec_constants.2927
	SW	%r17, 0(%r15)
	LW	%r17, 144(%r30) # restore1
	SW	%r17, 4(%r15)
	ADDI	%r18, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r19, init_vecset_constants.2930
	SW	%r19, 0(%r18)
	SW	%r15, 8(%r18)
	SW	%r9, 4(%r18)
	ADDI	%r9, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r15, init_dirvecs.2932
	SW	%r15, 0(%r9)
	SW	%r18, 12(%r9)
	SW	%r16, 8(%r9)
	SW	%r10, 4(%r9)
	ADDI	%r10, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r15, add_reflection.2934
	SW	%r15, 0(%r10)
	SW	%r17, 12(%r10)
	LW	%r15, 136(%r30) # restore1
	SW	%r15, 8(%r10)
	SW	%r12, 4(%r10)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r15, setup_rect_reflection.2941
	SW	%r15, 0(%r12)
	SW	%r1, 12(%r12)
	SW	%r8, 8(%r12)
	SW	%r10, 4(%r12)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r16, setup_surface_reflection.2944
	SW	%r16, 0(%r15)
	SW	%r1, 12(%r15)
	SW	%r8, 8(%r15)
	SW	%r10, 4(%r15)
	ADDI	%r1, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r10, setup_reflections.2947
	SW	%r10, 0(%r1)
	SW	%r15, 12(%r1)
	SW	%r12, 8(%r1)
	SW	%r11, 4(%r1)
	ADDI	%r26, %r28, 0
	ADDI	%r28, %r28, 64
	LA	%r10, rt.2949
	SW	%r10, 0(%r26)
	SW	%r7, 56(%r26)
	SW	%r1, 52(%r26)
	SW	%r17, 48(%r26)
	SW	%r3, 44(%r26)
	SW	%r4, 40(%r26)
	LW	%r1, 140(%r30) # restore1
	SW	%r1, 36(%r26)
	SW	%r6, 32(%r26)
	SW	%r13, 28(%r26)
	LW	%r1, 128(%r30) # restore1
	SW	%r1, 24(%r26)
	SW	%r8, 20(%r26)
	SW	%r9, 16(%r26)
	SW	%r14, 12(%r26)
	SW	%r5, 8(%r26)
	SW	%r2, 4(%r26)
	ADDI	%r1, %r0, 512
	ADDI	%r2, %r0, 512
	ADDI	%r29, %r31, 0
	SW	%r29, 148(%r30)
	ADDI	%r30, %r30, 152
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
   # main program end
