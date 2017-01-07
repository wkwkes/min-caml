	.data
l.6584:	 # 128.000000
	.word	1124073472
l.6551:	 # 0.900000
	.word	1063675494
l.6550:	 # 0.200000
	.word	1045220557
l.6456:	 # 150.000000
	.word	1125515264
l.6454:	 # -150.000000
	.word	-1021968384
l.6438:	 # 0.100000
	.word	1036831949
l.6435:	 # -2.000000
	.word	-1073741824
l.6433:	 # 0.003906
	.word	998244352
l.6411:	 # 20.000000
	.word	1101004800
l.6410:	 # 0.050000
	.word	1028443341
l.6406:	 # 0.250000
	.word	1048576000
l.6402:	 # 10.000000
	.word	1092616192
l.6398:	 # 0.300000
	.word	1050253722
l.6397:	 # 255.000000
	.word	1132396544
l.6396:	 # 0.500000
	.word	1056964608
l.6395:	 # 0.150000
	.word	1041865114
l.6393:	 # 3.141593
	.word	1078530011
l.6392:	 # 30.000000
	.word	1106247680
l.6391:	 # 15.000000
	.word	1097859072
l.6390:	 # 0.000100
	.word	953267991
l.6347:	 # 100000000.000000
	.word	1287568416
l.6343:	 # 1000000000.000000
	.word	1315859240
l.6323:	 # -0.100000
	.word	-1110651699
l.6310:	 # 0.010000
	.word	1008981770
l.6309:	 # -0.200000
	.word	-1102263091
l.6118:	 # 2.000000
	.word	1073741824
l.6084:	 # -200.000000
	.word	-1018691584
l.6082:	 # 200.000000
	.word	1128792064
l.6078:	 # 0.017453
	.word	1016003125
l.5995:	 # -1.000000
	.word	-1082130432
l.5994:	 # 1.000000
	.word	1065353216
l.5993:	 # 0.000000
	.word	0
	.text
	.globl  _min_caml_start
xor.2461:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8643
	ADDI	%r1, %r2, 0
	JR	%r31
BEQ_else.8643:
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.8644
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8644:
	ADDI	%r1, %r0, 0
	JR	%r31
sgn.2464:
	SWC1	%f1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8645
	LWC1	%f1, 0(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8646
	LA	%r29, l.5995
	LWC1	%f1, 0(%r29)
	JR	%r31
BEQ_else.8646:
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	JR	%r31
BEQ_else.8645:
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	JR	%r31
fneg_cond.2466:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8647
	J	min_caml_fneg
BEQ_else.8647:
	JR	%r31
add_mod5.2469:
	ADD	%r1, %r1, %r2
	ADDI	%r27, %r0, 5
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8648
	ADDI	%r1, %r1, -5
	JR	%r31
BEQ_else.8648:
	JR	%r31
vecset.2472:
	SWC1	%f1, 0(%r1)
	SWC1	%f2, 4(%r1)
	SWC1	%f3, 8(%r1)
	JR	%r31
vecfill.2477:
	SWC1	%f1, 0(%r1)
	SWC1	%f1, 4(%r1)
	SWC1	%f1, 8(%r1)
	JR	%r31
vecbzero.2480:
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	J	vecfill.2477
veccpy.2482:
	LWC1	%f1, 0(%r2)
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 4(%r2)
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 8(%r2)
	SWC1	%f1, 8(%r1)
	JR	%r31
vecunit_sgn.2490:
	LWC1	%f1, 0(%r1)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8652
	LW	%r1, 0(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8654
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 24(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	J	BEQ_cont.8655
BEQ_else.8654:
	LA	%r29, l.5995
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 24(%r30) # restore2
	DIV.s	%f1, %f1, %f2
BEQ_cont.8655:
	J	BEQ_cont.8653
BEQ_else.8652:
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
BEQ_cont.8653:
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
veciprod.2493:
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
veciprod2.2496:
	LWC1	%f4, 0(%r1)
	MUL.s	%f1, %f4, %f1
	LWC1	%f4, 4(%r1)
	MUL.s	%f2, %f4, %f2
	ADD.s	%f1, %f1, %f2
	LWC1	%f2, 8(%r1)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	JR	%r31
vecaccum.2501:
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
vecadd.2505:
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
vecscale.2511:
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
vecaccumv.2514:
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
o_texturetype.2518:
	LW	%r1, 0(%r1)
	JR	%r31
o_form.2520:
	LW	%r1, 4(%r1)
	JR	%r31
o_reflectiontype.2522:
	LW	%r1, 8(%r1)
	JR	%r31
o_isinvert.2524:
	LW	%r1, 24(%r1)
	JR	%r31
o_isrot.2526:
	LW	%r1, 12(%r1)
	JR	%r31
o_param_a.2528:
	LW	%r1, 16(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_b.2530:
	LW	%r1, 16(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_c.2532:
	LW	%r1, 16(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_param_abc.2534:
	LW	%r1, 16(%r1)
	JR	%r31
o_param_x.2536:
	LW	%r1, 20(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_y.2538:
	LW	%r1, 20(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_z.2540:
	LW	%r1, 20(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_diffuse.2542:
	LW	%r1, 28(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_hilight.2544:
	LW	%r1, 28(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_color_red.2546:
	LW	%r1, 32(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_color_green.2548:
	LW	%r1, 32(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_color_blue.2550:
	LW	%r1, 32(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_param_r1.2552:
	LW	%r1, 36(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_r2.2554:
	LW	%r1, 36(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_r3.2556:
	LW	%r1, 36(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_param_ctbl.2558:
	LW	%r1, 40(%r1)
	JR	%r31
p_rgb.2560:
	LW	%r1, 0(%r1)
	JR	%r31
p_intersection_points.2562:
	LW	%r1, 4(%r1)
	JR	%r31
p_surface_ids.2564:
	LW	%r1, 8(%r1)
	JR	%r31
p_calc_diffuse.2566:
	LW	%r1, 12(%r1)
	JR	%r31
p_energy.2568:
	LW	%r1, 16(%r1)
	JR	%r31
p_received_ray_20percent.2570:
	LW	%r1, 20(%r1)
	JR	%r31
p_group_id.2572:
	LW	%r1, 24(%r1)
	LW	%r1, 0(%r1)
	JR	%r31
p_set_group_id.2574:
	LW	%r1, 24(%r1)
	SW	%r2, 0(%r1)
	JR	%r31
p_nvectors.2577:
	LW	%r1, 28(%r1)
	JR	%r31
d_vec.2579:
	LW	%r1, 0(%r1)
	JR	%r31
d_const.2581:
	LW	%r1, 4(%r1)
	JR	%r31
r_surface_id.2583:
	LW	%r1, 0(%r1)
	JR	%r31
r_dvec.2585:
	LW	%r1, 4(%r1)
	JR	%r31
r_bright.2587:
	LWC1	%f1, 8(%r1)
	JR	%r31
rad.2589:
	LA	%r29, l.6078
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	JR	%r31
read_screen_settings.2591:
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
	JAL	rad.2589
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_cos
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_sin
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	rad.2589
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_cos
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_sin
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	MUL.s	%f3, %f2, %f1
	LA	%r29, l.6082
	LWC1	%f4, 0(%r29)
	MUL.s	%f3, %f3, %f4
	LW	%r1, 12(%r30) # restore1
	SWC1	%f3, 0(%r1)
	LA	%r29, l.6084
	LWC1	%f3, 0(%r29)
	LWC1	%f4, 40(%r30) # restore2
	MUL.s	%f3, %f4, %f3
	SWC1	%f3, 4(%r1)
	LWC1	%f3, 56(%r30) # restore2
	MUL.s	%f5, %f2, %f3
	LA	%r29, l.6082
	LWC1	%f6, 0(%r29)
	MUL.s	%f5, %f5, %f6
	SWC1	%f5, 8(%r1)
	LW	%r2, 8(%r30) # restore1
	SWC1	%f3, 0(%r2)
	LA	%r29, l.5993
	LWC1	%f5, 0(%r29)
	SWC1	%f5, 4(%r2)
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LWC1	%f1, 40(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 32(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 40(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
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
read_light.2593:
	LW	%r1, 8(%r26)
	LW	%r2, 4(%r26)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	rad.2589
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_sin
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
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
	JAL	rad.2589
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_cos
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_sin
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 16(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_cos
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	JR	%r31
rotate_quadratic_matrix.2595:
	LWC1	%f1, 0(%r2)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_cos
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_sin
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_cos
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_sin
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_cos
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_sin
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
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
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
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
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 80(%r30) # restore2
	SWC1	%f1, 144(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 156(%r30) # save link register
	ADDI	%r30, %r30, 160
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 160
	SUB	%r30, %r30, %r29
	LW	%r29, 156(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 144(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LWC1	%f3, 120(%r30) # restore2
	SWC1	%f1, 152(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 152(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 72(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 64(%r30) # restore2
	SWC1	%f1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 160(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LWC1	%f3, 104(%r30) # restore2
	SWC1	%f1, 168(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 168(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 56(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 48(%r30) # restore2
	SWC1	%f1, 176(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 176(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LWC1	%f3, 96(%r30) # restore2
	SWC1	%f1, 184(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 196(%r30) # save link register
	ADDI	%r30, %r30, 200
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 200
	SUB	%r30, %r30, %r29
	LW	%r29, 196(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 184(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LA	%r29, l.6118
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
	LA	%r29, l.6118
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
	LA	%r29, l.6118
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
read_nth_object.2598:
	LW	%r2, 4(%r26)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, -1
	BNE	%r1, %r27, BEQ_else.8666
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8666:
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
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
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
	LA	%r29, l.5993
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
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 2
	LA	%r29, l.5993
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
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 36(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 36(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r2, %r0, 3
	LA	%r29, l.5993
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
	LA	%r29, l.5993
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
	BNE	%r2, %r27, BEQ_else.8667
	J	BEQ_cont.8668
BEQ_else.8667:
	SW	%r1, 44(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	rad.2589
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	rad.2589
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	rad.2589
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 8(%r1)
BEQ_cont.8668:
	LW	%r2, 12(%r30) # restore1
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.8669
	ADDI	%r3, %r0, 1
	J	BEQ_cont.8670
BEQ_else.8669:
	LW	%r3, 32(%r30) # restore1
BEQ_cont.8670:
	ADDI	%r4, %r0, 4
	LA	%r29, l.5993
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
	BNE	%r5, %r27, BEQ_else.8671
	LWC1	%f1, 0(%r3)
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8674
	LWC1	%f1, 56(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	sgn.2464
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.8675
BEQ_else.8674:
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
BEQ_cont.8675:
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 4(%r1)
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8676
	LWC1	%f1, 72(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	sgn.2464
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.8677
BEQ_else.8676:
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
BEQ_cont.8677:
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 8(%r1)
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8678
	LWC1	%f1, 88(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	sgn.2464
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.8679
BEQ_else.8678:
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
BEQ_cont.8679:
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 8(%r1)
	J	BEQ_cont.8672
BEQ_else.8671:
	ADDI	%r27, %r0, 2
	BNE	%r5, %r27, BEQ_else.8680
	LW	%r2, 32(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.8682
	ADDI	%r2, %r0, 1
	J	BEQ_cont.8683
BEQ_else.8682:
	ADDI	%r2, %r0, 0
BEQ_cont.8683:
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	vecunit_sgn.2490
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8681
BEQ_else.8680:
BEQ_cont.8681:
BEQ_cont.8672:
	LW	%r1, 20(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8684
	J	BEQ_cont.8685
BEQ_else.8684:
	LW	%r1, 24(%r30) # restore1
	LW	%r2, 44(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	rotate_quadratic_matrix.2595
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8685:
	ADDI	%r1, %r0, 1
	JR	%r31
read_object.2600:
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 60
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8686
	JR	%r31
BEQ_else.8686:
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
	BNE	%r1, %r27, BEQ_else.8688
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	SW	%r2, 0(%r1)
	JR	%r31
BEQ_else.8688:
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
read_all_object.2602:
	LW	%r26, 4(%r26)
	ADDI	%r1, %r0, 0
	LW	%r25, 0(%r26)
	JR	%r25
read_net_item.2604:
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, -1
	BNE	%r1, %r27, BEQ_else.8690
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	ADDI	%r2, %r0, -1
	J	min_caml_create_array
BEQ_else.8690:
	LW	%r2, 0(%r30) # restore1
	ADDI	%r3, %r2, 1
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	read_net_item.2604
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SLL	%r2, %r2, 2
	LW	%r3, 4(%r30) # restore1
	ADD	%r29, %r1, %r2
	SW	%r3, 0(%r29)
	JR	%r31
read_or_network.2606:
	ADDI	%r2, %r0, 0
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_net_item.2604
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r2)
	ADDI	%r27, %r0, -1
	BNE	%r1, %r27, BEQ_else.8691
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	J	min_caml_create_array
BEQ_else.8691:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r3, %r1, 1
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	read_or_network.2606
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SLL	%r2, %r2, 2
	LW	%r3, 4(%r30) # restore1
	ADD	%r29, %r1, %r2
	SW	%r3, 0(%r29)
	JR	%r31
read_and_network.2608:
	LW	%r2, 4(%r26)
	ADDI	%r3, %r0, 0
	SW	%r26, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	read_net_item.2604
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r1)
	ADDI	%r27, %r0, -1
	BNE	%r2, %r27, BEQ_else.8692
	JR	%r31
BEQ_else.8692:
	LW	%r2, 8(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 4(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	ADDI	%r1, %r2, 1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
read_parameter.2610:
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
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	read_or_network.2606
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 0(%r2)
	JR	%r31
solver_rect_surface.2612:
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
	BNE	%r1, %r27, BEQ_else.8698
	LW	%r1, 56(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_abc.2534
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 56(%r30) # restore1
	SW	%r1, 60(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
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
	JAL	xor.2461
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
	JAL	fneg_cond.2466
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
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 60(%r30) # restore1
	ADD	%r29, %r2, %r1
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_fless
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8700
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8700:
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
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 60(%r30) # restore1
	ADD	%r29, %r2, %r1
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_fless
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8701
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8701:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 72(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8698:
	ADDI	%r1, %r0, 0
	JR	%r31
solver_rect.2621:
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
	BNE	%r1, %r27, BEQ_else.8702
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
	BNE	%r1, %r27, BEQ_else.8703
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
	BNE	%r1, %r27, BEQ_else.8704
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8704:
	ADDI	%r1, %r0, 3
	JR	%r31
BEQ_else.8703:
	ADDI	%r1, %r0, 2
	JR	%r31
BEQ_else.8702:
	ADDI	%r1, %r0, 1
	JR	%r31
solver_surface.2627:
	LW	%r3, 4(%r26)
	SW	%r3, 0(%r30)
	SWC1	%f3, 8(%r30)
	SWC1	%f2, 16(%r30)
	SWC1	%f1, 24(%r30)
	SW	%r2, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_abc.2534
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SW	%r2, 36(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	veciprod.2493
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8706
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8706:
	LWC1	%f1, 24(%r30) # restore2
	LWC1	%f2, 16(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	LW	%r1, 36(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	veciprod2.2496
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
quadratic.2633:
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
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 16(%r30) # restore2
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LWC1	%f2, 8(%r30) # restore2
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 56(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_isrot.2526
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8708
	LWC1	%f1, 72(%r30) # restore2
	JR	%r31
BEQ_else.8708:
	LWC1	%f1, 8(%r30) # restore2
	LWC1	%f2, 16(%r30) # restore2
	MUL.s	%f3, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	SWC1	%f3, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_param_r1.2552
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
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
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	o_param_r2.2554
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
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
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	o_param_r3.2556
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 104(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
bilinear.2638:
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
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
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
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
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
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 80(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	o_isrot.2526
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8710
	LWC1	%f1, 96(%r30) # restore2
	JR	%r31
BEQ_else.8710:
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
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	o_param_r1.2552
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
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
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	o_param_r2.2554
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
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
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	o_param_r3.2556
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 128(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
solver_second.2646:
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
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	quadratic.2633
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8712
	LW	%r1, 36(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 8(%r1)
	LWC1	%f4, 24(%r30) # restore2
	LWC1	%f5, 16(%r30) # restore2
	LWC1	%f6, 8(%r30) # restore2
	LW	%r1, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	bilinear.2638
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
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
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	quadratic.2633
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_form.2520
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.8713
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	J	BEQ_cont.8714
BEQ_else.8713:
	LWC1	%f1, 56(%r30) # restore2
BEQ_cont.8714:
	LWC1	%f2, 48(%r30) # restore2
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	LWC1	%f3, 40(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8715
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8715:
	LWC1	%f1, 72(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8716
	LWC1	%f1, 80(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8717
BEQ_else.8716:
	LWC1	%f1, 80(%r30) # restore2
BEQ_cont.8717:
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f1, %f2
	LWC1	%f2, 40(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8712:
	ADDI	%r1, %r0, 0
	JR	%r31
solver.2652:
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
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_x.2536
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
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
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_y.2538
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 20(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 48(%r30)
	SWC1	%f2, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_z.2540
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_form.2520
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8718
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 48(%r30) # restore2
	LWC1	%f3, 64(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8718:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8719
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 48(%r30) # restore2
	LWC1	%f3, 64(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8719:
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 48(%r30) # restore2
	LWC1	%f3, 64(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
solver_rect_fast.2656:
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
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 56(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fless
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8722
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8723
BEQ_else.8722:
	LW	%r1, 48(%r30) # restore1
	LWC1	%f1, 8(%r1)
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 32(%r30) # restore2
	ADD.s	%f1, %f1, %f3
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 64(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fless
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8724
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8725
BEQ_else.8724:
	LW	%r1, 24(%r30) # restore1
	LWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8726
	ADDI	%r1, %r0, 1
	J	BEQ_cont.8727
BEQ_else.8726:
	ADDI	%r1, %r0, 0
BEQ_cont.8727:
BEQ_cont.8725:
BEQ_cont.8723:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8728
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
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 80(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_fless
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8729
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8730
BEQ_else.8729:
	LW	%r1, 48(%r30) # restore1
	LWC1	%f1, 8(%r1)
	LWC1	%f2, 72(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 32(%r30) # restore2
	ADD.s	%f1, %f1, %f3
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 88(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	min_caml_fless
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8731
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8732
BEQ_else.8731:
	LW	%r1, 24(%r30) # restore1
	LWC1	%f1, 12(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8733
	ADDI	%r1, %r0, 1
	J	BEQ_cont.8734
BEQ_else.8733:
	ADDI	%r1, %r0, 0
BEQ_cont.8734:
BEQ_cont.8732:
BEQ_cont.8730:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8735
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
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 104(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_fless
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8736
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8737
BEQ_else.8736:
	LW	%r1, 48(%r30) # restore1
	LWC1	%f1, 4(%r1)
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 16(%r30) # restore2
	ADD.s	%f1, %f1, %f3
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 112(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 112(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	min_caml_fless
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8738
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8739
BEQ_else.8738:
	LW	%r1, 24(%r30) # restore1
	LWC1	%f1, 20(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8740
	ADDI	%r1, %r0, 1
	J	BEQ_cont.8741
BEQ_else.8740:
	ADDI	%r1, %r0, 0
BEQ_cont.8741:
BEQ_cont.8739:
BEQ_cont.8737:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8742
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8742:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 96(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 3
	JR	%r31
BEQ_else.8735:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 72(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 2
	JR	%r31
BEQ_else.8728:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 40(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
solver_surface_fast.2663:
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
	BNE	%r1, %r27, BEQ_else.8744
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8744:
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
solver_second_fast.2669:
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
	BNE	%r1, %r27, BEQ_else.8747
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
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	quadratic.2633
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_form.2520
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.8749
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 64(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	J	BEQ_cont.8750
BEQ_else.8749:
	LWC1	%f1, 64(%r30) # restore2
BEQ_cont.8750:
	LWC1	%f2, 56(%r30) # restore2
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8751
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8751:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8752
	LWC1	%f1, 80(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 48(%r30) # restore1
	LWC1	%f2, 16(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	J	BEQ_cont.8753
BEQ_else.8752:
	LWC1	%f1, 80(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 48(%r30) # restore1
	LWC1	%f2, 16(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
BEQ_cont.8753:
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8747:
	ADDI	%r1, %r0, 0
	JR	%r31
solver_fast.2675:
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
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_x.2536
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
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
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_y.2538
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 56(%r30)
	SWC1	%f2, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_z.2540
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	d_const.2581
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
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
	JAL	o_form.2520
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8755
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	d_vec.2579
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
BEQ_else.8755:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8756
	LWC1	%f1, 40(%r30) # restore2
	LWC1	%f2, 56(%r30) # restore2
	LWC1	%f3, 72(%r30) # restore2
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 80(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8756:
	LWC1	%f1, 40(%r30) # restore2
	LWC1	%f2, 56(%r30) # restore2
	LWC1	%f3, 72(%r30) # restore2
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 80(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
solver_surface_fast2.2679:
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
	BNE	%r1, %r27, BEQ_else.8757
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8757:
	LW	%r1, 8(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 12(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
solver_second_fast2.2686:
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
	BNE	%r1, %r27, BEQ_else.8759
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
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8761
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8761:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8762
	LWC1	%f1, 72(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 48(%r30) # restore1
	LWC1	%f2, 16(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	J	BEQ_cont.8763
BEQ_else.8762:
	LWC1	%f1, 72(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 48(%r30) # restore1
	LWC1	%f2, 16(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
BEQ_cont.8763:
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8759:
	ADDI	%r1, %r0, 0
	JR	%r31
solver_fast2.2693:
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
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_ctbl.2558
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
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
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	d_const.2581
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
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
	JAL	o_form.2520
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8765
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	d_vec.2579
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
BEQ_else.8765:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8766
	LWC1	%f1, 48(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 32(%r30) # restore2
	LW	%r1, 12(%r30) # restore1
	LW	%r2, 56(%r30) # restore1
	LW	%r3, 24(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8766:
	LWC1	%f1, 48(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 32(%r30) # restore2
	LW	%r1, 12(%r30) # restore1
	LW	%r2, 56(%r30) # restore1
	LW	%r3, 24(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
setup_rect_table.2696:
	ADDI	%r3, %r0, 6
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
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
	BNE	%r1, %r27, BEQ_else.8767
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 0(%r2)
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	xor.2461
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	fneg_cond.2466
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f2, 0(%r2)
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r1)
	J	BEQ_cont.8768
BEQ_else.8767:
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 4(%r1)
BEQ_cont.8768:
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
	BNE	%r1, %r27, BEQ_else.8769
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 4(%r2)
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	xor.2461
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	fneg_cond.2466
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f2, 4(%r2)
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 12(%r1)
	J	BEQ_cont.8770
BEQ_else.8769:
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 12(%r1)
BEQ_cont.8770:
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
	BNE	%r1, %r27, BEQ_else.8771
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 8(%r2)
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	xor.2461
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	fneg_cond.2466
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 16(%r1)
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f2, 8(%r2)
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 20(%r1)
	J	BEQ_cont.8772
BEQ_else.8771:
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 20(%r1)
BEQ_cont.8772:
	JR	%r31
setup_surface_table.2699:
	ADDI	%r3, %r0, 4
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 0(%r30) # restore1
	SW	%r1, 8(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
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
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
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
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8774
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 0(%r1)
	J	BEQ_cont.8775
BEQ_else.8774:
	LA	%r29, l.5995
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 56(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 12(%r1)
BEQ_cont.8775:
	JR	%r31
setup_second_table.2702:
	ADDI	%r3, %r0, 5
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
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
	JAL	quadratic.2633
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
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 32(%r30)
	SWC1	%f2, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 48(%r30)
	SWC1	%f2, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 16(%r30) # restore2
	SWC1	%f2, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_isrot.2526
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8777
	LW	%r1, 8(%r30) # restore1
	LWC1	%f1, 32(%r30) # restore2
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 48(%r30) # restore2
	SWC1	%f1, 8(%r1)
	LWC1	%f1, 64(%r30) # restore2
	SWC1	%f1, 12(%r1)
	J	BEQ_cont.8778
BEQ_else.8777:
	LW	%r1, 4(%r30) # restore1
	LWC1	%f1, 8(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_param_r2.2554
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
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
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	o_param_r3.2556
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 80(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
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
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	o_param_r1.2552
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
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
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	o_param_r3.2556
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 104(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
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
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	o_param_r1.2552
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 120(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 128(%r30)
	SWC1	%f2, 136(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	o_param_r2.2554
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 128(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 12(%r1)
BEQ_cont.8778:
	LWC1	%f1, 16(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	min_caml_fiszero
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8779
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 16(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 16(%r1)
	J	BEQ_cont.8780
BEQ_else.8779:
BEQ_cont.8780:
	LW	%r1, 8(%r30) # restore1
	JR	%r31
iter_setup_dirvec_constants.2705:
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.8781
	SLL	%r4, %r2, 2
	ADD	%r29, %r3, %r4
	LW	%r3, 0(%r29)
	SW	%r26, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r3, 8(%r30)
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	d_const.2581
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	d_vec.2579
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 8(%r30) # restore1
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_form.2520
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8782
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	setup_rect_table.2696
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	J	BEQ_cont.8783
BEQ_else.8782:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8784
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	setup_surface_table.2699
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	J	BEQ_cont.8785
BEQ_else.8784:
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	setup_second_table.2702
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
BEQ_cont.8785:
BEQ_cont.8783:
	ADDI	%r2, %r2, -1
	LW	%r1, 12(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8781:
	JR	%r31
setup_dirvec_constants.2708:
	LW	%r2, 8(%r26)
	LW	%r26, 4(%r26)
	LW	%r2, 0(%r2)
	ADDI	%r2, %r2, -1
	LW	%r25, 0(%r26)
	JR	%r25
setup_startp_constants.2710:
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.8787
	SLL	%r4, %r2, 2
	ADD	%r29, %r3, %r4
	LW	%r3, 0(%r29)
	SW	%r26, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	SW	%r3, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_ctbl.2558
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_form.2520
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
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_x.2536
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
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
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_y.2538
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
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
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_z.2540
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r2, 20(%r30) # restore1
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.8788
	LW	%r2, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_abc.2534
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LWC1	%f2, 4(%r2)
	LWC1	%f3, 8(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	veciprod2.2496
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 12(%r1)
	J	BEQ_cont.8789
BEQ_else.8788:
	ADDI	%r27, %r0, 2
	SLT	%r27, %r27, %r2
	BNE	%r27, %r0, BEQ_else.8790
	J	BEQ_cont.8791
BEQ_else.8790:
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 8(%r1)
	LW	%r3, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	quadratic.2633
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.8792
	LA	%r29, l.5994
	LWC1	%f2, 0(%r29)
	SUB.s	%f1, %f1, %f2
	J	BEQ_cont.8793
BEQ_else.8792:
BEQ_cont.8793:
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 12(%r1)
BEQ_cont.8791:
BEQ_cont.8789:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r2, %r1, -1
	LW	%r1, 8(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8787:
	JR	%r31
setup_startp.2713:
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
	JAL	veccpy.2482
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
is_rect_outside.2715:
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
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 24(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fless
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8796
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8797
BEQ_else.8796:
	LWC1	%f1, 8(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 32(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_fless
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8798
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8799
BEQ_else.8798:
	LWC1	%f1, 0(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 40(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_fless
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8799:
BEQ_cont.8797:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8800
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8801
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8801:
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8800:
	LW	%r1, 16(%r30) # restore1
	J	o_isinvert.2524
is_plane_outside.2720:
	SW	%r1, 0(%r30)
	SWC1	%f3, 8(%r30)
	SWC1	%f2, 16(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_abc.2534
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 24(%r30) # restore2
	LWC1	%f2, 16(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	veciprod2.2496
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
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
	JAL	xor.2461
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8803
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8803:
	ADDI	%r1, %r0, 0
	JR	%r31
is_second_outside.2725:
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	quadratic.2633
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_form.2520
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.8805
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 8(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	J	BEQ_cont.8806
BEQ_else.8805:
	LWC1	%f1, 8(%r30) # restore2
BEQ_cont.8806:
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
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
	JAL	xor.2461
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8807
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8807:
	ADDI	%r1, %r0, 0
	JR	%r31
is_outside.2730:
	SWC1	%f3, 0(%r30)
	SWC1	%f2, 8(%r30)
	SW	%r1, 16(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_x.2536
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_y.2538
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_z.2540
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 0(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_form.2520
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8809
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	J	is_rect_outside.2715
BEQ_else.8809:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8810
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	J	is_plane_outside.2720
BEQ_else.8810:
	LWC1	%f1, 32(%r30) # restore2
	LWC1	%f2, 40(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	LW	%r1, 16(%r30) # restore1
	J	is_second_outside.2725
check_all_inside.2735:
	LW	%r3, 4(%r26)
	SLL	%r4, %r1, 2
	ADD	%r29, %r2, %r4
	LW	%r4, 0(%r29)
	ADDI	%r27, %r0, -1
	BNE	%r4, %r27, BEQ_else.8811
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8811:
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
	JAL	is_outside.2730
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8812
	LW	%r1, 32(%r30) # restore1
	ADDI	%r1, %r1, 1
	LWC1	%f1, 16(%r30) # restore2
	LWC1	%f2, 8(%r30) # restore2
	LWC1	%f3, 0(%r30) # restore2
	LW	%r2, 24(%r30) # restore1
	LW	%r26, 28(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8812:
	ADDI	%r1, %r0, 0
	JR	%r31
shadow_check_and_group.2741:
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
	ADDI	%r27, %r0, -1
	BNE	%r10, %r27, BEQ_else.8813
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8813:
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
	BNE	%r1, %r27, BEQ_else.8815
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8816
BEQ_else.8815:
	LA	%r29, l.6309
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_fless
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8816:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8817
	LW	%r1, 28(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 24(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8818
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8818:
	LW	%r1, 20(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 12(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8817:
	LA	%r29, l.6310
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
	SW	%r29, 52(%r30)
	ADDI	%r30, %r30, 56
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8819
	LW	%r1, 20(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 12(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8819:
	ADDI	%r1, %r0, 1
	JR	%r31
shadow_check_one_or_group.2744:
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	SLL	%r5, %r1, 2
	ADD	%r29, %r2, %r5
	LW	%r5, 0(%r29)
	ADDI	%r27, %r0, -1
	BNE	%r5, %r27, BEQ_else.8820
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8820:
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
	BNE	%r1, %r27, BEQ_else.8821
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8821:
	ADDI	%r1, %r0, 1
	JR	%r31
shadow_check_one_or_matrix.2747:
	LW	%r3, 20(%r26)
	LW	%r4, 16(%r26)
	LW	%r5, 12(%r26)
	LW	%r6, 8(%r26)
	LW	%r7, 4(%r26)
	SLL	%r8, %r1, 2
	ADD	%r29, %r2, %r8
	LW	%r8, 0(%r29)
	LW	%r9, 0(%r8)
	ADDI	%r27, %r0, -1
	BNE	%r9, %r27, BEQ_else.8822
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8822:
	SW	%r8, 0(%r30)
	SW	%r5, 4(%r30)
	SW	%r2, 8(%r30)
	SW	%r26, 12(%r30)
	SW	%r1, 16(%r30)
	ADDI	%r27, %r0, 99
	BNE	%r9, %r27, BEQ_else.8823
	ADDI	%r1, %r0, 1
	J	BEQ_cont.8824
BEQ_else.8823:
	SW	%r4, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r6, 0 # args
	ADDI	%r1, %r9, 0 # args
	ADDI	%r26, %r3, 0 # args
	ADDI	%r3, %r7, 0 # args
	SW	%r29, 28(%r30)
	ADDI	%r30, %r30, 32
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8825
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8826
BEQ_else.8825:
	LW	%r1, 20(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LA	%r29, l.6323
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_fless
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8827
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8828
BEQ_else.8827:
	ADDI	%r1, %r0, 1
	LW	%r2, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30)
	ADDI	%r30, %r30, 32
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8829
	ADDI	%r1, %r0, 0
	J	BEQ_cont.8830
BEQ_else.8829:
	ADDI	%r1, %r0, 1
BEQ_cont.8830:
BEQ_cont.8828:
BEQ_cont.8826:
BEQ_cont.8824:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8831
	LW	%r1, 16(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8831:
	ADDI	%r1, %r0, 1
	LW	%r2, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30)
	ADDI	%r30, %r30, 32
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8832
	LW	%r1, 16(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8832:
	ADDI	%r1, %r0, 1
	JR	%r31
solve_each_element.2750:
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
	ADDI	%r27, %r0, -1
	BNE	%r13, %r27, BEQ_else.8833
	JR	%r31
BEQ_else.8833:
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
	BNE	%r1, %r27, BEQ_else.8835
	LW	%r1, 48(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 44(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8836
	JR	%r31
BEQ_else.8836:
	LW	%r1, 40(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 32(%r30) # restore1
	LW	%r3, 28(%r30) # restore1
	LW	%r26, 36(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8835:
	LW	%r2, 24(%r30) # restore1
	LWC1	%f2, 0(%r2)
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 52(%r30)
	SWC1	%f2, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fless
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8838
	J	BEQ_cont.8839
BEQ_else.8838:
	LW	%r1, 20(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LWC1	%f1, 56(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_fless
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8840
	J	BEQ_cont.8841
BEQ_else.8840:
	LA	%r29, l.6310
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
	SW	%r29, 100(%r30)
	ADDI	%r30, %r30, 104
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8842
	J	BEQ_cont.8843
BEQ_else.8842:
	LW	%r1, 20(%r30) # restore1
	LWC1	%f1, 88(%r30) # restore2
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 80(%r30) # restore2
	LWC1	%f2, 72(%r30) # restore2
	LWC1	%f3, 64(%r30) # restore2
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	vecset.2472
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 48(%r30) # restore1
	SW	%r2, 0(%r1)
	LW	%r1, 0(%r30) # restore1
	LW	%r2, 52(%r30) # restore1
	SW	%r2, 0(%r1)
BEQ_cont.8843:
BEQ_cont.8841:
BEQ_cont.8839:
	LW	%r1, 40(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 32(%r30) # restore1
	LW	%r3, 28(%r30) # restore1
	LW	%r26, 36(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
solve_one_or_network.2754:
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SLL	%r6, %r1, 2
	ADD	%r29, %r2, %r6
	LW	%r6, 0(%r29)
	ADDI	%r27, %r0, -1
	BNE	%r6, %r27, BEQ_else.8844
	JR	%r31
BEQ_else.8844:
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
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
trace_or_matrix.2758:
	LW	%r4, 20(%r26)
	LW	%r5, 16(%r26)
	LW	%r6, 12(%r26)
	LW	%r7, 8(%r26)
	LW	%r8, 4(%r26)
	SLL	%r9, %r1, 2
	ADD	%r29, %r2, %r9
	LW	%r9, 0(%r29)
	LW	%r10, 0(%r9)
	ADDI	%r27, %r0, -1
	BNE	%r10, %r27, BEQ_else.8846
	JR	%r31
BEQ_else.8846:
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r26, 8(%r30)
	SW	%r1, 12(%r30)
	ADDI	%r27, %r0, 99
	BNE	%r10, %r27, BEQ_else.8848
	ADDI	%r4, %r0, 1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r9, 0 # args
	ADDI	%r1, %r4, 0 # args
	ADDI	%r26, %r8, 0 # args
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8849
BEQ_else.8848:
	SW	%r9, 16(%r30)
	SW	%r8, 20(%r30)
	SW	%r4, 24(%r30)
	SW	%r6, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r10, 0 # args
	ADDI	%r26, %r7, 0 # args
	ADDI	%r3, %r5, 0 # args
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8850
	J	BEQ_cont.8851
BEQ_else.8850:
	LW	%r1, 28(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r1, 24(%r30) # restore1
	LWC1	%f2, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fless
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8852
	J	BEQ_cont.8853
BEQ_else.8852:
	ADDI	%r1, %r0, 1
	LW	%r2, 16(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8853:
BEQ_cont.8851:
BEQ_cont.8849:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
judge_intersection.2762:
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	LA	%r29, l.6343
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
	LA	%r29, l.6323
	LWC1	%f1, 0(%r29)
	SWC1	%f2, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_fless
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8855
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8855:
	LA	%r29, l.6347
	LWC1	%f2, 0(%r29)
	LWC1	%f1, 8(%r30) # restore2
	J	min_caml_fless
solve_each_element_fast.2764:
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
	JAL	d_vec.2579
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 48(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 44(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	ADDI	%r27, %r0, -1
	BNE	%r3, %r27, BEQ_else.8856
	JR	%r31
BEQ_else.8856:
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
	BNE	%r1, %r27, BEQ_else.8858
	LW	%r1, 56(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 32(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8859
	JR	%r31
BEQ_else.8859:
	LW	%r1, 48(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 44(%r30) # restore1
	LW	%r3, 36(%r30) # restore1
	LW	%r26, 28(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8858:
	LW	%r2, 24(%r30) # restore1
	LWC1	%f2, 0(%r2)
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 60(%r30)
	SWC1	%f2, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fless
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8861
	J	BEQ_cont.8862
BEQ_else.8861:
	LW	%r1, 20(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LWC1	%f1, 64(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fless
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8863
	J	BEQ_cont.8864
BEQ_else.8863:
	LA	%r29, l.6310
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
	SW	%r29, 108(%r30)
	ADDI	%r30, %r30, 112
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8865
	J	BEQ_cont.8866
BEQ_else.8865:
	LW	%r1, 20(%r30) # restore1
	LWC1	%f1, 96(%r30) # restore2
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 88(%r30) # restore2
	LWC1	%f2, 80(%r30) # restore2
	LWC1	%f3, 72(%r30) # restore2
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	vecset.2472
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 56(%r30) # restore1
	SW	%r2, 0(%r1)
	LW	%r1, 0(%r30) # restore1
	LW	%r2, 60(%r30) # restore1
	SW	%r2, 0(%r1)
BEQ_cont.8866:
BEQ_cont.8864:
BEQ_cont.8862:
	LW	%r1, 48(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 44(%r30) # restore1
	LW	%r3, 36(%r30) # restore1
	LW	%r26, 28(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
solve_one_or_network_fast.2768:
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SLL	%r6, %r1, 2
	ADD	%r29, %r2, %r6
	LW	%r6, 0(%r29)
	ADDI	%r27, %r0, -1
	BNE	%r6, %r27, BEQ_else.8867
	JR	%r31
BEQ_else.8867:
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
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
trace_or_matrix_fast.2772:
	LW	%r4, 16(%r26)
	LW	%r5, 12(%r26)
	LW	%r6, 8(%r26)
	LW	%r7, 4(%r26)
	SLL	%r8, %r1, 2
	ADD	%r29, %r2, %r8
	LW	%r8, 0(%r29)
	LW	%r9, 0(%r8)
	ADDI	%r27, %r0, -1
	BNE	%r9, %r27, BEQ_else.8869
	JR	%r31
BEQ_else.8869:
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r26, 8(%r30)
	SW	%r1, 12(%r30)
	ADDI	%r27, %r0, 99
	BNE	%r9, %r27, BEQ_else.8871
	ADDI	%r4, %r0, 1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r8, 0 # args
	ADDI	%r1, %r4, 0 # args
	ADDI	%r26, %r7, 0 # args
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8872
BEQ_else.8871:
	SW	%r8, 16(%r30)
	SW	%r7, 20(%r30)
	SW	%r4, 24(%r30)
	SW	%r6, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r9, 0 # args
	ADDI	%r26, %r5, 0 # args
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8873
	J	BEQ_cont.8874
BEQ_else.8873:
	LW	%r1, 28(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r1, 24(%r30) # restore1
	LWC1	%f2, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fless
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8875
	J	BEQ_cont.8876
BEQ_else.8875:
	ADDI	%r1, %r0, 1
	LW	%r2, 16(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8876:
BEQ_cont.8874:
BEQ_cont.8872:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
judge_intersection_fast.2776:
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	LA	%r29, l.6343
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
	LA	%r29, l.6323
	LWC1	%f1, 0(%r29)
	SWC1	%f2, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_fless
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8878
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8878:
	LA	%r29, l.6347
	LWC1	%f2, 0(%r29)
	LWC1	%f1, 8(%r30) # restore2
	J	min_caml_fless
get_nvector_rect.2778:
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
	JAL	vecbzero.2480
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
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	sgn.2464
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 0(%r30) # restore1
	ADD	%r29, %r2, %r1
	SWC1	%f1, 0(%r29)
	JR	%r31
get_nvector_plane.2780:
	LW	%r2, 4(%r26)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	JR	%r31
get_nvector_second.2782:
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	LWC1	%f1, 0(%r3)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r3, 8(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_x.2536
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
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
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_y.2538
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 40(%r30)
	SWC1	%f2, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_z.2540
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_isrot.2526
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8882
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 64(%r30) # restore2
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 72(%r30) # restore2
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 80(%r30) # restore2
	SWC1	%f1, 8(%r1)
	J	BEQ_cont.8883
BEQ_else.8882:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_param_r3.2556
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	o_param_r2.2554
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 88(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	o_param_r3.2556
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	o_param_r1.2552
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 96(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	o_param_r2.2554
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	o_param_r1.2552
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 104(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_fhalf
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 8(%r1)
BEQ_cont.8883:
	LW	%r2, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	o_isinvert.2524
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	J	vecunit_sgn.2490
get_nvector.2784:
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
	JAL	o_form.2520
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8884
	LW	%r1, 12(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8884:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8885
	LW	%r1, 4(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8885:
	LW	%r1, 4(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
utexture.2787:
	LW	%r3, 4(%r26)
	SW	%r2, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_texturetype.2518
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 8(%r30) # restore1
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_color_red.2546
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_color_green.2548
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_color_blue.2550
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r2, 12(%r30) # restore1
	ADDI	%r27, %r0, 1
	BNE	%r2, %r27, BEQ_else.8886
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_x.2536
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6410
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_floor
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6411
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6402
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fless
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 8(%r30) # restore1
	SW	%r1, 32(%r30)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_z.2540
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6410
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_floor
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6411
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6402
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_fless
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 32(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.8888
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8890
	LA	%r29, l.6397
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.8891
BEQ_else.8890:
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
BEQ_cont.8891:
	J	BEQ_cont.8889
BEQ_else.8888:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8892
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.8893
BEQ_else.8892:
	LA	%r29, l.6397
	LWC1	%f1, 0(%r29)
BEQ_cont.8893:
BEQ_cont.8889:
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	JR	%r31
BEQ_else.8886:
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.8895
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LA	%r29, l.6406
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_sin
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6397
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f2, 0(%r1)
	LA	%r29, l.6397
	LWC1	%f2, 0(%r29)
	LA	%r29, l.5994
	LWC1	%f3, 0(%r29)
	SUB.s	%f1, %f3, %f1
	MUL.s	%f1, %f2, %f1
	SWC1	%f1, 4(%r1)
	JR	%r31
BEQ_else.8895:
	ADDI	%r27, %r0, 3
	BNE	%r2, %r27, BEQ_else.8897
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_x.2536
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 64(%r30)
	SWC1	%f2, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_param_z.2540
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LWC1	%f2, 64(%r30) # restore2
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6402
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_floor
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6393
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_cos
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6397
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	SWC1	%f2, 4(%r1)
	LA	%r29, l.5994
	LWC1	%f2, 0(%r29)
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6397
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.8897:
	ADDI	%r27, %r0, 4
	BNE	%r2, %r27, BEQ_else.8899
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	o_param_x.2536
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 104(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 112(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
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
	SW	%r29, 140(%r30) # save link register
	ADDI	%r30, %r30, 144
	JAL	o_param_z.2540
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 136(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 120(%r30) # restore2
	SWC1	%f1, 144(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 156(%r30) # save link register
	ADDI	%r30, %r30, 160
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 160
	SUB	%r30, %r30, %r29
	LW	%r29, 156(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 144(%r30) # restore2
	SWC1	%f1, 152(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 152(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LWC1	%f2, 120(%r30) # restore2
	SWC1	%f1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6390
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	min_caml_fless
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8900
	LWC1	%f1, 120(%r30) # restore2
	LWC1	%f2, 144(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	min_caml_atan
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6392
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.6393
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	J	BEQ_cont.8901
BEQ_else.8900:
	LA	%r29, l.6391
	LWC1	%f1, 0(%r29)
BEQ_cont.8901:
	SWC1	%f1, 168(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	min_caml_floor
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 168(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 176(%r30)
	SWC1	%f2, 184(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 196(%r30) # save link register
	ADDI	%r30, %r30, 200
	JAL	o_param_y.2538
	ADDI	%r29, %r0, 200
	SUB	%r30, %r30, %r29
	LW	%r29, 196(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 184(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 192(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 204(%r30) # save link register
	ADDI	%r30, %r30, 208
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 208
	SUB	%r30, %r30, %r29
	LW	%r29, 204(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 204(%r30) # save link register
	ADDI	%r30, %r30, 208
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 208
	SUB	%r30, %r30, %r29
	LW	%r29, 204(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 192(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 160(%r30) # restore2
	SWC1	%f1, 200(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 212(%r30) # save link register
	ADDI	%r30, %r30, 216
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 216
	SUB	%r30, %r30, %r29
	LW	%r29, 212(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6390
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 212(%r30) # save link register
	ADDI	%r30, %r30, 216
	JAL	min_caml_fless
	ADDI	%r29, %r0, 216
	SUB	%r30, %r30, %r29
	LW	%r29, 212(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8902
	LWC1	%f1, 160(%r30) # restore2
	LWC1	%f2, 200(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 212(%r30) # save link register
	ADDI	%r30, %r30, 216
	JAL	min_caml_fabs
	ADDI	%r29, %r0, 216
	SUB	%r30, %r30, %r29
	LW	%r29, 212(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 212(%r30) # save link register
	ADDI	%r30, %r30, 216
	JAL	min_caml_atan
	ADDI	%r29, %r0, 216
	SUB	%r30, %r30, %r29
	LW	%r29, 212(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6392
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.6393
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	J	BEQ_cont.8903
BEQ_else.8902:
	LA	%r29, l.6391
	LWC1	%f1, 0(%r29)
BEQ_cont.8903:
	SWC1	%f1, 208(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 220(%r30) # save link register
	ADDI	%r30, %r30, 224
	JAL	min_caml_floor
	ADDI	%r29, %r0, 224
	SUB	%r30, %r30, %r29
	LW	%r29, 220(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 208(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6395
	LWC1	%f2, 0(%r29)
	LA	%r29, l.6396
	LWC1	%f3, 0(%r29)
	LWC1	%f4, 176(%r30) # restore2
	SUB.s	%f3, %f3, %f4
	SWC1	%f1, 216(%r30)
	SWC1	%f2, 224(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 236(%r30) # save link register
	ADDI	%r30, %r30, 240
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 240
	SUB	%r30, %r30, %r29
	LW	%r29, 236(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 224(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.6396
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 216(%r30) # restore2
	SUB.s	%f2, %f2, %f3
	SWC1	%f1, 232(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 244(%r30) # save link register
	ADDI	%r30, %r30, 248
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 248
	SUB	%r30, %r30, %r29
	LW	%r29, 244(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 232(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	SWC1	%f1, 240(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 252(%r30) # save link register
	ADDI	%r30, %r30, 256
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 256
	SUB	%r30, %r30, %r29
	LW	%r29, 252(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8904
	LWC1	%f1, 240(%r30) # restore2
	J	BEQ_cont.8905
BEQ_else.8904:
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
BEQ_cont.8905:
	LA	%r29, l.6397
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f2, %f1
	LA	%r29, l.6398
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.8899:
	JR	%r31
add_light.2790:
	LW	%r1, 8(%r26)
	LW	%r2, 4(%r26)
	SWC1	%f3, 0(%r30)
	SWC1	%f2, 8(%r30)
	SWC1	%f1, 16(%r30)
	SW	%r1, 24(%r30)
	SW	%r2, 28(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8908
	J	BEQ_cont.8909
BEQ_else.8908:
	LWC1	%f1, 16(%r30) # restore2
	LW	%r1, 28(%r30) # restore1
	LW	%r2, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	vecaccum.2501
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8909:
	LWC1	%f1, 8(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8910
	JR	%r31
BEQ_else.8910:
	LWC1	%f1, 8(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
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
trace_reflections.2794:
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
	BNE	%r27, %r0, BEQ_else.8913
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
	JAL	r_dvec.2585
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 56(%r30) # restore1
	SW	%r1, 60(%r30)
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
	BNE	%r1, %r27, BEQ_else.8914
	J	BEQ_cont.8915
BEQ_else.8914:
	LW	%r1, 52(%r30) # restore1
	LW	%r1, 0(%r1)
	SLL	%r1, %r1, 2
	LW	%r2, 48(%r30) # restore1
	LW	%r2, 0(%r2)
	ADD	%r1, %r1, %r2
	LW	%r2, 44(%r30) # restore1
	SW	%r1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	r_surface_id.2583
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 64(%r30) # restore1
	BNE	%r2, %r1, BEQ_else.8916
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
	BNE	%r1, %r27, BEQ_else.8918
	LW	%r1, 60(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	d_vec.2579
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	veciprod.2493
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	r_bright.2587
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f3, %f1, %f2
	LWC1	%f4, 72(%r30) # restore2
	MUL.s	%f3, %f3, %f4
	LW	%r1, 60(%r30) # restore1
	SWC1	%f3, 80(%r30)
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	d_vec.2579
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	veciprod.2493
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	MUL.s	%f2, %f2, %f1
	LWC1	%f1, 80(%r30) # restore2
	LWC1	%f3, 8(%r30) # restore2
	LW	%r26, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30)
	ADDI	%r30, %r30, 104
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8919
BEQ_else.8918:
BEQ_cont.8919:
	J	BEQ_cont.8917
BEQ_else.8916:
BEQ_cont.8917:
BEQ_cont.8915:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, -1
	LWC1	%f1, 24(%r30) # restore2
	LWC1	%f2, 8(%r30) # restore2
	LW	%r2, 20(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8913:
	JR	%r31
trace_ray.2799:
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
	BNE	%r27, %r0, BEQ_else.8922
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
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	p_surface_ids.2564
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
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
	BNE	%r1, %r27, BEQ_else.8925
	ADDI	%r1, %r0, -1
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 120(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.8926
	JR	%r31
BEQ_else.8926:
	LW	%r1, 112(%r30) # restore1
	LW	%r2, 104(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	veciprod.2493
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
	SW	%r29, 140(%r30) # save link register
	ADDI	%r30, %r30, 144
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8929
	JR	%r31
BEQ_else.8929:
	LWC1	%f1, 128(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 140(%r30) # save link register
	ADDI	%r30, %r30, 144
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
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
BEQ_else.8925:
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
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	o_reflectiontype.2522
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 140(%r30) # restore1
	SW	%r1, 144(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	o_diffuse.2542
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
	SW	%r29, 164(%r30)
	ADDI	%r30, %r30, 168
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 68(%r30) # restore1
	LW	%r2, 64(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	veccpy.2482
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 140(%r30) # restore1
	LW	%r2, 64(%r30) # restore1
	LW	%r26, 60(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 164(%r30)
	ADDI	%r30, %r30, 168
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 136(%r30) # restore1
	SLL	%r1, %r1, 2
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
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	p_intersection_points.2562
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	LW	%r3, 64(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	veccpy.2482
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	p_calc_diffuse.2566
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 140(%r30) # restore1
	SW	%r1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	o_diffuse.2542
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6396
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
	BNE	%r1, %r27, BEQ_else.8933
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
	JAL	p_energy.2568
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
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	veccpy.2482
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 108(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 164(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LA	%r29, l.6433
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 152(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	vecscale.2511
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	p_nvectors.2577
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	LW	%r3, 44(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	veccpy.2482
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8934
BEQ_else.8933:
	ADDI	%r1, %r0, 0
	LW	%r2, 108(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 160(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
BEQ_cont.8934:
	LA	%r29, l.6435
	LWC1	%f1, 0(%r29)
	LW	%r1, 112(%r30) # restore1
	LW	%r2, 44(%r30) # restore1
	SWC1	%f1, 168(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	veciprod.2493
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 168(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 112(%r30) # restore1
	LW	%r2, 44(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	vecaccum.2501
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 140(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	o_hilight.2544
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	ADDI	%r1, %r0, 0
	LW	%r2, 40(%r30) # restore1
	LW	%r2, 0(%r2)
	LW	%r26, 36(%r30) # restore1
	SWC1	%f1, 176(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 188(%r30)
	ADDI	%r30, %r30, 192
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8935
	LW	%r1, 44(%r30) # restore1
	LW	%r2, 104(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	veciprod.2493
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 152(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 112(%r30) # restore1
	LW	%r2, 104(%r30) # restore1
	SWC1	%f1, 184(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 196(%r30) # save link register
	ADDI	%r30, %r30, 200
	JAL	veciprod.2493
	ADDI	%r29, %r0, 200
	SUB	%r30, %r30, %r29
	LW	%r29, 196(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 196(%r30) # save link register
	ADDI	%r30, %r30, 200
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 200
	SUB	%r30, %r30, %r29
	LW	%r29, 196(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 184(%r30) # restore2
	LWC1	%f3, 176(%r30) # restore2
	LW	%r26, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 196(%r30)
	ADDI	%r30, %r30, 200
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 200
	SUB	%r30, %r30, %r29
	LW	%r29, 196(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8936
BEQ_else.8935:
BEQ_cont.8936:
	LW	%r1, 64(%r30) # restore1
	LW	%r26, 28(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 196(%r30)
	ADDI	%r30, %r30, 200
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 200
	SUB	%r30, %r30, %r29
	LW	%r29, 196(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	LW	%r1, 0(%r1)
	ADDI	%r1, %r1, -1
	LWC1	%f1, 152(%r30) # restore2
	LWC1	%f2, 176(%r30) # restore2
	LW	%r2, 112(%r30) # restore1
	LW	%r26, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 196(%r30)
	ADDI	%r30, %r30, 200
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 200
	SUB	%r30, %r30, %r29
	LW	%r29, 196(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6438
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 96(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 196(%r30) # save link register
	ADDI	%r30, %r30, 200
	JAL	min_caml_fless
	ADDI	%r29, %r0, 200
	SUB	%r30, %r30, %r29
	LW	%r29, 196(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8937
	JR	%r31
BEQ_else.8937:
	LW	%r1, 108(%r30) # restore1
	ADDI	%r27, %r0, 4
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8939
	J	BEQ_cont.8940
BEQ_else.8939:
	ADDI	%r2, %r1, 1
	ADDI	%r3, %r0, -1
	SLL	%r2, %r2, 2
	LW	%r4, 120(%r30) # restore1
	ADD	%r29, %r4, %r2
	SW	%r3, 0(%r29)
BEQ_cont.8940:
	LW	%r2, 144(%r30) # restore1
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.8941
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	LW	%r2, 140(%r30) # restore1
	SWC1	%f1, 192(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 204(%r30) # save link register
	ADDI	%r30, %r30, 208
	JAL	o_diffuse.2542
	ADDI	%r29, %r0, 208
	SUB	%r30, %r30, %r29
	LW	%r29, 204(%r30)
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
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8941:
	JR	%r31
BEQ_else.8922:
	JR	%r31
trace_diffuse_ray.2805:
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
	SW	%r29, 60(%r30)
	ADDI	%r30, %r30, 64
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8944
	JR	%r31
BEQ_else.8944:
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
	JAL	d_vec.2579
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
	BNE	%r1, %r27, BEQ_else.8946
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	veciprod.2493
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
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_fispos
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8948
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.8949
BEQ_else.8948:
	LWC1	%f1, 64(%r30) # restore2
BEQ_cont.8949:
	LWC1	%f2, 8(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 56(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_diffuse.2542
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	J	vecaccum.2501
BEQ_else.8946:
	JR	%r31
iter_trace_diffuse_rays.2808:
	LW	%r5, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r4, %r27
	BNE	%r27, %r0, BEQ_else.8951
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
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	d_vec.2579
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	veciprod.2493
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fisneg
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8952
	LW	%r1, 16(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 12(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LA	%r29, l.6456
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 24(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.8953
BEQ_else.8952:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r2, %r1, 1
	SLL	%r2, %r2, 2
	LW	%r3, 12(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	LA	%r29, l.6454
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 24(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8953:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r4, %r1, -2
	LW	%r1, 12(%r30) # restore1
	LW	%r2, 20(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8951:
	JR	%r31
trace_diffuse_rays.2813:
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	SW	%r5, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	ADDI	%r26, %r4, 0 # args
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r4, %r0, 118
	LW	%r1, 8(%r30) # restore1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
trace_diffuse_ray_80percent.2817:
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r5, 12(%r30)
	SW	%r1, 16(%r30)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8955
	J	BEQ_cont.8956
BEQ_else.8955:
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
BEQ_cont.8956:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.8957
	J	BEQ_cont.8958
BEQ_else.8957:
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
BEQ_cont.8958:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.8959
	J	BEQ_cont.8960
BEQ_else.8959:
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
BEQ_cont.8960:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.8961
	J	BEQ_cont.8962
BEQ_else.8961:
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
BEQ_cont.8962:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r27, %r0, 4
	BNE	%r1, %r27, BEQ_else.8963
	JR	%r31
BEQ_else.8963:
	LW	%r1, 12(%r30) # restore1
	LW	%r1, 16(%r1)
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
calc_diffuse_using_1point.2821:
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
	JAL	p_received_ray_20percent.2570
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	p_nvectors.2577
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	p_intersection_points.2562
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	p_energy.2568
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
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
	JAL	veccpy.2482
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	p_group_id.2572
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
	J	vecaccumv.2514
calc_diffuse_using_5points.2824:
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
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	p_received_ray_20percent.2570
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
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
	JAL	p_received_ray_20percent.2570
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
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	p_received_ray_20percent.2570
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
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
	JAL	p_received_ray_20percent.2570
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
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	p_received_ray_20percent.2570
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
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
	JAL	veccpy.2482
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
	JAL	vecadd.2505
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
	JAL	vecadd.2505
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
	JAL	vecadd.2505
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
	JAL	vecadd.2505
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
	JAL	p_energy.2568
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
	J	vecaccumv.2514
do_without_neighbors.2830:
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 4
	SLT	%r27, %r27, %r2
	BNE	%r27, %r0, BEQ_else.8965
	SW	%r26, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r1, 8(%r30)
	SW	%r2, 12(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	p_surface_ids.2564
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8966
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	p_calc_diffuse.2566
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8967
	J	BEQ_cont.8968
BEQ_else.8967:
	LW	%r1, 8(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8968:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r2, %r1, 1
	LW	%r1, 8(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8966:
	JR	%r31
BEQ_else.8965:
	JR	%r31
neighbors_exist.2833:
	LW	%r3, 4(%r26)
	LW	%r4, 4(%r3)
	ADDI	%r5, %r2, 1
	SLT	%r27, %r5, %r4
	BNE	%r27, %r0, BEQ_else.8971
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8971:
	ADDI	%r27, %r0, 0
	SLT	%r27, %r27, %r2
	BNE	%r27, %r0, BEQ_else.8972
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8972:
	LW	%r2, 0(%r3)
	ADDI	%r3, %r1, 1
	SLT	%r27, %r3, %r2
	BNE	%r27, %r0, BEQ_else.8973
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8973:
	ADDI	%r27, %r0, 0
	SLT	%r27, %r27, %r1
	BNE	%r27, %r0, BEQ_else.8974
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8974:
	ADDI	%r1, %r0, 1
	JR	%r31
get_surface_id.2837:
	SW	%r2, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	p_surface_ids.2564
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SLL	%r2, %r2, 2
	ADD	%r29, %r1, %r2
	LW	%r1, 0(%r29)
	JR	%r31
neighbors_are_available.2840:
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
	JAL	get_surface_id.2837
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
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	get_surface_id.2837
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	BNE	%r1, %r2, BEQ_else.8975
	LW	%r1, 16(%r30) # restore1
	SLL	%r3, %r1, 2
	LW	%r4, 4(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	LW	%r4, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	get_surface_id.2837
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	BNE	%r1, %r2, BEQ_else.8976
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
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	get_surface_id.2837
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	BNE	%r1, %r2, BEQ_else.8977
	LW	%r1, 16(%r30) # restore1
	ADDI	%r1, %r1, 1
	SLL	%r1, %r1, 2
	LW	%r3, 0(%r30) # restore1
	ADD	%r29, %r3, %r1
	LW	%r1, 0(%r29)
	LW	%r3, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	get_surface_id.2837
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	BNE	%r1, %r2, BEQ_else.8978
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.8978:
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8977:
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8976:
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.8975:
	ADDI	%r1, %r0, 0
	JR	%r31
try_exploit_neighbors.2846:
	LW	%r7, 8(%r26)
	LW	%r8, 4(%r26)
	SLL	%r9, %r1, 2
	ADD	%r29, %r4, %r9
	LW	%r9, 0(%r29)
	ADDI	%r27, %r0, 4
	SLT	%r27, %r27, %r6
	BNE	%r27, %r0, BEQ_else.8979
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
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	get_surface_id.2837
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8980
	LW	%r1, 36(%r30) # restore1
	LW	%r2, 32(%r30) # restore1
	LW	%r3, 28(%r30) # restore1
	LW	%r4, 24(%r30) # restore1
	LW	%r5, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	neighbors_are_available.2840
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8981
	LW	%r1, 36(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 28(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	LW	%r2, 20(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8981:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	p_calc_diffuse.2566
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r5, 20(%r30) # restore1
	SLL	%r2, %r5, 2
	ADD	%r29, %r1, %r2
	LW	%r1, 0(%r29)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8982
	J	BEQ_cont.8983
BEQ_else.8982:
	LW	%r1, 36(%r30) # restore1
	LW	%r2, 32(%r30) # restore1
	LW	%r3, 28(%r30) # restore1
	LW	%r4, 24(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30)
	ADDI	%r30, %r30, 48
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8983:
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
BEQ_else.8980:
	JR	%r31
BEQ_else.8979:
	JR	%r31
write_ppm_header.2853:
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
	ADDI	%r1, %r0, 51
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
write_rgb_element.2855:
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_int_of_float
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 255
	SLT	%r27, %r27, %r1
	BNE	%r27, %r0, BEQ_else.8986
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8988
	J	BEQ_cont.8989
BEQ_else.8988:
	ADDI	%r1, %r0, 0
BEQ_cont.8989:
	J	BEQ_cont.8987
BEQ_else.8986:
	ADDI	%r1, %r0, 255
BEQ_cont.8987:
	J	min_caml_print_int
write_rgb.2857:
	LW	%r1, 4(%r26)
	LWC1	%f1, 0(%r1)
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	write_rgb_element.2855
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
	JAL	write_rgb_element.2855
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
	JAL	write_rgb_element.2855
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 10
	J	min_caml_print_char
pretrace_diffuse_rays.2859:
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	ADDI	%r27, %r0, 4
	SLT	%r27, %r27, %r2
	BNE	%r27, %r0, BEQ_else.8990
	SW	%r26, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r5, 12(%r30)
	SW	%r2, 16(%r30)
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	get_surface_id.2837
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.8991
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	p_calc_diffuse.2566
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.8992
	J	BEQ_cont.8993
BEQ_else.8992:
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	p_group_id.2572
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 12(%r30) # restore1
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	vecbzero.2480
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	p_nvectors.2577
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	p_intersection_points.2562
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
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
	SW	%r29, 36(%r30)
	ADDI	%r30, %r30, 40
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	p_received_ray_20percent.2570
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	SLL	%r3, %r2, 2
	ADD	%r29, %r1, %r3
	LW	%r1, 0(%r29)
	LW	%r3, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	veccpy.2482
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.8993:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r2, %r1, 1
	LW	%r1, 20(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.8991:
	JR	%r31
BEQ_else.8990:
	JR	%r31
pretrace_pixels.2862:
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
	BNE	%r27, %r0, BEQ_else.8996
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
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
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
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	vecunit_sgn.2490
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	vecbzero.2480
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	LW	%r2, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	veccpy.2482
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	LW	%r2, 20(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 16(%r30) # restore1
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	LA	%r29, l.5993
	LWC1	%f2, 0(%r29)
	LW	%r5, 56(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r5, 0 # args
	SW	%r29, 92(%r30)
	ADDI	%r30, %r30, 96
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SLL	%r2, %r1, 2
	LW	%r3, 16(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	p_rgb.2560
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 32(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	veccpy.2482
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
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
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	p_set_group_id.2574
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
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
	SW	%r29, 92(%r30)
	ADDI	%r30, %r30, 96
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
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
	JAL	add_mod5.2469
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
BEQ_else.8996:
	JR	%r31
pretrace_line.2869:
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
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
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
scan_pixel.2873:
	LW	%r6, 24(%r26)
	LW	%r7, 20(%r26)
	LW	%r8, 16(%r26)
	LW	%r9, 12(%r26)
	LW	%r10, 8(%r26)
	LW	%r11, 4(%r26)
	LW	%r10, 0(%r10)
	SLT	%r27, %r1, %r10
	BNE	%r27, %r0, BEQ_else.9001
	JR	%r31
BEQ_else.9001:
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
	JAL	p_rgb.2560
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 40(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	veccpy.2482
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
	BNE	%r1, %r27, BEQ_else.9003
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
	J	BEQ_cont.9004
BEQ_else.9003:
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
BEQ_cont.9004:
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
scan_line.2879:
	LW	%r6, 12(%r26)
	LW	%r7, 8(%r26)
	LW	%r8, 4(%r26)
	LW	%r9, 4(%r8)
	SLT	%r27, %r1, %r9
	BNE	%r27, %r0, BEQ_else.9005
	JR	%r31
BEQ_else.9005:
	LW	%r8, 4(%r8)
	ADDI	%r8, %r8, -1
	SW	%r26, 0(%r30)
	SW	%r5, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r3, 12(%r30)
	SW	%r2, 16(%r30)
	SW	%r1, 20(%r30)
	SW	%r6, 24(%r30)
	SLT	%r27, %r1, %r8
	BNE	%r27, %r0, BEQ_else.9007
	J	BEQ_cont.9008
BEQ_else.9007:
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
BEQ_cont.9008:
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
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	add_mod5.2469
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r5, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	LW	%r2, 12(%r30) # restore1
	LW	%r3, 8(%r30) # restore1
	LW	%r4, 16(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
create_float5x3array.2885:
	ADDI	%r1, %r0, 3
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 5
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.5993
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
	LA	%r29, l.5993
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
	LA	%r29, l.5993
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
	LA	%r29, l.5993
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
create_pixel.2887:
	ADDI	%r1, %r0, 3
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	create_float5x3array.2885
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
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
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
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	create_float5x3array.2885
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	create_float5x3array.2885
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
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	create_float5x3array.2885
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
init_line_elements.2889:
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.9009
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	create_pixel.2887
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 4(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 0(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	ADDI	%r2, %r2, -1
	ADDI	%r1, %r4, 0 # args
	J	init_line_elements.2889
BEQ_else.9009:
	JR	%r31
create_pixelline.2892:
	LW	%r1, 4(%r26)
	LW	%r2, 0(%r1)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	create_pixel.2887
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	LW	%r2, 0(%r2)
	ADDI	%r2, %r2, -2
	J	init_line_elements.2889
tan.2894:
	SWC1	%f1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_sin
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 0(%r30) # restore2
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_cos
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	JR	%r31
adjust_position.2896:
	MUL.s	%f1, %f1, %f1
	LA	%r29, l.6438
	LWC1	%f3, 0(%r29)
	ADD.s	%f1, %f1, %f3
	SWC1	%f2, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.5994
	LWC1	%f2, 0(%r29)
	DIV.s	%f2, %f2, %f1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_atan
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 0(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	tan.2894
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	JR	%r31
calc_dirvec.2899:
	LW	%r4, 4(%r26)
	ADDI	%r27, %r0, 5
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9010
	SW	%r3, 0(%r30)
	SW	%r4, 4(%r30)
	SW	%r2, 8(%r30)
	SWC1	%f1, 16(%r30)
	SWC1	%f2, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_fsqr
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LA	%r29, l.5994
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	DIV.s	%f2, %f2, %f1
	LWC1	%f3, 24(%r30) # restore2
	DIV.s	%f3, %f3, %f1
	LA	%r29, l.5994
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
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	d_vec.2579
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 64(%r30) # restore2
	LWC1	%f2, 56(%r30) # restore2
	LWC1	%f3, 48(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	vecset.2472
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r2, %r1, 40
	SLL	%r2, %r2, 2
	LW	%r3, 40(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	d_vec.2579
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
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
	JAL	vecset.2472
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
	JAL	d_vec.2579
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 64(%r30) # restore2
	SW	%r1, 76(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADD.s	%f3, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 48(%r30) # restore2
	LWC1	%f2, 80(%r30) # restore2
	LW	%r1, 76(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	vecset.2472
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r2, %r1, 1
	SLL	%r2, %r2, 2
	LW	%r3, 40(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	d_vec.2579
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
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
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADD.s	%f3, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 96(%r30) # restore2
	LWC1	%f2, 104(%r30) # restore2
	LW	%r1, 88(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	vecset.2472
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r2, %r1, 41
	SLL	%r2, %r2, 2
	LW	%r3, 40(%r30) # restore1
	ADD	%r29, %r3, %r2
	LW	%r2, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	d_vec.2579
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
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
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADD.s	%f2, %f1, %f0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 120(%r30) # restore2
	LWC1	%f3, 56(%r30) # restore2
	LW	%r1, 112(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	vecset.2472
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 81
	SLL	%r1, %r1, 2
	LW	%r2, 40(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	d_vec.2579
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
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
	J	vecset.2472
BEQ_else.9010:
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
	JAL	adjust_position.2896
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
	JAL	adjust_position.2896
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
calc_dirvecs.2907:
	LW	%r4, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9018
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
	LA	%r29, l.6550
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.6551
	LWC1	%f2, 0(%r29)
	SUB.s	%f3, %f1, %f2
	ADDI	%r1, %r0, 0
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	LA	%r29, l.5993
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
	LA	%r29, l.6550
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.6438
	LWC1	%f2, 0(%r29)
	ADD.s	%f3, %f1, %f2
	ADDI	%r1, %r0, 0
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	LA	%r29, l.5993
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
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	add_mod5.2469
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LWC1	%f1, 8(%r30) # restore2
	LW	%r1, 28(%r30) # restore1
	LW	%r3, 16(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9018:
	JR	%r31
calc_dirvec_rows.2912:
	LW	%r4, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9020
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
	LA	%r29, l.6550
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.6551
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
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	add_mod5.2469
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	ADDI	%r3, %r1, 4
	LW	%r1, 20(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9020:
	JR	%r31
create_dirvec.2916:
	LW	%r1, 4(%r26)
	ADDI	%r2, %r0, 3
	LA	%r29, l.5993
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
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 8
	SW	%r1, 4(%r2)
	LW	%r1, 4(%r30) # restore1
	SW	%r1, 0(%r2)
	ADDI	%r1, %r2, 0
	JR	%r31
create_dirvec_elements.2918:
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.9022
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
BEQ_else.9022:
	JR	%r31
create_dirvecs.2921:
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9024
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
BEQ_else.9024:
	JR	%r31
init_dirvec_constants.2923:
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r2, %r27
	BNE	%r27, %r0, BEQ_else.9026
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
BEQ_else.9026:
	JR	%r31
init_vecset_constants.2926:
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9028
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
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, -1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9028:
	JR	%r31
init_dirvecs.2928:
	LW	%r1, 12(%r26)
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	ADDI	%r4, %r0, 4
	SW	%r1, 0(%r30)
	SW	%r3, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r4, 0 # args
	ADDI	%r26, %r2, 0 # args
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 9
	ADDI	%r2, %r0, 0
	ADDI	%r3, %r0, 0
	LW	%r26, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 4
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
add_reflection.2930:
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
	SW	%r29, 60(%r30)
	ADDI	%r30, %r30, 64
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	d_vec.2579
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
	JAL	vecset.2472
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
setup_rect_reflection.2937:
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SLL	%r1, %r1, 2
	LW	%r6, 0(%r3)
	LA	%r29, l.5994
	LWC1	%f1, 0(%r29)
	SW	%r3, 0(%r30)
	SW	%r6, 4(%r30)
	SW	%r5, 8(%r30)
	SW	%r1, 12(%r30)
	SW	%r4, 16(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_diffuse.2542
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	LWC1	%f2, 0(%r1)
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_fneg
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
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
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
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
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
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
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, 3
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 0(%r2)
	JR	%r31
setup_surface_reflection.2940:
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SLL	%r1, %r1, 2
	ADDI	%r1, %r1, 1
	LW	%r6, 0(%r3)
	LA	%r29, l.5994
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
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_diffuse.2542
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_abc.2534
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	veciprod.2493
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.6118
	LWC1	%f2, 0(%r29)
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 40(%r30)
	SWC1	%f2, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_a.2528
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 16(%r30) # restore1
	LWC1	%f3, 0(%r1)
	SUB.s	%f1, %f1, %f3
	LA	%r29, l.6118
	LWC1	%f3, 0(%r29)
	LW	%r2, 20(%r30) # restore1
	SWC1	%f1, 56(%r30)
	SWC1	%f3, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_b.2530
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 16(%r30) # restore1
	LWC1	%f3, 4(%r1)
	SUB.s	%f1, %f1, %f3
	LA	%r29, l.6118
	LWC1	%f3, 0(%r29)
	LW	%r2, 20(%r30) # restore1
	SWC1	%f1, 72(%r30)
	SWC1	%f3, 80(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_param_c.2532
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
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
	SW	%r29, 92(%r30)
	ADDI	%r30, %r30, 96
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 0(%r2)
	JR	%r31
setup_reflections.2943:
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	ADDI	%r27, %r0, 0
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.9036
	SLL	%r5, %r1, 2
	ADD	%r29, %r4, %r5
	LW	%r4, 0(%r29)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r3, 8(%r30)
	SW	%r4, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_reflectiontype.2522
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.9037
	LW	%r1, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_diffuse.2542
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.5994
	LWC1	%f2, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_fless
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.9038
	JR	%r31
BEQ_else.9038:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_form.2520
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.9040
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 12(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9040:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.9041
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 12(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.9041:
	JR	%r31
BEQ_else.9037:
	JR	%r31
BEQ_else.9036:
	JR	%r31
rt.2945:
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
	SRA	%r14, %r1, 1
	SW	%r14, 0(%r15)
	SRA	%r2, %r2, 1
	SW	%r2, 4(%r15)
	LA	%r29, l.6584
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
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 0(%r1)
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
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
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
	JAL	d_vec.2579
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	veccpy.2482
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
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 0
	LA	%r29, l.5993
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 4(%r30)
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
	LA	%r29, l.5993
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.6397
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
	ADDI	%r4, %r0, -1
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 36(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
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
	LA	%r29, l.6343
	LWC1	%f1, 0(%r29)
	SW	%r1, 44(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.5993
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
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.5993
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 60(%r30)
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
	LA	%r29, l.5993
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 68(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
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
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.5993
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 84(%r30)
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
	LA	%r29, l.5993
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 92(%r30)
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
	LA	%r29, l.5993
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 100(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.5993
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 108(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
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
	LA	%r29, l.5993
	LWC1	%f1, 0(%r29)
	SW	%r1, 116(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.5993
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
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 8
	SW	%r1, 4(%r2)
	LW	%r1, 124(%r30) # restore1
	SW	%r1, 0(%r2)
	ADDI	%r1, %r2, 0
	ADDI	%r2, %r0, 0
	LA	%r29, l.5993
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
	SW	%r29, 140(%r30) # save link register
	ADDI	%r30, %r30, 144
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 8
	SW	%r1, 4(%r2)
	LW	%r1, 132(%r30) # restore1
	SW	%r1, 0(%r2)
	ADDI	%r1, %r2, 0
	ADDI	%r2, %r0, 180
	ADDI	%r3, %r0, 0
	LA	%r29, l.5993
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
	SW	%r29, 140(%r30) # save link register
	ADDI	%r30, %r30, 144
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
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
	LA	%r3, read_screen_settings.2591
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
	LA	%r8, read_light.2593
	SW	%r8, 0(%r7)
	LW	%r8, 16(%r30) # restore1
	SW	%r8, 8(%r7)
	LW	%r9, 20(%r30) # restore1
	SW	%r9, 4(%r7)
	ADDI	%r10, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r11, read_nth_object.2598
	SW	%r11, 0(%r10)
	LW	%r11, 4(%r30) # restore1
	SW	%r11, 4(%r10)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r13, read_object.2600
	SW	%r13, 0(%r12)
	SW	%r10, 8(%r12)
	LW	%r10, 0(%r30) # restore1
	SW	%r10, 4(%r12)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, read_all_object.2602
	SW	%r14, 0(%r13)
	SW	%r12, 4(%r13)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, read_and_network.2608
	SW	%r14, 0(%r12)
	LW	%r14, 28(%r30) # restore1
	SW	%r14, 4(%r12)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r16, read_parameter.2610
	SW	%r16, 0(%r15)
	SW	%r2, 20(%r15)
	SW	%r7, 16(%r15)
	SW	%r12, 12(%r15)
	SW	%r13, 8(%r15)
	LW	%r2, 36(%r30) # restore1
	SW	%r2, 4(%r15)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r12, solver_rect_surface.2612
	SW	%r12, 0(%r7)
	LW	%r12, 40(%r30) # restore1
	SW	%r12, 4(%r7)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, solver_rect.2621
	SW	%r16, 0(%r13)
	SW	%r7, 4(%r13)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, solver_surface.2627
	SW	%r16, 0(%r7)
	SW	%r12, 4(%r7)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, solver_second.2646
	SW	%r17, 0(%r16)
	SW	%r12, 4(%r16)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r18, solver.2652
	SW	%r18, 0(%r17)
	SW	%r7, 16(%r17)
	SW	%r16, 12(%r17)
	SW	%r13, 8(%r17)
	SW	%r11, 4(%r17)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r13, solver_rect_fast.2656
	SW	%r13, 0(%r7)
	SW	%r12, 4(%r7)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, solver_surface_fast.2663
	SW	%r16, 0(%r13)
	SW	%r12, 4(%r13)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r18, solver_second_fast.2669
	SW	%r18, 0(%r16)
	SW	%r12, 4(%r16)
	ADDI	%r18, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r19, solver_fast.2675
	SW	%r19, 0(%r18)
	SW	%r13, 16(%r18)
	SW	%r16, 12(%r18)
	SW	%r7, 8(%r18)
	SW	%r11, 4(%r18)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, solver_surface_fast2.2679
	SW	%r16, 0(%r13)
	SW	%r12, 4(%r13)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r19, solver_second_fast2.2686
	SW	%r19, 0(%r16)
	SW	%r12, 4(%r16)
	ADDI	%r19, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r20, solver_fast2.2693
	SW	%r20, 0(%r19)
	SW	%r13, 16(%r19)
	SW	%r16, 12(%r19)
	SW	%r7, 8(%r19)
	SW	%r11, 4(%r19)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r13, iter_setup_dirvec_constants.2705
	SW	%r13, 0(%r7)
	SW	%r11, 4(%r7)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r16, setup_dirvec_constants.2708
	SW	%r16, 0(%r13)
	SW	%r10, 8(%r13)
	SW	%r7, 4(%r13)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, setup_startp_constants.2710
	SW	%r16, 0(%r7)
	SW	%r11, 4(%r7)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r20, setup_startp.2713
	SW	%r20, 0(%r16)
	LW	%r20, 92(%r30) # restore1
	SW	%r20, 12(%r16)
	SW	%r7, 8(%r16)
	SW	%r10, 4(%r16)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r21, check_all_inside.2735
	SW	%r21, 0(%r7)
	SW	%r11, 4(%r7)
	ADDI	%r21, %r28, 0
	ADDI	%r28, %r28, 32
	LA	%r22, shadow_check_and_group.2741
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
	LA	%r25, shadow_check_one_or_group.2744
	SW	%r25, 0(%r24)
	SW	%r21, 8(%r24)
	SW	%r14, 4(%r24)
	ADDI	%r21, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r25, shadow_check_one_or_matrix.2747
	SW	%r25, 0(%r21)
	SW	%r18, 20(%r21)
	SW	%r12, 16(%r21)
	SW	%r24, 12(%r21)
	SW	%r22, 8(%r21)
	SW	%r23, 4(%r21)
	ADDI	%r18, %r28, 0
	ADDI	%r28, %r28, 40
	LA	%r24, solve_each_element.2750
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
	LA	%r13, solve_one_or_network.2754
	SW	%r13, 0(%r15)
	SW	%r18, 8(%r15)
	SW	%r14, 4(%r15)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r18, trace_or_matrix.2758
	SW	%r18, 0(%r13)
	SW	%r24, 20(%r13)
	SW	%r25, 16(%r13)
	SW	%r12, 12(%r13)
	SW	%r17, 8(%r13)
	SW	%r15, 4(%r13)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r17, judge_intersection.2762
	SW	%r17, 0(%r15)
	SW	%r13, 12(%r15)
	SW	%r24, 8(%r15)
	SW	%r2, 4(%r15)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 40
	LA	%r17, solve_each_element_fast.2764
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
	LA	%r17, solve_one_or_network_fast.2768
	SW	%r17, 0(%r7)
	SW	%r13, 8(%r7)
	SW	%r14, 4(%r7)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r14, trace_or_matrix_fast.2772
	SW	%r14, 0(%r13)
	SW	%r24, 16(%r13)
	SW	%r19, 12(%r13)
	SW	%r12, 8(%r13)
	SW	%r7, 4(%r13)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r12, judge_intersection_fast.2776
	SW	%r12, 0(%r7)
	SW	%r13, 12(%r7)
	SW	%r24, 8(%r7)
	SW	%r2, 4(%r7)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r13, get_nvector_rect.2778
	SW	%r13, 0(%r12)
	LW	%r13, 60(%r30) # restore1
	SW	%r13, 8(%r12)
	SW	%r26, 4(%r12)
	ADDI	%r14, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, get_nvector_plane.2780
	SW	%r17, 0(%r14)
	SW	%r13, 4(%r14)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r18, get_nvector_second.2782
	SW	%r18, 0(%r17)
	SW	%r13, 8(%r17)
	SW	%r23, 4(%r17)
	ADDI	%r18, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r19, get_nvector.2784
	SW	%r19, 0(%r18)
	SW	%r17, 12(%r18)
	SW	%r12, 8(%r18)
	SW	%r14, 4(%r18)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, utexture.2787
	SW	%r14, 0(%r12)
	LW	%r14, 64(%r30) # restore1
	SW	%r14, 4(%r12)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r19, add_light.2790
	SW	%r19, 0(%r17)
	SW	%r14, 8(%r17)
	LW	%r19, 72(%r30) # restore1
	SW	%r19, 4(%r17)
	ADDI	%r20, %r28, 0
	ADDI	%r28, %r28, 40
	LA	%r10, trace_reflections.2794
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
	LA	%r5, trace_ray.2799
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
	LA	%r9, trace_diffuse_ray.2805
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
	LA	%r9, iter_trace_diffuse_rays.2808
	SW	%r9, 0(%r7)
	SW	%r5, 4(%r7)
	ADDI	%r5, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r9, trace_diffuse_rays.2813
	SW	%r9, 0(%r5)
	SW	%r16, 8(%r5)
	SW	%r7, 4(%r5)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r9, trace_diffuse_ray_80percent.2817
	SW	%r9, 0(%r7)
	SW	%r5, 8(%r7)
	LW	%r9, 116(%r30) # restore1
	SW	%r9, 4(%r7)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r13, calc_diffuse_using_1point.2821
	SW	%r13, 0(%r12)
	SW	%r7, 12(%r12)
	SW	%r19, 8(%r12)
	SW	%r2, 4(%r12)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r13, calc_diffuse_using_5points.2824
	SW	%r13, 0(%r7)
	SW	%r19, 8(%r7)
	SW	%r2, 4(%r7)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, do_without_neighbors.2830
	SW	%r14, 0(%r13)
	SW	%r12, 4(%r13)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, neighbors_exist.2833
	SW	%r14, 0(%r12)
	LW	%r14, 76(%r30) # restore1
	SW	%r14, 4(%r12)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r16, try_exploit_neighbors.2846
	SW	%r16, 0(%r15)
	SW	%r13, 8(%r15)
	SW	%r7, 4(%r15)
	ADDI	%r7, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, write_ppm_header.2853
	SW	%r16, 0(%r7)
	SW	%r14, 4(%r7)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, write_rgb.2857
	SW	%r17, 0(%r16)
	SW	%r19, 4(%r16)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r18, pretrace_diffuse_rays.2859
	SW	%r18, 0(%r17)
	SW	%r5, 12(%r17)
	SW	%r9, 8(%r17)
	SW	%r2, 4(%r17)
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 40
	LA	%r5, pretrace_pixels.2862
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
	LA	%r10, pretrace_line.2869
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
	LA	%r4, scan_pixel.2873
	SW	%r4, 0(%r2)
	SW	%r16, 24(%r2)
	SW	%r15, 20(%r2)
	SW	%r19, 16(%r2)
	SW	%r12, 12(%r2)
	SW	%r14, 8(%r2)
	SW	%r13, 4(%r2)
	ADDI	%r4, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r10, scan_line.2879
	SW	%r10, 0(%r4)
	SW	%r2, 12(%r4)
	SW	%r6, 8(%r4)
	SW	%r14, 4(%r4)
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r10, create_pixelline.2892
	SW	%r10, 0(%r2)
	SW	%r14, 4(%r2)
	ADDI	%r10, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r12, calc_dirvec.2899
	SW	%r12, 0(%r10)
	SW	%r9, 4(%r10)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r13, calc_dirvecs.2907
	SW	%r13, 0(%r12)
	SW	%r10, 4(%r12)
	ADDI	%r10, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r13, calc_dirvec_rows.2912
	SW	%r13, 0(%r10)
	SW	%r12, 4(%r10)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r13, create_dirvec.2916
	SW	%r13, 0(%r12)
	LW	%r13, 0(%r30) # restore1
	SW	%r13, 4(%r12)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, create_dirvec_elements.2918
	SW	%r16, 0(%r15)
	SW	%r12, 4(%r15)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r17, create_dirvecs.2921
	SW	%r17, 0(%r16)
	SW	%r9, 12(%r16)
	SW	%r15, 8(%r16)
	SW	%r12, 4(%r16)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, init_dirvec_constants.2923
	SW	%r17, 0(%r15)
	LW	%r17, 144(%r30) # restore1
	SW	%r17, 4(%r15)
	ADDI	%r18, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r19, init_vecset_constants.2926
	SW	%r19, 0(%r18)
	SW	%r15, 8(%r18)
	SW	%r9, 4(%r18)
	ADDI	%r9, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r15, init_dirvecs.2928
	SW	%r15, 0(%r9)
	SW	%r18, 12(%r9)
	SW	%r16, 8(%r9)
	SW	%r10, 4(%r9)
	ADDI	%r10, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r15, add_reflection.2930
	SW	%r15, 0(%r10)
	SW	%r17, 12(%r10)
	LW	%r15, 136(%r30) # restore1
	SW	%r15, 8(%r10)
	SW	%r12, 4(%r10)
	ADDI	%r12, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r15, setup_rect_reflection.2937
	SW	%r15, 0(%r12)
	SW	%r1, 12(%r12)
	SW	%r8, 8(%r12)
	SW	%r10, 4(%r12)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r16, setup_surface_reflection.2940
	SW	%r16, 0(%r15)
	SW	%r1, 12(%r15)
	SW	%r8, 8(%r15)
	SW	%r10, 4(%r15)
	ADDI	%r1, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r10, setup_reflections.2943
	SW	%r10, 0(%r1)
	SW	%r15, 12(%r1)
	SW	%r12, 8(%r1)
	SW	%r11, 4(%r1)
	ADDI	%r26, %r28, 0
	ADDI	%r28, %r28, 64
	LA	%r10, rt.2945
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
halt   # main program end
