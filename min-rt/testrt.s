	.data
l.4452:	 # 128.000000
	.word	1124073472
l.4441:	 # 40000.000000
	.word	1193033728
l.4389:	 # -2.000000
	.word	-1073741824
l.4388:	 # 0.100000
	.word	1036831949
l.4387:	 # 0.200000
	.word	1045220557
l.4359:	 # 20.000000
	.word	1101004800
l.4358:	 # 0.050000
	.word	1028443341
l.4354:	 # 0.250000
	.word	1048576000
l.4350:	 # 10.000000
	.word	1092616192
l.4346:	 # 0.300000
	.word	1050253722
l.4345:	 # 255.000000
	.word	1132396544
l.4344:	 # 0.500000
	.word	1056964608
l.4343:	 # 0.150000
	.word	1041865114
l.4341:	 # 3.141593
	.word	1078530011
l.4340:	 # 30.000000
	.word	1106247680
l.4339:	 # 15.000000
	.word	1097859072
l.4338:	 # 0.000100
	.word	953267991
l.4292:	 # 100000000.000000
	.word	1287568416
l.4288:	 # 1000000000.000000
	.word	1315859240
l.4255:	 # -0.100000
	.word	-1110651699
l.4240:	 # 0.010000
	.word	1008981770
l.4239:	 # -0.200000
	.word	-1102263091
l.4213:	 # 4.000000
	.word	1082130432
l.4012:	 # -200.000000
	.word	-1018691584
l.3998:	 # 0.017453
	.word	1016003125
l.3997:	 # -1.000000
	.word	-1082130432
l.3996:	 # 1.000000
	.word	1065353216
l.3995:	 # 0.000000
	.word	0
l.3971:	 # 2.000000
	.word	1073741824
	.text
	.globl  _min_caml_start
xor.1759:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5698
	ADDI	%r1, %r2, 0
	JR	%r31
BEQ_else.5698:
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.5699
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5699:
	ADDI	%r1, %r0, 0
	JR	%r31
fsqr.1762:
	MUL.s	%f1, %f1, %f1
	JR	%r31
fhalf.1764:
	LA	%r29, l.3971
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	JR	%r31
o_texturetype.1766:
	LW	%r1, 0(%r1)
	JR	%r31
o_form.1768:
	LW	%r1, 4(%r1)
	JR	%r31
o_reflectiontype.1770:
	LW	%r1, 8(%r1)
	JR	%r31
o_isinvert.1772:
	LW	%r1, 24(%r1)
	JR	%r31
o_isrot.1774:
	LW	%r1, 12(%r1)
	JR	%r31
o_param_a.1776:
	LW	%r1, 16(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_b.1778:
	LW	%r1, 16(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_c.1780:
	LW	%r1, 16(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_param_x.1782:
	LW	%r1, 20(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_y.1784:
	LW	%r1, 20(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_z.1786:
	LW	%r1, 20(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_diffuse.1788:
	LW	%r1, 28(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_hilight.1790:
	LW	%r1, 28(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_color_red.1792:
	LW	%r1, 32(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_color_green.1794:
	LW	%r1, 32(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_color_blue.1796:
	LW	%r1, 32(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_param_r1.1798:
	LW	%r1, 36(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_r2.1800:
	LW	%r1, 36(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_r3.1802:
	LW	%r1, 36(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
normalize_vector.1804:
	LWC1	%f1, 0(%r1)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	fsqr.1762
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
	JAL	fsqr.1762
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
	JAL	fsqr.1762
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
	LW	%r1, 0(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5700
	J	BEQ_cont.5701
BEQ_else.5700:
	SUB.s	%f1, %f0, %f1
BEQ_cont.5701:
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	DIV.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LWC1	%f2, 4(%r1)
	DIV.s	%f2, %f2, %f1
	SWC1	%f2, 4(%r1)
	LWC1	%f2, 8(%r1)
	DIV.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	JR	%r31
sgn.1807:
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5703
	LA	%r29, l.3997
	LWC1	%f1, 0(%r29)
	JR	%r31
BEQ_else.5703:
	LA	%r29, l.3996
	LWC1	%f1, 0(%r29)
	JR	%r31
rad.1809:
	LA	%r29, l.3998
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	JR	%r31
read_environ.1811:
	LW	%r1, 28(%r26)
	LW	%r2, 24(%r26)
	LW	%r3, 20(%r26)
	LW	%r4, 16(%r26)
	LW	%r5, 12(%r26)
	LW	%r6, 8(%r26)
	LW	%r7, 4(%r26)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r7, 8(%r30)
	SW	%r5, 12(%r30)
	SW	%r3, 16(%r30)
	SW	%r6, 20(%r30)
	SW	%r4, 24(%r30)
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
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	rad.1809
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_cos
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 32(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_sin
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	rad.1809
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_cos
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 40(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_sin
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
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
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	rad.1809
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_sin
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 12(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	rad.1809
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
	JAL	min_caml_cos
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
	JAL	min_caml_sin
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 56(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_cos
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r1, 20(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r2, 16(%r30) # restore1
	LWC1	%f2, 4(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.4012
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LW	%r3, 4(%r30) # restore1
	SWC1	%f1, 0(%r3)
	LWC1	%f1, 0(%r2)
	SUB.s	%f1, %f0, %f1
	LA	%r29, l.4012
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r3)
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 4(%r1)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.4012
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r3)
	LWC1	%f1, 0(%r3)
	LW	%r1, 24(%r30) # restore1
	LWC1	%f2, 0(%r1)
	ADD.s	%f1, %f1, %f2
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 0(%r2)
	LWC1	%f1, 4(%r3)
	LWC1	%f2, 4(%r1)
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r2)
	LWC1	%f1, 8(%r3)
	LWC1	%f2, 8(%r1)
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r2)
	JR	%r31
read_nth_object.1813:
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	SUB	%r29, %r0, %r2
	ADDI	%r2, %r29, 0
	BNE	%r1, %r2, BEQ_else.5706
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5706:
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
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SW	%r1, 24(%r30)
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
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5708
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5709
BEQ_else.5708:
	ADDI	%r1, %r0, 1
BEQ_cont.5709:
	ADDI	%r2, %r0, 2
	LA	%r29, l.3995
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
	SW	%r1, 52(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 56(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 56(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 56(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 24(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.5710
	J	BEQ_cont.5711
BEQ_else.5710:
	SW	%r1, 60(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	rad.1809
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 60(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	rad.1809
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 60(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	rad.1809
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 60(%r30) # restore1
	SWC1	%f1, 8(%r1)
BEQ_cont.5711:
	LW	%r2, 16(%r30) # restore1
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.5712
	ADDI	%r3, %r0, 1
	J	BEQ_cont.5713
BEQ_else.5712:
	LW	%r3, 48(%r30) # restore1
BEQ_cont.5713:
	ADDI	%r4, %r28, 0
	ADDI	%r28, %r28, 40
	SW	%r1, 36(%r4)
	LW	%r5, 56(%r30) # restore1
	SW	%r5, 32(%r4)
	LW	%r5, 52(%r30) # restore1
	SW	%r5, 28(%r4)
	SW	%r3, 24(%r4)
	LW	%r3, 32(%r30) # restore1
	SW	%r3, 20(%r4)
	LW	%r3, 28(%r30) # restore1
	SW	%r3, 16(%r4)
	LW	%r5, 24(%r30) # restore1
	SW	%r5, 12(%r4)
	LW	%r6, 20(%r30) # restore1
	SW	%r6, 8(%r4)
	SW	%r2, 4(%r4)
	LW	%r6, 12(%r30) # restore1
	SW	%r6, 0(%r4)
	LW	%r6, 8(%r30) # restore1
	SLL	%r6, %r6, 2
	LW	%r7, 4(%r30) # restore1
	ADD	%r29, %r7, %r6
	SW	%r4, 0(%r29)
	SW	%r1, 60(%r30)
	ADDI	%r27, %r0, 3
	BNE	%r2, %r27, BEQ_else.5714
	LWC1	%f1, 0(%r3)
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.eq.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5716
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	sgn.1807
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	fsqr.1762
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.5717
BEQ_else.5716:
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
BEQ_cont.5717:
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 4(%r1)
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.eq.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5718
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	sgn.1807
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
	JAL	fsqr.1762
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.5719
BEQ_else.5718:
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
BEQ_cont.5719:
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 8(%r1)
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.eq.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5720
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	sgn.1807
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	fsqr.1762
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 104(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.5721
BEQ_else.5720:
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
BEQ_cont.5721:
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 8(%r1)
	J	BEQ_cont.5715
BEQ_else.5714:
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.5722
	LW	%r2, 48(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.5724
	ADDI	%r2, %r0, 1
	J	BEQ_cont.5725
BEQ_else.5724:
	ADDI	%r2, %r0, 0
BEQ_cont.5725:
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	normalize_vector.1804
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.5723
BEQ_else.5722:
BEQ_cont.5723:
BEQ_cont.5715:
	LW	%r1, 24(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5726
	J	BEQ_cont.5727
BEQ_else.5726:
	LW	%r1, 60(%r30) # restore1
	LWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_cos
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 40(%r1)
	LW	%r2, 60(%r30) # restore1
	LWC1	%f1, 0(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_sin
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 44(%r1)
	LW	%r2, 60(%r30) # restore1
	LWC1	%f1, 4(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_cos
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 48(%r1)
	LW	%r2, 60(%r30) # restore1
	LWC1	%f1, 4(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_sin
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 52(%r1)
	LW	%r2, 60(%r30) # restore1
	LWC1	%f1, 8(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_cos
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 56(%r1)
	LW	%r2, 60(%r30) # restore1
	LWC1	%f1, 8(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_sin
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 60(%r1)
	LWC1	%f1, 48(%r1)
	LWC1	%f2, 56(%r1)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 44(%r1)
	LWC1	%f2, 52(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 56(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 40(%r1)
	LWC1	%f3, 60(%r1)
	MUL.s	%f2, %f2, %f3
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 40(%r1)
	LWC1	%f2, 52(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 56(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 44(%r1)
	LWC1	%f3, 60(%r1)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	LWC1	%f1, 48(%r1)
	LWC1	%f2, 60(%r1)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 12(%r1)
	LWC1	%f1, 44(%r1)
	LWC1	%f2, 52(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 60(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 40(%r1)
	LWC1	%f3, 56(%r1)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 16(%r1)
	LWC1	%f1, 40(%r1)
	LWC1	%f2, 52(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 60(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 44(%r1)
	LWC1	%f3, 56(%r1)
	MUL.s	%f2, %f2, %f3
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 20(%r1)
	LWC1	%f1, 52(%r1)
	SUB.s	%f1, %f0, %f1
	SWC1	%f1, 24(%r1)
	LWC1	%f1, 44(%r1)
	LWC1	%f2, 48(%r1)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 28(%r1)
	LWC1	%f1, 40(%r1)
	LWC1	%f2, 48(%r1)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 32(%r1)
	LW	%r2, 28(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LWC1	%f2, 4(%r2)
	LWC1	%f3, 8(%r2)
	LWC1	%f4, 0(%r1)
	SWC1	%f3, 112(%r30)
	SWC1	%f2, 120(%r30)
	SWC1	%f1, 128(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f4, %f0 # args
	SW	%r29, 140(%r30) # save link register
	ADDI	%r30, %r30, 144
	JAL	fsqr.1762
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f3, 12(%r1)
	SWC1	%f1, 136(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	fsqr.1762
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 120(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 136(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f3, 24(%r1)
	SWC1	%f1, 144(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 156(%r30) # save link register
	ADDI	%r30, %r30, 160
	JAL	fsqr.1762
	ADDI	%r29, %r0, 160
	SUB	%r30, %r30, %r29
	LW	%r29, 156(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 144(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 4(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 156(%r30) # save link register
	ADDI	%r30, %r30, 160
	JAL	fsqr.1762
	ADDI	%r29, %r0, 160
	SUB	%r30, %r30, %r29
	LW	%r29, 156(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f3, 16(%r1)
	SWC1	%f1, 152(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	fsqr.1762
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 120(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 152(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f3, 28(%r1)
	SWC1	%f1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	fsqr.1762
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 160(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 8(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	fsqr.1762
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f3, 20(%r1)
	SWC1	%f1, 168(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	fsqr.1762
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 120(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 168(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f3, 32(%r1)
	SWC1	%f1, 176(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	fsqr.1762
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 176(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LA	%r29, l.3971
	LWC1	%f1, 0(%r29)
	LW	%r1, 0(%r30) # restore1
	LWC1	%f3, 4(%r1)
	LWC1	%f4, 128(%r30) # restore2
	MUL.s	%f3, %f4, %f3
	LWC1	%f5, 8(%r1)
	MUL.s	%f3, %f3, %f5
	LWC1	%f5, 16(%r1)
	LWC1	%f6, 120(%r30) # restore2
	MUL.s	%f5, %f6, %f5
	LWC1	%f7, 20(%r1)
	MUL.s	%f5, %f5, %f7
	ADD.s	%f3, %f3, %f5
	LWC1	%f5, 28(%r1)
	MUL.s	%f5, %f2, %f5
	LWC1	%f7, 32(%r1)
	MUL.s	%f5, %f5, %f7
	ADD.s	%f3, %f3, %f5
	MUL.s	%f1, %f1, %f3
	LW	%r2, 60(%r30) # restore1
	SWC1	%f1, 0(%r2)
	LA	%r29, l.3971
	LWC1	%f1, 0(%r29)
	LWC1	%f3, 0(%r1)
	MUL.s	%f3, %f4, %f3
	LWC1	%f5, 8(%r1)
	MUL.s	%f3, %f3, %f5
	LWC1	%f5, 12(%r1)
	MUL.s	%f5, %f6, %f5
	LWC1	%f7, 20(%r1)
	MUL.s	%f5, %f5, %f7
	ADD.s	%f3, %f3, %f5
	LWC1	%f5, 24(%r1)
	MUL.s	%f5, %f2, %f5
	LWC1	%f7, 32(%r1)
	MUL.s	%f5, %f5, %f7
	ADD.s	%f3, %f3, %f5
	MUL.s	%f1, %f1, %f3
	SWC1	%f1, 4(%r2)
	LA	%r29, l.3971
	LWC1	%f1, 0(%r29)
	LWC1	%f3, 0(%r1)
	MUL.s	%f3, %f4, %f3
	LWC1	%f4, 4(%r1)
	MUL.s	%f3, %f3, %f4
	LWC1	%f4, 12(%r1)
	MUL.s	%f4, %f6, %f4
	LWC1	%f5, 16(%r1)
	MUL.s	%f4, %f4, %f5
	ADD.s	%f3, %f3, %f4
	LWC1	%f4, 24(%r1)
	MUL.s	%f2, %f2, %f4
	LWC1	%f4, 28(%r1)
	MUL.s	%f2, %f2, %f4
	ADD.s	%f2, %f3, %f2
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r2)
BEQ_cont.5727:
	ADDI	%r1, %r0, 1
	JR	%r31
read_object.1815:
	LW	%r2, 4(%r26)
	ADDI	%r27, %r0, 61
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.5728
	JR	%r31
BEQ_else.5728:
	SW	%r26, 0(%r30)
	SW	%r1, 4(%r30)
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
	BNE	%r1, %r27, BEQ_else.5730
	JR	%r31
BEQ_else.5730:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
read_all_object.1817:
	LW	%r26, 4(%r26)
	ADDI	%r1, %r0, 0
	LW	%r25, 0(%r26)
	JR	%r25
read_net_item.1819:
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
	BNE	%r1, %r2, BEQ_else.5732
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	ADDI	%r2, %r0, 1
	SUB	%r29, %r0, %r2
	ADDI	%r2, %r29, 0
	J	min_caml_create_array
BEQ_else.5732:
	LW	%r2, 0(%r30) # restore1
	ADDI	%r3, %r2, 1
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	read_net_item.1819
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
read_or_network.1821:
	ADDI	%r2, %r0, 0
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_net_item.1819
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r2)
	ADDI	%r3, %r0, 1
	SUB	%r29, %r0, %r3
	ADDI	%r3, %r29, 0
	BNE	%r1, %r3, BEQ_else.5733
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	J	min_caml_create_array
BEQ_else.5733:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r3, %r1, 1
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	read_or_network.1821
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
read_and_network.1823:
	LW	%r2, 4(%r26)
	ADDI	%r3, %r0, 0
	SW	%r26, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	read_net_item.1819
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r1)
	ADDI	%r3, %r0, 1
	SUB	%r29, %r0, %r3
	ADDI	%r3, %r29, 0
	BNE	%r2, %r3, BEQ_else.5734
	JR	%r31
BEQ_else.5734:
	LW	%r2, 8(%r30) # restore1
	SLL	%r3, %r2, 2
	LW	%r4, 4(%r30) # restore1
	ADD	%r29, %r4, %r3
	SW	%r1, 0(%r29)
	ADDI	%r1, %r2, 1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
read_parameter.1825:
	LW	%r1, 16(%r26)
	LW	%r2, 12(%r26)
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	SW	%r4, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r3, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r26, %r1, 0 # args
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
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
	ADDI	%r1, %r0, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	read_or_network.1821
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 0(%r2)
	JR	%r31
solver_rect.1827:
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 0(%r2)
	SW	%r4, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r1, 8(%r30)
	SW	%r2, 12(%r30)
	C.eq.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5737
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	LW	%r2, 12(%r30) # restore1
	LWC1	%f2, 0(%r2)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5739
	ADDI	%r3, %r0, 0
	J	BEQ_cont.5740
BEQ_else.5739:
	ADDI	%r3, %r0, 1
BEQ_cont.5740:
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	xor.1759
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5741
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	J	BEQ_cont.5742
BEQ_else.5741:
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.5742:
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	SUB.s	%f1, %f1, %f2
	LW	%r2, 12(%r30) # restore1
	LWC1	%f2, 0(%r2)
	DIV.s	%f1, %f1, %f2
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 16(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LW	%r2, 4(%r30) # restore1
	LWC1	%f4, 4(%r2)
	ADD.s	%f2, %f2, %f4
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5743
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5744
BEQ_else.5743:
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LWC1	%f3, 16(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LW	%r2, 4(%r30) # restore1
	LWC1	%f4, 8(%r2)
	ADD.s	%f2, %f2, %f4
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5745
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5746
BEQ_else.5745:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 16(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
BEQ_cont.5746:
BEQ_cont.5744:
	J	BEQ_cont.5738
BEQ_else.5737:
	ADDI	%r1, %r0, 0
BEQ_cont.5738:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5747
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 4(%r1)
	C.eq.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5748
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	LW	%r2, 12(%r30) # restore1
	LWC1	%f2, 4(%r2)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5750
	ADDI	%r3, %r0, 0
	J	BEQ_cont.5751
BEQ_else.5750:
	ADDI	%r3, %r0, 1
BEQ_cont.5751:
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	xor.1759
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5752
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	J	BEQ_cont.5753
BEQ_else.5752:
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.5753:
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SUB.s	%f1, %f1, %f2
	LW	%r2, 12(%r30) # restore1
	LWC1	%f2, 4(%r2)
	DIV.s	%f1, %f1, %f2
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LWC1	%f3, 40(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LW	%r2, 4(%r30) # restore1
	LWC1	%f4, 8(%r2)
	ADD.s	%f2, %f2, %f4
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5754
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5755
BEQ_else.5754:
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LWC1	%f3, 40(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LW	%r2, 4(%r30) # restore1
	LWC1	%f4, 0(%r2)
	ADD.s	%f2, %f2, %f4
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5756
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5757
BEQ_else.5756:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 40(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
BEQ_cont.5757:
BEQ_cont.5755:
	J	BEQ_cont.5749
BEQ_else.5748:
	ADDI	%r1, %r0, 0
BEQ_cont.5749:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5758
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 8(%r1)
	C.eq.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5759
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	LW	%r2, 12(%r30) # restore1
	LWC1	%f2, 8(%r2)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5761
	ADDI	%r3, %r0, 0
	J	BEQ_cont.5762
BEQ_else.5761:
	ADDI	%r3, %r0, 1
BEQ_cont.5762:
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	xor.1759
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5763
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	J	BEQ_cont.5764
BEQ_else.5763:
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.5764:
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SUB.s	%f1, %f1, %f2
	LW	%r2, 12(%r30) # restore1
	LWC1	%f2, 8(%r2)
	DIV.s	%f1, %f1, %f2
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LWC1	%f3, 64(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LW	%r2, 4(%r30) # restore1
	LWC1	%f4, 0(%r2)
	ADD.s	%f2, %f2, %f4
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5765
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5766
BEQ_else.5765:
	LW	%r1, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 64(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LW	%r1, 4(%r30) # restore1
	LWC1	%f4, 4(%r1)
	ADD.s	%f2, %f2, %f4
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5767
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5768
BEQ_else.5767:
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 64(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
BEQ_cont.5768:
BEQ_cont.5766:
	J	BEQ_cont.5760
BEQ_else.5759:
	ADDI	%r1, %r0, 0
BEQ_cont.5760:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5769
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5769:
	ADDI	%r1, %r0, 3
	JR	%r31
BEQ_else.5758:
	ADDI	%r1, %r0, 2
	JR	%r31
BEQ_else.5747:
	ADDI	%r1, %r0, 1
	JR	%r31
solver_surface.1830:
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	LWC1	%f1, 0(%r2)
	SW	%r4, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r1, 8(%r30)
	SW	%r2, 12(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 8(%r30) # restore1
	SWC1	%f1, 24(%r30)
	SWC1	%f2, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 24(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 40(%r30)
	SWC1	%f2, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5770
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5770:
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LW	%r2, 8(%r30) # restore1
	SWC1	%f1, 56(%r30)
	SWC1	%f2, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 8(%r30) # restore1
	SWC1	%f1, 72(%r30)
	SWC1	%f2, 80(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 72(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 88(%r30)
	SWC1	%f2, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 88(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LWC1	%f2, 56(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	SUB.s	%f1, %f0, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
in_prod_sqr_obj.1833:
	LWC1	%f1, 0(%r2)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	fsqr.1762
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 4(%r1)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	fsqr.1762
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	fsqr.1762
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 32(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
in_prod_co_objrot.1836:
	LWC1	%f1, 4(%r2)
	LWC1	%f2, 8(%r2)
	MUL.s	%f1, %f1, %f2
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_r1.1798
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LWC1	%f3, 8(%r1)
	MUL.s	%f2, %f2, %f3
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	SWC1	%f2, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_r2.1800
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LWC1	%f3, 4(%r1)
	MUL.s	%f2, %f2, %f3
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 32(%r30)
	SWC1	%f2, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_r3.1802
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 32(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
solver2nd_mul_b.1839:
	LW	%r3, 4(%r26)
	LWC1	%f1, 0(%r3)
	LWC1	%f2, 0(%r2)
	MUL.s	%f1, %f1, %f2
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r3, 8(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f3, 4(%r2)
	MUL.s	%f2, %f2, %f3
	LW	%r3, 0(%r30) # restore1
	SWC1	%f1, 24(%r30)
	SWC1	%f2, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 24(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 4(%r30) # restore1
	LWC1	%f3, 8(%r1)
	MUL.s	%f2, %f2, %f3
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 40(%r30)
	SWC1	%f2, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
solver2nd_rot_b.1842:
	LW	%r3, 4(%r26)
	LWC1	%f1, 8(%r3)
	LWC1	%f2, 4(%r2)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 4(%r3)
	LWC1	%f3, 8(%r2)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r3, 8(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_r1.1798
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f3, 8(%r2)
	MUL.s	%f2, %f2, %f3
	LWC1	%f3, 8(%r1)
	LWC1	%f4, 0(%r2)
	MUL.s	%f3, %f3, %f4
	ADD.s	%f2, %f2, %f3
	LW	%r3, 0(%r30) # restore1
	SWC1	%f1, 24(%r30)
	SWC1	%f2, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_r2.1800
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 24(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f3, 4(%r2)
	MUL.s	%f2, %f2, %f3
	LWC1	%f3, 4(%r1)
	LWC1	%f4, 0(%r2)
	MUL.s	%f3, %f3, %f4
	ADD.s	%f2, %f2, %f3
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 40(%r30)
	SWC1	%f2, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_r3.1802
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
solver_second.1845:
	LW	%r3, 16(%r26)
	LW	%r4, 12(%r26)
	LW	%r5, 8(%r26)
	LW	%r6, 4(%r26)
	SW	%r4, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r5, 8(%r30)
	SW	%r6, 12(%r30)
	SW	%r2, 16(%r30)
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	in_prod_sqr_obj.1833
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_isrot.1774
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5773
	LWC1	%f1, 24(%r30) # restore2
	J	BEQ_cont.5774
BEQ_else.5773:
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	in_prod_co_objrot.1836
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	ADD.s	%f1, %f2, %f1
BEQ_cont.5774:
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.eq.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5775
	LA	%r29, l.3971
	LWC1	%f2, 0(%r29)
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 16(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	SWC1	%f1, 32(%r30)
	SWC1	%f2, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30)
	ADDI	%r30, %r30, 56
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_isrot.1774
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5776
	LWC1	%f1, 48(%r30) # restore2
	J	BEQ_cont.5777
BEQ_else.5776:
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 16(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30)
	ADDI	%r30, %r30, 64
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	ADD.s	%f1, %f2, %f1
BEQ_cont.5777:
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	in_prod_sqr_obj.1833
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_isrot.1774
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5778
	LWC1	%f1, 64(%r30) # restore2
	J	BEQ_cont.5779
BEQ_else.5778:
	LW	%r1, 20(%r30) # restore1
	LW	%r2, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	in_prod_co_objrot.1836
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	ADD.s	%f1, %f2, %f1
BEQ_cont.5779:
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_form.1768
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.5780
	LA	%r29, l.3996
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 72(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	J	BEQ_cont.5781
BEQ_else.5780:
	LWC1	%f1, 72(%r30) # restore2
BEQ_cont.5781:
	LA	%r29, l.4213
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 32(%r30) # restore2
	MUL.s	%f2, %f2, %f3
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 56(%r30) # restore2
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	fsqr.1762
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	SUB.s	%f1, %f1, %f2
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5782
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5782:
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5783
	LWC1	%f1, 88(%r30) # restore2
	SUB.s	%f1, %f0, %f1
	J	BEQ_cont.5784
BEQ_else.5783:
	LWC1	%f1, 88(%r30) # restore2
BEQ_cont.5784:
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f1, %f2
	LA	%r29, l.3971
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	LWC1	%f2, 32(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5775:
	ADDI	%r1, %r0, 0
	JR	%r31
solver.1848:
	LW	%r4, 20(%r26)
	LW	%r5, 16(%r26)
	LW	%r6, 12(%r26)
	LW	%r7, 8(%r26)
	LW	%r8, 4(%r26)
	SLL	%r1, %r1, 2
	ADD	%r29, %r8, %r1
	LW	%r1, 0(%r29)
	LWC1	%f1, 0(%r3)
	SW	%r6, 0(%r30)
	SW	%r5, 4(%r30)
	SW	%r2, 8(%r30)
	SW	%r7, 12(%r30)
	SW	%r1, 16(%r30)
	SW	%r3, 20(%r30)
	SW	%r4, 24(%r30)
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_x.1782
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 20(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LW	%r3, 16(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_y.1784
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 20(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 16(%r30) # restore1
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_z.1786
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r1, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_form.1768
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.5786
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5786:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.5787
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5787:
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
is_rect_outside.1852:
	LW	%r2, 4(%r26)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_a.1776
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
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5788
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5789
BEQ_else.5788:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_b.1778
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
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5790
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5791
BEQ_else.5790:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5792
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5793
BEQ_else.5792:
	ADDI	%r1, %r0, 1
BEQ_cont.5793:
BEQ_cont.5791:
BEQ_cont.5789:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5794
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5795
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5795:
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5794:
	LW	%r1, 0(%r30) # restore1
	J	o_isinvert.1772
is_plane_outside.1854:
	LW	%r2, 4(%r26)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 8(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5796
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5797
BEQ_else.5796:
	ADDI	%r1, %r0, 1
BEQ_cont.5797:
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	xor.1759
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5798
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5798:
	ADDI	%r1, %r0, 0
	JR	%r31
is_second_outside.1856:
	LW	%r2, 4(%r26)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	in_prod_sqr_obj.1833
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_form.1768
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.5799
	LA	%r29, l.3996
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 8(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	J	BEQ_cont.5800
BEQ_else.5799:
	LWC1	%f1, 8(%r30) # restore2
BEQ_cont.5800:
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_isrot.1774
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5801
	LWC1	%f1, 16(%r30) # restore2
	J	BEQ_cont.5802
BEQ_else.5801:
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	in_prod_co_objrot.1836
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
BEQ_cont.5802:
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5803
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5804
BEQ_else.5803:
	ADDI	%r1, %r0, 1
BEQ_cont.5804:
	LW	%r2, 4(%r30) # restore1
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	xor.1759
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5805
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5805:
	ADDI	%r1, %r0, 0
	JR	%r31
is_outside.1858:
	LW	%r2, 20(%r26)
	LW	%r3, 16(%r26)
	LW	%r4, 12(%r26)
	LW	%r5, 8(%r26)
	LW	%r6, 4(%r26)
	LWC1	%f1, 0(%r6)
	SW	%r3, 0(%r30)
	SW	%r5, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r1, 12(%r30)
	SW	%r6, 16(%r30)
	SW	%r2, 20(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_x.1782
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 16(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LW	%r3, 12(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_y.1784
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 16(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 12(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_z.1786
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r1, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_form.1768
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.5806
	LW	%r1, 12(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5806:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.5807
	LW	%r1, 12(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5807:
	LW	%r1, 12(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
check_all_inside.1860:
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	SLL	%r5, %r1, 2
	ADD	%r29, %r2, %r5
	LW	%r5, 0(%r29)
	ADDI	%r6, %r0, 1
	SUB	%r29, %r0, %r6
	ADDI	%r6, %r29, 0
	BNE	%r5, %r6, BEQ_else.5808
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5808:
	SLL	%r5, %r5, 2
	ADD	%r29, %r3, %r5
	LW	%r3, 0(%r29)
	SW	%r2, 0(%r30)
	SW	%r26, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	ADDI	%r26, %r4, 0 # args
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5809
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5809:
	ADDI	%r1, %r0, 0
	JR	%r31
shadow_check_and_group.1863:
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
	BNE	%r10, %r11, BEQ_else.5810
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5810:
	SLL	%r10, %r1, 2
	ADD	%r29, %r2, %r10
	LW	%r10, 0(%r29)
	SW	%r9, 0(%r30)
	SW	%r8, 4(%r30)
	SW	%r7, 8(%r30)
	SW	%r3, 12(%r30)
	SW	%r2, 16(%r30)
	SW	%r26, 20(%r30)
	SW	%r1, 24(%r30)
	SW	%r6, 28(%r30)
	SW	%r10, 32(%r30)
	SW	%r4, 36(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r7, 0 # args
	ADDI	%r1, %r10, 0 # args
	ADDI	%r26, %r5, 0 # args
	SW	%r29, 44(%r30)
	ADDI	%r30, %r30, 48
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 36(%r30) # restore1
	LWC1	%f1, 0(%r2)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5811
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5812
BEQ_else.5811:
	LA	%r29, l.4239
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5813
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5814
BEQ_else.5813:
	ADDI	%r1, %r0, 1
BEQ_cont.5814:
BEQ_cont.5812:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5815
	LW	%r1, 32(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 28(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5816
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5816:
	LW	%r1, 24(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 16(%r30) # restore1
	LW	%r3, 12(%r30) # restore1
	LW	%r26, 20(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5815:
	LA	%r29, l.4240
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
	LW	%r1, 8(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f2, %f2, %f1
	LW	%r2, 12(%r30) # restore1
	LWC1	%f3, 0(%r2)
	ADD.s	%f2, %f2, %f3
	LW	%r3, 4(%r30) # restore1
	SWC1	%f2, 0(%r3)
	LWC1	%f2, 4(%r1)
	MUL.s	%f2, %f2, %f1
	LWC1	%f3, 4(%r2)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 4(%r3)
	LWC1	%f2, 8(%r1)
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 8(%r2)
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r3)
	ADDI	%r1, %r0, 0
	LW	%r3, 16(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 44(%r30)
	ADDI	%r30, %r30, 48
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5817
	LW	%r1, 24(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 16(%r30) # restore1
	LW	%r3, 12(%r30) # restore1
	LW	%r26, 20(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5817:
	ADDI	%r1, %r0, 1
	JR	%r31
shadow_check_one_or_group.1867:
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SLL	%r6, %r1, 2
	ADD	%r29, %r2, %r6
	LW	%r6, 0(%r29)
	ADDI	%r7, %r0, 1
	SUB	%r29, %r0, %r7
	ADDI	%r7, %r29, 0
	BNE	%r6, %r7, BEQ_else.5818
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5818:
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
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5819
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5819:
	ADDI	%r1, %r0, 1
	JR	%r31
shadow_check_one_or_matrix.1871:
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
	BNE	%r9, %r10, BEQ_else.5820
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5820:
	ADDI	%r27, %r0, 99
	BNE	%r9, %r27, BEQ_else.5821
	ADDI	%r4, %r0, 1
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r26, 8(%r30)
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r8, 0 # args
	ADDI	%r1, %r4, 0 # args
	ADDI	%r26, %r6, 0 # args
	SW	%r29, 20(%r30)
	ADDI	%r30, %r30, 24
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5822
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5822:
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5821:
	SW	%r8, 16(%r30)
	SW	%r6, 20(%r30)
	SW	%r4, 24(%r30)
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r26, 8(%r30)
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r7, 0 # args
	ADDI	%r1, %r9, 0 # args
	ADDI	%r26, %r5, 0 # args
	SW	%r29, 28(%r30)
	ADDI	%r30, %r30, 32
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5823
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5823:
	LA	%r29, l.4255
	LWC1	%f1, 0(%r29)
	LW	%r1, 24(%r30) # restore1
	LWC1	%f2, 0(%r1)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5824
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5824:
	ADDI	%r1, %r0, 1
	LW	%r2, 16(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 20(%r30) # restore1
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
	BNE	%r1, %r27, BEQ_else.5825
	LW	%r1, 12(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5825:
	ADDI	%r1, %r0, 1
	JR	%r31
solve_each_element.1875:
	LW	%r3, 48(%r26)
	LW	%r4, 44(%r26)
	LW	%r5, 40(%r26)
	LW	%r6, 36(%r26)
	LW	%r7, 32(%r26)
	LW	%r8, 28(%r26)
	LW	%r9, 24(%r26)
	LW	%r10, 20(%r26)
	LW	%r11, 16(%r26)
	LW	%r12, 12(%r26)
	LW	%r13, 8(%r26)
	LW	%r14, 4(%r26)
	SLL	%r15, %r1, 2
	ADD	%r29, %r2, %r15
	LW	%r15, 0(%r29)
	ADDI	%r16, %r0, 1
	SUB	%r29, %r0, %r16
	ADDI	%r16, %r29, 0
	BNE	%r15, %r16, BEQ_else.5826
	JR	%r31
BEQ_else.5826:
	SW	%r26, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r12, 8(%r30)
	SW	%r9, 12(%r30)
	SW	%r11, 16(%r30)
	SW	%r2, 20(%r30)
	SW	%r14, 24(%r30)
	SW	%r13, 28(%r30)
	SW	%r4, 32(%r30)
	SW	%r3, 36(%r30)
	SW	%r5, 40(%r30)
	SW	%r6, 44(%r30)
	SW	%r10, 48(%r30)
	SW	%r8, 52(%r30)
	SW	%r15, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r15, 0 # args
	ADDI	%r26, %r7, 0 # args
	ADDI	%r3, %r4, 0 # args
	SW	%r29, 60(%r30)
	ADDI	%r30, %r30, 64
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5828
	LW	%r1, 56(%r30) # restore1
	SLL	%r1, %r1, 2
	LW	%r2, 52(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5830
	ADDI	%r1, %r0, 1
	LW	%r2, 48(%r30) # restore1
	SW	%r1, 0(%r2)
	J	BEQ_cont.5831
BEQ_else.5830:
BEQ_cont.5831:
	J	BEQ_cont.5829
BEQ_else.5828:
	LW	%r2, 44(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LA	%r29, l.4255
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5832
	J	BEQ_cont.5833
BEQ_else.5832:
	LW	%r2, 40(%r30) # restore1
	LWC1	%f2, 0(%r2)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5834
	J	BEQ_cont.5835
BEQ_else.5834:
	LA	%r29, l.4240
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
	LW	%r3, 36(%r30) # restore1
	LWC1	%f2, 0(%r3)
	MUL.s	%f2, %f2, %f1
	LW	%r4, 32(%r30) # restore1
	LWC1	%f3, 0(%r4)
	ADD.s	%f2, %f2, %f3
	LW	%r5, 28(%r30) # restore1
	SWC1	%f2, 0(%r5)
	LWC1	%f2, 4(%r3)
	MUL.s	%f2, %f2, %f1
	LWC1	%f3, 4(%r4)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 4(%r5)
	LWC1	%f2, 8(%r3)
	MUL.s	%f2, %f2, %f1
	LWC1	%f3, 8(%r4)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 8(%r5)
	ADDI	%r3, %r0, 0
	LW	%r4, 20(%r30) # restore1
	LW	%r26, 24(%r30) # restore1
	SW	%r1, 60(%r30)
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 76(%r30)
	ADDI	%r30, %r30, 80
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5836
	J	BEQ_cont.5837
BEQ_else.5836:
	LW	%r1, 40(%r30) # restore1
	LWC1	%f1, 64(%r30) # restore2
	SWC1	%f1, 0(%r1)
	LW	%r1, 28(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r2, 16(%r30) # restore1
	SWC1	%f1, 0(%r2)
	LWC1	%f1, 4(%r1)
	SWC1	%f1, 4(%r2)
	LWC1	%f1, 8(%r1)
	SWC1	%f1, 8(%r2)
	LW	%r1, 12(%r30) # restore1
	LW	%r2, 60(%r30) # restore1
	SW	%r2, 0(%r1)
	LW	%r1, 8(%r30) # restore1
	LW	%r2, 56(%r30) # restore1
	SW	%r2, 0(%r1)
BEQ_cont.5837:
BEQ_cont.5835:
BEQ_cont.5833:
BEQ_cont.5829:
	LW	%r1, 48(%r30) # restore1
	LW	%r1, 0(%r1)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5838
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 20(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5838:
	JR	%r31
solve_one_or_network.1878:
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SLL	%r6, %r1, 2
	ADD	%r29, %r2, %r6
	LW	%r6, 0(%r29)
	ADDI	%r7, %r0, 1
	SUB	%r29, %r0, %r7
	ADDI	%r7, %r29, 0
	BNE	%r6, %r7, BEQ_else.5840
	JR	%r31
BEQ_else.5840:
	SLL	%r6, %r6, 2
	ADD	%r29, %r5, %r6
	LW	%r5, 0(%r29)
	ADDI	%r6, %r0, 0
	SW	%r6, 0(%r4)
	ADDI	%r4, %r0, 0
	SW	%r2, 0(%r30)
	SW	%r26, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r5, 0 # args
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
	ADDI	%r1, %r1, 1
	LW	%r2, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
trace_or_matrix.1881:
	LW	%r3, 24(%r26)
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
	BNE	%r10, %r11, BEQ_else.5842
	JR	%r31
BEQ_else.5842:
	SW	%r2, 0(%r30)
	SW	%r26, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r27, %r0, 99
	BNE	%r10, %r27, BEQ_else.5844
	ADDI	%r3, %r0, 1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r9, 0 # args
	ADDI	%r1, %r3, 0 # args
	ADDI	%r26, %r8, 0 # args
	SW	%r29, 12(%r30)
	ADDI	%r30, %r30, 16
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.5845
BEQ_else.5844:
	SW	%r9, 12(%r30)
	SW	%r8, 16(%r30)
	SW	%r5, 20(%r30)
	SW	%r6, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r10, 0 # args
	ADDI	%r26, %r7, 0 # args
	ADDI	%r3, %r4, 0 # args
	SW	%r29, 28(%r30)
	ADDI	%r30, %r30, 32
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5846
	J	BEQ_cont.5847
BEQ_else.5846:
	LW	%r1, 24(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r1, 20(%r30) # restore1
	LWC1	%f2, 0(%r1)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5848
	J	BEQ_cont.5849
BEQ_else.5848:
	ADDI	%r1, %r0, 1
	LW	%r2, 12(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30)
	ADDI	%r30, %r30, 32
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.5849:
BEQ_cont.5847:
BEQ_cont.5845:
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 0(%r30) # restore1
	LW	%r26, 4(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
tracer.1884:
	LW	%r1, 12(%r26)
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	LA	%r29, l.4288
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 0(%r2)
	ADDI	%r4, %r0, 0
	LW	%r3, 0(%r3)
	SW	%r2, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r26, %r1, 0 # args
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, 8
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LA	%r29, l.4255
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5850
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5850:
	LA	%r29, l.4292
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5851
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5851:
	ADDI	%r1, %r0, 1
	JR	%r31
get_nvector_rect.1887:
	LW	%r1, 12(%r26)
	LW	%r2, 8(%r26)
	LW	%r3, 4(%r26)
	LW	%r3, 0(%r3)
	ADDI	%r27, %r0, 1
	BNE	%r3, %r27, BEQ_else.5852
	LWC1	%f1, 0(%r1)
	SW	%r2, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	sgn.1807
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 4(%r1)
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5852:
	ADDI	%r27, %r0, 2
	BNE	%r3, %r27, BEQ_else.5854
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 0(%r2)
	LWC1	%f1, 4(%r1)
	SW	%r2, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	sgn.1807
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5854:
	ADDI	%r27, %r0, 3
	BNE	%r3, %r27, BEQ_else.5856
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 0(%r2)
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 4(%r2)
	LWC1	%f1, 8(%r1)
	SW	%r2, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	sgn.1807
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5856:
	JR	%r31
get_nvector_plane.1889:
	LW	%r2, 4(%r26)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	JR	%r31
get_nvector_second_norot.1891:
	LW	%r3, 4(%r26)
	LWC1	%f1, 0(%r2)
	SW	%r2, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r1, 8(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_x.1782
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_y.1784
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 8(%r30) # restore1
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_z.1786
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	J	normalize_vector.1804
get_nvector_second_rot.1894:
	LW	%r3, 8(%r26)
	LW	%r4, 4(%r26)
	LWC1	%f1, 0(%r2)
	SW	%r4, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r2, 8(%r30)
	SW	%r3, 12(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_x.1782
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 8(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LW	%r3, 4(%r30) # restore1
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_y.1784
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 8(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_z.1786
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LWC1	%f1, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_a.1776
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 48(%r30)
	SWC1	%f2, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_r3.1802
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 64(%r30)
	SWC1	%f2, 72(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_param_r2.1800
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 64(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	fhalf.1764
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r2, 12(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LW	%r3, 4(%r30) # restore1
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 88(%r30)
	SWC1	%f2, 96(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	o_param_r3.1802
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 104(%r30)
	SWC1	%f2, 112(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	o_param_r1.1798
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
	JAL	fhalf.1764
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LW	%r2, 12(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r3, 4(%r30) # restore1
	SWC1	%f1, 120(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	o_param_c.1780
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 120(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 128(%r30)
	SWC1	%f2, 136(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	o_param_r2.1800
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 144(%r30)
	SWC1	%f2, 152(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	o_param_r1.1798
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 152(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 144(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	fhalf.1764
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r2, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	o_isinvert.1772
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	J	normalize_vector.1804
get_nvector.1897:
	LW	%r3, 16(%r26)
	LW	%r4, 12(%r26)
	LW	%r5, 8(%r26)
	LW	%r6, 4(%r26)
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r4, 8(%r30)
	SW	%r1, 12(%r30)
	SW	%r6, 16(%r30)
	SW	%r5, 20(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_form.1768
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.5861
	LW	%r26, 20(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5861:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.5862
	LW	%r1, 12(%r30) # restore1
	LW	%r26, 16(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5862:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_isrot.1774
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5863
	LW	%r1, 12(%r30) # restore1
	LW	%r2, 4(%r30) # restore1
	LW	%r26, 8(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5863:
	LW	%r1, 12(%r30) # restore1
	LW	%r2, 4(%r30) # restore1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
utexture.1900:
	LW	%r3, 4(%r26)
	SW	%r2, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_texturetype.1766
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
	JAL	o_color_red.1792
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
	JAL	o_color_green.1794
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
	JAL	o_color_blue.1796
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r2, 12(%r30) # restore1
	ADDI	%r27, %r0, 1
	BNE	%r2, %r27, BEQ_else.5864
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_x.1782
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4358
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
	LA	%r29, l.4359
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.4350
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 24(%r30) # restore2
	SUB.s	%f1, %f3, %f1
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5865
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5866
BEQ_else.5865:
	ADDI	%r1, %r0, 1
BEQ_cont.5866:
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 8(%r30) # restore1
	SW	%r1, 32(%r30)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_z.1786
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4358
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
	LA	%r29, l.4359
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.4350
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 48(%r30) # restore2
	SUB.s	%f1, %f3, %f1
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5868
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5869
BEQ_else.5868:
	ADDI	%r1, %r0, 1
BEQ_cont.5869:
	LW	%r2, 32(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.5870
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5872
	LA	%r29, l.4345
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.5873
BEQ_else.5872:
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
BEQ_cont.5873:
	J	BEQ_cont.5871
BEQ_else.5870:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5874
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.5875
BEQ_else.5874:
	LA	%r29, l.4345
	LWC1	%f1, 0(%r29)
BEQ_cont.5875:
BEQ_cont.5871:
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	JR	%r31
BEQ_else.5864:
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.5877
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LA	%r29, l.4354
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
	JAL	fsqr.1762
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4345
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f2, 0(%r1)
	LA	%r29, l.4345
	LWC1	%f2, 0(%r29)
	LA	%r29, l.3996
	LWC1	%f3, 0(%r29)
	SUB.s	%f1, %f3, %f1
	MUL.s	%f1, %f2, %f1
	SWC1	%f1, 4(%r1)
	JR	%r31
BEQ_else.5877:
	ADDI	%r27, %r0, 3
	BNE	%r2, %r27, BEQ_else.5879
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_x.1782
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
	JAL	o_param_z.1786
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
	JAL	fsqr.1762
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
	JAL	fsqr.1762
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
	LA	%r29, l.4350
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
	LA	%r29, l.4341
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
	JAL	fsqr.1762
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4345
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	SWC1	%f2, 4(%r1)
	LA	%r29, l.3996
	LWC1	%f2, 0(%r29)
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4345
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5879:
	ADDI	%r27, %r0, 4
	BNE	%r2, %r27, BEQ_else.5881
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 0(%r2)
	LW	%r3, 8(%r30) # restore1
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	o_param_x.1782
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
	JAL	o_param_a.1776
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
	JAL	o_param_z.1786
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
	JAL	o_param_c.1780
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
	JAL	fsqr.1762
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
	JAL	fsqr.1762
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 152(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4338
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 120(%r30) # restore2
	SWC1	%f1, 160(%r30)
	SWC1	%f2, 168(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 168(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5882
	LWC1	%f1, 120(%r30) # restore2
	LWC1	%f2, 144(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	min_caml_atan
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4340
	LWC1	%f2, 0(%r29)
	LA	%r29, l.4341
	LWC1	%f3, 0(%r29)
	DIV.s	%f2, %f2, %f3
	MUL.s	%f1, %f1, %f2
	J	BEQ_cont.5883
BEQ_else.5882:
	LA	%r29, l.4339
	LWC1	%f1, 0(%r29)
BEQ_cont.5883:
	SWC1	%f1, 176(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	min_caml_floor
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 176(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f3, 4(%r1)
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 184(%r30)
	SWC1	%f3, 192(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 204(%r30) # save link register
	ADDI	%r30, %r30, 208
	JAL	o_param_y.1784
	ADDI	%r29, %r0, 208
	SUB	%r30, %r30, %r29
	LW	%r29, 204(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 192(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 200(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 212(%r30) # save link register
	ADDI	%r30, %r30, 216
	JAL	o_param_b.1778
	ADDI	%r29, %r0, 216
	SUB	%r30, %r30, %r29
	LW	%r29, 212(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 212(%r30) # save link register
	ADDI	%r30, %r30, 216
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 216
	SUB	%r30, %r30, %r29
	LW	%r29, 212(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 200(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r29, l.4338
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 176(%r30) # restore2
	SWC1	%f1, 208(%r30)
	SWC1	%f2, 216(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 228(%r30) # save link register
	ADDI	%r30, %r30, 232
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 232
	SUB	%r30, %r30, %r29
	LW	%r29, 228(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 216(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5884
	LWC1	%f1, 160(%r30) # restore2
	LWC1	%f2, 208(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 228(%r30) # save link register
	ADDI	%r30, %r30, 232
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 232
	SUB	%r30, %r30, %r29
	LW	%r29, 228(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 228(%r30) # save link register
	ADDI	%r30, %r30, 232
	JAL	min_caml_atan
	ADDI	%r29, %r0, 232
	SUB	%r30, %r30, %r29
	LW	%r29, 228(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4340
	LWC1	%f2, 0(%r29)
	LA	%r29, l.4341
	LWC1	%f3, 0(%r29)
	DIV.s	%f2, %f2, %f3
	MUL.s	%f1, %f1, %f2
	J	BEQ_cont.5885
BEQ_else.5884:
	LA	%r29, l.4339
	LWC1	%f1, 0(%r29)
BEQ_cont.5885:
	SWC1	%f1, 224(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 236(%r30) # save link register
	ADDI	%r30, %r30, 240
	JAL	min_caml_floor
	ADDI	%r29, %r0, 240
	SUB	%r30, %r30, %r29
	LW	%r29, 236(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 224(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4343
	LWC1	%f2, 0(%r29)
	LA	%r29, l.4344
	LWC1	%f3, 0(%r29)
	LWC1	%f4, 184(%r30) # restore2
	SUB.s	%f3, %f3, %f4
	SWC1	%f1, 232(%r30)
	SWC1	%f2, 240(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 252(%r30) # save link register
	ADDI	%r30, %r30, 256
	JAL	fsqr.1762
	ADDI	%r29, %r0, 256
	SUB	%r30, %r30, %r29
	LW	%r29, 252(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 240(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4344
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 232(%r30) # restore2
	SUB.s	%f2, %f2, %f3
	SWC1	%f1, 248(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 260(%r30) # save link register
	ADDI	%r30, %r30, 264
	JAL	fsqr.1762
	ADDI	%r29, %r0, 264
	SUB	%r30, %r30, %r29
	LW	%r29, 260(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 248(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5886
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.5887
BEQ_else.5886:
	LA	%r29, l.4345
	LWC1	%f2, 0(%r29)
	LA	%r29, l.4346
	LWC1	%f3, 0(%r29)
	DIV.s	%f2, %f2, %f3
	MUL.s	%f1, %f1, %f2
BEQ_cont.5887:
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5881:
	JR	%r31
in_prod.1903:
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
accumulate_vec_mul.1906:
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
raytracing.1910:
	LW	%r2, 60(%r26)
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
	SW	%r26, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r6, 8(%r30)
	SW	%r4, 12(%r30)
	SW	%r11, 16(%r30)
	SW	%r7, 20(%r30)
	SW	%r9, 24(%r30)
	SW	%r14, 28(%r30)
	SW	%r13, 32(%r30)
	SW	%r10, 36(%r30)
	SW	%r15, 40(%r30)
	SW	%r8, 44(%r30)
	SW	%r16, 48(%r30)
	SWC1	%f1, 56(%r30)
	SW	%r12, 64(%r30)
	SW	%r2, 68(%r30)
	SW	%r1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	ADDI	%r26, %r5, 0 # args
	SW	%r29, 76(%r30)
	ADDI	%r30, %r30, 80
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 76(%r30)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5892
	LW	%r2, 72(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.5894
	J	BEQ_cont.5895
BEQ_else.5894:
	LW	%r3, 68(%r30) # restore1
	LW	%r4, 64(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	in_prod.1903
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5896
	J	BEQ_cont.5897
BEQ_else.5896:
	SWC1	%f1, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	fsqr.1762
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 48(%r30) # restore1
	LWC1	%f3, 0(%r1)
	MUL.s	%f1, %f1, %f3
	LW	%r1, 44(%r30) # restore1
	LWC1	%f3, 0(%r1)
	ADD.s	%f3, %f3, %f1
	SWC1	%f3, 0(%r1)
	LWC1	%f3, 4(%r1)
	ADD.s	%f3, %f3, %f1
	SWC1	%f3, 4(%r1)
	LWC1	%f3, 8(%r1)
	ADD.s	%f1, %f3, %f1
	SWC1	%f1, 8(%r1)
BEQ_cont.5897:
BEQ_cont.5895:
	J	BEQ_cont.5893
BEQ_else.5892:
BEQ_cont.5893:
	LW	%r1, 76(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5898
	JR	%r31
BEQ_else.5898:
	LW	%r1, 40(%r30) # restore1
	LW	%r1, 0(%r1)
	SLL	%r1, %r1, 2
	LW	%r2, 36(%r30) # restore1
	ADD	%r29, %r2, %r1
	LW	%r1, 0(%r29)
	LW	%r2, 28(%r30) # restore1
	LW	%r26, 32(%r30) # restore1
	SW	%r1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30)
	ADDI	%r30, %r30, 96
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	LW	%r2, 24(%r30) # restore1
	LW	%r2, 0(%r2)
	LW	%r3, 28(%r30) # restore1
	LW	%r26, 20(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30)
	ADDI	%r30, %r30, 96
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5900
	LW	%r1, 16(%r30) # restore1
	LW	%r2, 64(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	in_prod.1903
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5902
	LA	%r29, l.4387
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
	J	BEQ_cont.5903
BEQ_else.5902:
	LA	%r29, l.4387
	LWC1	%f1, 0(%r29)
BEQ_cont.5903:
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 88(%r30) # restore1
	SWC1	%f1, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	o_diffuse.1788
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	J	BEQ_cont.5901
BEQ_else.5900:
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
BEQ_cont.5901:
	LW	%r1, 88(%r30) # restore1
	LW	%r2, 28(%r30) # restore1
	LW	%r26, 12(%r30) # restore1
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30)
	ADDI	%r30, %r30, 120
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f1, 104(%r30) # restore2
	LW	%r1, 44(%r30) # restore1
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	accumulate_vec_mul.1906
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 72(%r30) # restore1
	ADDI	%r27, %r0, 4
	SLT	%r27, %r27, %r1
	BNE	%r27, %r0, BEQ_else.5905
	LA	%r29, l.4388
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 56(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5906
	JR	%r31
BEQ_else.5906:
	LA	%r29, l.4389
	LWC1	%f1, 0(%r29)
	LW	%r2, 68(%r30) # restore1
	LW	%r3, 16(%r30) # restore1
	SWC1	%f1, 112(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	in_prod.1903
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 68(%r30) # restore1
	LW	%r2, 16(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	accumulate_vec_mul.1906
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 88(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	o_reflectiontype.1770
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.5908
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	LW	%r1, 88(%r30) # restore1
	SWC1	%f1, 120(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	o_hilight.1790
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 120(%r30) # restore2
	C.eq.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5909
	LW	%r1, 68(%r30) # restore1
	LW	%r2, 64(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	in_prod.1903
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LA	%r29, l.3995
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5910
	JR	%r31
BEQ_else.5910:
	ADDI	%r29, %r31, 0
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	fsqr.1762
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	fsqr.1762
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 104(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 88(%r30) # restore1
	SWC1	%f1, 128(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 140(%r30) # save link register
	ADDI	%r30, %r30, 144
	JAL	o_hilight.1790
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 44(%r30) # restore1
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
BEQ_else.5909:
	JR	%r31
BEQ_else.5908:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.5914
	LW	%r1, 28(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 0(%r2)
	LWC1	%f1, 4(%r1)
	SWC1	%f1, 4(%r2)
	LWC1	%f1, 8(%r1)
	SWC1	%f1, 8(%r2)
	LA	%r29, l.3996
	LWC1	%f1, 0(%r29)
	LW	%r1, 88(%r30) # restore1
	SWC1	%f1, 136(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	o_diffuse.1788
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 72(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
BEQ_else.5914:
	JR	%r31
BEQ_else.5905:
	JR	%r31
write_rgb.1913:
	LW	%r1, 4(%r26)
	LWC1	%f1, 0(%r1)
	SW	%r1, 0(%r30)
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
	BNE	%r27, %r0, BEQ_else.5917
	J	BEQ_cont.5918
BEQ_else.5917:
	ADDI	%r1, %r0, 255
BEQ_cont.5918:
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 4(%r1)
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
	BNE	%r27, %r0, BEQ_else.5919
	J	BEQ_cont.5920
BEQ_else.5919:
	ADDI	%r1, %r0, 255
BEQ_cont.5920:
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 8(%r1)
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
	BNE	%r27, %r0, BEQ_else.5921
	J	BEQ_cont.5922
BEQ_else.5921:
	ADDI	%r1, %r0, 255
BEQ_cont.5922:
	J	min_caml_print_int
write_ppm_header.1915:
	LW	%r1, 4(%r26)
	ADDI	%r2, %r0, 80
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 48
	ADDI	%r1, %r1, 6
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 10
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_int
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
	JAL	min_caml_print_int
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
	ADDI	%r1, %r0, 10
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_int
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
	J	min_caml_print_int
scan_point.1917:
	LW	%r2, 60(%r26)
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
	LW	%r8, 0(%r8)
	SLT	%r27, %r1, %r8
	BNE	%r27, %r0, BEQ_else.5923
	JR	%r31
BEQ_else.5923:
	SW	%r26, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r3, 8(%r30)
	SW	%r15, 12(%r30)
	SW	%r14, 16(%r30)
	SW	%r6, 20(%r30)
	SW	%r7, 24(%r30)
	SW	%r12, 28(%r30)
	SW	%r9, 32(%r30)
	SW	%r5, 36(%r30)
	SW	%r10, 40(%r30)
	SW	%r4, 44(%r30)
	SW	%r2, 48(%r30)
	SW	%r16, 52(%r30)
	SW	%r13, 56(%r30)
	SW	%r11, 60(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 60(%r30) # restore1
	LWC1	%f2, 0(%r1)
	SUB.s	%f1, %f1, %f2
	LW	%r1, 56(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 52(%r30) # restore1
	LWC1	%f2, 4(%r1)
	MUL.s	%f2, %f1, %f2
	LW	%r2, 48(%r30) # restore1
	LWC1	%f3, 0(%r2)
	ADD.s	%f2, %f2, %f3
	LW	%r3, 44(%r30) # restore1
	SWC1	%f2, 0(%r3)
	LW	%r4, 40(%r30) # restore1
	LWC1	%f2, 0(%r4)
	LWC1	%f3, 0(%r1)
	MUL.s	%f2, %f2, %f3
	LW	%r1, 36(%r30) # restore1
	LWC1	%f3, 4(%r1)
	SUB.s	%f2, %f2, %f3
	SWC1	%f2, 4(%r3)
	SUB.s	%f2, %f0, %f1
	LW	%r1, 32(%r30) # restore1
	LWC1	%f3, 4(%r1)
	MUL.s	%f2, %f2, %f3
	LWC1	%f3, 8(%r2)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 8(%r3)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	fsqr.1762
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 28(%r30) # restore1
	LWC1	%f2, 0(%r1)
	ADD.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 44(%r30) # restore1
	LWC1	%f2, 0(%r1)
	DIV.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LWC1	%f2, 4(%r1)
	DIV.s	%f2, %f2, %f1
	SWC1	%f2, 4(%r1)
	LWC1	%f2, 8(%r1)
	DIV.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	LW	%r1, 24(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r2, 20(%r30) # restore1
	SWC1	%f1, 0(%r2)
	LWC1	%f1, 4(%r1)
	SWC1	%f1, 4(%r2)
	LWC1	%f1, 8(%r1)
	SWC1	%f1, 8(%r2)
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 4(%r1)
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 8(%r1)
	ADDI	%r1, %r0, 0
	LA	%r29, l.3996
	LWC1	%f1, 0(%r29)
	LW	%r26, 12(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30)
	ADDI	%r30, %r30, 72
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
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
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
scan_line.1919:
	LW	%r2, 40(%r26)
	LW	%r3, 36(%r26)
	LW	%r4, 32(%r26)
	LW	%r5, 28(%r26)
	LW	%r6, 24(%r26)
	LW	%r7, 20(%r26)
	LW	%r8, 16(%r26)
	LW	%r9, 12(%r26)
	LW	%r10, 8(%r26)
	LW	%r11, 4(%r26)
	LW	%r4, 0(%r4)
	SLT	%r27, %r1, %r4
	BNE	%r27, %r0, BEQ_else.5925
	JR	%r31
BEQ_else.5925:
	LWC1	%f1, 0(%r8)
	LA	%r29, l.3996
	LWC1	%f2, 0(%r29)
	SUB.s	%f1, %f1, %f2
	SW	%r26, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r7, 8(%r30)
	SW	%r11, 12(%r30)
	SW	%r2, 16(%r30)
	SW	%r3, 20(%r30)
	SW	%r5, 24(%r30)
	SW	%r9, 28(%r30)
	SW	%r6, 32(%r30)
	SW	%r10, 36(%r30)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 36(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f1, %f2, %f1
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	fsqr.1762
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4441
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
	LW	%r1, 28(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LW	%r1, 32(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r1, 24(%r30) # restore1
	LWC1	%f2, 0(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 4(%r1)
	MUL.s	%f2, %f1, %f2
	LW	%r1, 20(%r30) # restore1
	LWC1	%f3, 0(%r1)
	SUB.s	%f2, %f2, %f3
	LW	%r2, 16(%r30) # restore1
	SWC1	%f2, 0(%r2)
	LW	%r3, 12(%r30) # restore1
	LWC1	%f2, 4(%r3)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 8(%r1)
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r2)
	ADDI	%r1, %r0, 0
	LW	%r26, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30)
	ADDI	%r30, %r30, 56
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
scan_start.1921:
	LW	%r1, 20(%r26)
	LW	%r2, 16(%r26)
	LW	%r3, 12(%r26)
	LW	%r4, 8(%r26)
	LW	%r5, 4(%r26)
	SW	%r4, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r5, 8(%r30)
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
	LW	%r1, 12(%r30) # restore1
	LW	%r1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4452
	LWC1	%f2, 0(%r29)
	DIV.s	%f2, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f2, 0(%r1)
	LA	%r29, l.3971
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 0
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
rt.1923:
	LW	%r4, 16(%r26)
	LW	%r5, 12(%r26)
	LW	%r6, 8(%r26)
	LW	%r7, 4(%r26)
	SW	%r1, 0(%r4)
	SW	%r2, 4(%r4)
	SW	%r3, 0(%r7)
	SW	%r5, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r26, %r6, 0 # args
	SW	%r29, 4(%r30)
	ADDI	%r30, %r30, 8
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r26, 0(%r30) # restore1
	LW	%r25, 0(%r26)
	JR	%r25
_min_caml_start: # main entry point
	SUB	%r0, %r0, %r0
	ADDI	%r28, %r0, 32668
   # main program start
	ADDI	%r1, %r0, 0
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
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
	ADDI	%r28, %r28, 40
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
	ADDI	%r2, %r0, 2
	ADDI	%r3, %r0, 128
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	ADDI	%r3, %r0, 1
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
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
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
	LA	%r29, l.3995
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
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
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
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
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
	ADDI	%r2, %r0, 2
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 2
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.4345
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
	ADDI	%r2, %r0, 50
	ADDI	%r3, %r0, 1
	ADDI	%r4, %r0, 1
	SUB	%r29, %r0, %r4
	ADDI	%r4, %r29, 0
	SW	%r1, 36(%r30)
	SW	%r2, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 40(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	ADDI	%r3, %r0, 1
	LW	%r4, 0(%r1)
	SW	%r1, 44(%r30)
	SW	%r2, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 48(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 14
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SW	%r1, 52(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 16
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.3995
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
	LA	%r29, l.3995
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
	ADDI	%r2, %r0, 1
	ADDI	%r3, %r0, 0
	SW	%r1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_create_array
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.4288
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
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SW	%r1, 72(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
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
	ADDI	%r3, %r0, 0
	SW	%r1, 80(%r30)
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
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
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
	LA	%r29, l.3995
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
	LA	%r29, l.3995
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
	LA	%r29, l.3995
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
	LA	%r29, l.3995
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
	LA	%r29, l.3995
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
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
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
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SW	%r1, 112(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.3995
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
	ADDI	%r2, %r0, 1
	LA	%r29, l.3995
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
	ADDI	%r2, %r0, 1
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SW	%r1, 124(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 1
	LA	%r29, l.3995
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
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r0, 3
	LA	%r29, l.3995
	LWC1	%f1, 0(%r29)
	SW	%r1, 132(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 140(%r30) # save link register
	ADDI	%r30, %r30, 144
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 32
	LA	%r3, read_environ.1811
	SW	%r3, 0(%r2)
	LW	%r3, 16(%r30) # restore1
	SW	%r3, 28(%r2)
	LW	%r4, 20(%r30) # restore1
	SW	%r4, 24(%r2)
	LW	%r5, 32(%r30) # restore1
	SW	%r5, 20(%r2)
	LW	%r6, 12(%r30) # restore1
	SW	%r6, 16(%r2)
	LW	%r6, 24(%r30) # restore1
	SW	%r6, 12(%r2)
	LW	%r7, 28(%r30) # restore1
	SW	%r7, 8(%r2)
	LW	%r8, 36(%r30) # restore1
	SW	%r8, 4(%r2)
	ADDI	%r9, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r10, read_nth_object.1813
	SW	%r10, 0(%r9)
	LW	%r10, 0(%r30) # restore1
	SW	%r10, 8(%r9)
	LW	%r11, 56(%r30) # restore1
	SW	%r11, 4(%r9)
	ADDI	%r11, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r12, read_object.1815
	SW	%r12, 0(%r11)
	SW	%r9, 4(%r11)
	ADDI	%r9, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r12, read_all_object.1817
	SW	%r12, 0(%r9)
	SW	%r11, 4(%r9)
	ADDI	%r11, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r12, read_and_network.1823
	SW	%r12, 0(%r11)
	LW	%r12, 44(%r30) # restore1
	SW	%r12, 4(%r11)
	ADDI	%r13, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r14, read_parameter.1825
	SW	%r14, 0(%r13)
	SW	%r2, 16(%r13)
	SW	%r11, 12(%r13)
	SW	%r9, 8(%r13)
	LW	%r2, 52(%r30) # restore1
	SW	%r2, 4(%r13)
	ADDI	%r9, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r11, solver_rect.1827
	SW	%r11, 0(%r9)
	LW	%r11, 104(%r30) # restore1
	SW	%r11, 8(%r9)
	LW	%r14, 60(%r30) # restore1
	SW	%r14, 4(%r9)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r16, solver_surface.1830
	SW	%r16, 0(%r15)
	SW	%r11, 8(%r15)
	SW	%r14, 4(%r15)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, solver2nd_mul_b.1839
	SW	%r17, 0(%r16)
	SW	%r11, 4(%r16)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r18, solver2nd_rot_b.1842
	SW	%r18, 0(%r17)
	SW	%r11, 4(%r17)
	ADDI	%r18, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r19, solver_second.1845
	SW	%r19, 0(%r18)
	SW	%r11, 16(%r18)
	SW	%r14, 12(%r18)
	SW	%r17, 8(%r18)
	SW	%r16, 4(%r18)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r17, solver.1848
	SW	%r17, 0(%r16)
	SW	%r11, 20(%r16)
	SW	%r15, 16(%r16)
	SW	%r18, 12(%r16)
	SW	%r9, 8(%r16)
	SW	%r10, 4(%r16)
	ADDI	%r9, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r11, is_rect_outside.1852
	SW	%r11, 0(%r9)
	LW	%r11, 112(%r30) # restore1
	SW	%r11, 4(%r9)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, is_plane_outside.1854
	SW	%r17, 0(%r15)
	SW	%r11, 4(%r15)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r18, is_second_outside.1856
	SW	%r18, 0(%r17)
	SW	%r11, 4(%r17)
	ADDI	%r18, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r19, is_outside.1858
	SW	%r19, 0(%r18)
	SW	%r11, 20(%r18)
	SW	%r17, 16(%r18)
	SW	%r9, 12(%r18)
	SW	%r15, 8(%r18)
	LW	%r9, 108(%r30) # restore1
	SW	%r9, 4(%r18)
	ADDI	%r11, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r15, check_all_inside.1860
	SW	%r15, 0(%r11)
	SW	%r10, 8(%r11)
	SW	%r18, 4(%r11)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 32
	LA	%r17, shadow_check_and_group.1863
	SW	%r17, 0(%r15)
	SW	%r14, 24(%r15)
	SW	%r16, 20(%r15)
	SW	%r10, 16(%r15)
	SW	%r6, 12(%r15)
	SW	%r9, 8(%r15)
	SW	%r11, 4(%r15)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r18, shadow_check_one_or_group.1867
	SW	%r18, 0(%r17)
	SW	%r15, 8(%r17)
	SW	%r12, 4(%r17)
	ADDI	%r15, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r18, shadow_check_one_or_matrix.1871
	SW	%r18, 0(%r15)
	SW	%r14, 16(%r15)
	SW	%r16, 12(%r15)
	SW	%r17, 8(%r15)
	SW	%r6, 4(%r15)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 56
	LA	%r18, solve_each_element.1875
	SW	%r18, 0(%r17)
	LW	%r18, 64(%r30) # restore1
	SW	%r18, 48(%r17)
	LW	%r19, 88(%r30) # restore1
	SW	%r19, 44(%r17)
	LW	%r20, 72(%r30) # restore1
	SW	%r20, 40(%r17)
	SW	%r14, 36(%r17)
	SW	%r16, 32(%r17)
	SW	%r10, 28(%r17)
	LW	%r21, 68(%r30) # restore1
	SW	%r21, 24(%r17)
	LW	%r22, 84(%r30) # restore1
	SW	%r22, 20(%r17)
	LW	%r23, 76(%r30) # restore1
	SW	%r23, 16(%r17)
	LW	%r24, 80(%r30) # restore1
	SW	%r24, 12(%r17)
	SW	%r9, 8(%r17)
	SW	%r11, 4(%r17)
	ADDI	%r9, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r11, solve_one_or_network.1878
	SW	%r11, 0(%r9)
	SW	%r17, 12(%r9)
	SW	%r22, 8(%r9)
	SW	%r12, 4(%r9)
	ADDI	%r11, %r28, 0
	ADDI	%r28, %r28, 32
	LA	%r12, trace_or_matrix.1881
	SW	%r12, 0(%r11)
	SW	%r18, 24(%r11)
	SW	%r19, 20(%r11)
	SW	%r20, 16(%r11)
	SW	%r14, 12(%r11)
	SW	%r16, 8(%r11)
	SW	%r9, 4(%r11)
	ADDI	%r9, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r12, tracer.1884
	SW	%r12, 0(%r9)
	SW	%r11, 12(%r9)
	SW	%r20, 8(%r9)
	SW	%r2, 4(%r9)
	ADDI	%r11, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r12, get_nvector_rect.1887
	SW	%r12, 0(%r11)
	SW	%r18, 12(%r11)
	LW	%r12, 92(%r30) # restore1
	SW	%r12, 8(%r11)
	SW	%r21, 4(%r11)
	ADDI	%r14, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r16, get_nvector_plane.1889
	SW	%r16, 0(%r14)
	SW	%r12, 4(%r14)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r17, get_nvector_second_norot.1891
	SW	%r17, 0(%r16)
	SW	%r12, 4(%r16)
	ADDI	%r17, %r28, 0
	ADDI	%r28, %r28, 16
	LA	%r20, get_nvector_second_rot.1894
	SW	%r20, 0(%r17)
	LW	%r20, 116(%r30) # restore1
	SW	%r20, 8(%r17)
	SW	%r12, 4(%r17)
	ADDI	%r20, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r21, get_nvector.1897
	SW	%r21, 0(%r20)
	SW	%r17, 16(%r20)
	SW	%r16, 12(%r20)
	SW	%r11, 8(%r20)
	SW	%r14, 4(%r20)
	ADDI	%r11, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r14, utexture.1900
	SW	%r14, 0(%r11)
	LW	%r14, 100(%r30) # restore1
	SW	%r14, 4(%r11)
	ADDI	%r16, %r28, 0
	ADDI	%r28, %r28, 64
	LA	%r17, raytracing.1910
	SW	%r17, 0(%r16)
	SW	%r18, 60(%r16)
	SW	%r19, 56(%r16)
	SW	%r11, 52(%r16)
	SW	%r9, 48(%r16)
	SW	%r14, 44(%r16)
	SW	%r15, 40(%r16)
	LW	%r9, 96(%r30) # restore1
	SW	%r9, 36(%r16)
	SW	%r2, 32(%r16)
	SW	%r10, 28(%r16)
	SW	%r12, 24(%r16)
	SW	%r6, 20(%r16)
	SW	%r20, 16(%r16)
	SW	%r23, 12(%r16)
	SW	%r24, 8(%r16)
	SW	%r8, 4(%r16)
	ADDI	%r2, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r6, write_rgb.1913
	SW	%r6, 0(%r2)
	SW	%r9, 4(%r2)
	ADDI	%r6, %r28, 0
	ADDI	%r28, %r28, 8
	LA	%r8, write_ppm_header.1915
	SW	%r8, 0(%r6)
	LW	%r8, 4(%r30) # restore1
	SW	%r8, 4(%r6)
	ADDI	%r10, %r28, 0
	ADDI	%r28, %r28, 64
	LA	%r11, scan_point.1917
	SW	%r11, 0(%r10)
	SW	%r1, 60(%r10)
	SW	%r2, 56(%r10)
	SW	%r18, 52(%r10)
	SW	%r3, 48(%r10)
	SW	%r19, 44(%r10)
	SW	%r4, 40(%r10)
	SW	%r8, 36(%r10)
	SW	%r5, 32(%r10)
	LW	%r2, 128(%r30) # restore1
	SW	%r2, 28(%r10)
	LW	%r4, 124(%r30) # restore1
	SW	%r4, 24(%r10)
	LW	%r11, 132(%r30) # restore1
	SW	%r11, 20(%r10)
	LW	%r12, 120(%r30) # restore1
	SW	%r12, 16(%r10)
	SW	%r9, 12(%r10)
	SW	%r16, 8(%r10)
	SW	%r7, 4(%r10)
	ADDI	%r9, %r28, 0
	ADDI	%r28, %r28, 48
	LA	%r14, scan_line.1919
	SW	%r14, 0(%r9)
	SW	%r1, 40(%r9)
	SW	%r3, 36(%r9)
	SW	%r8, 32(%r9)
	SW	%r5, 28(%r9)
	SW	%r2, 24(%r9)
	SW	%r10, 20(%r9)
	SW	%r4, 16(%r9)
	SW	%r11, 12(%r9)
	SW	%r12, 8(%r9)
	SW	%r7, 4(%r9)
	ADDI	%r1, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r2, scan_start.1921
	SW	%r2, 0(%r1)
	SW	%r6, 20(%r1)
	SW	%r8, 16(%r1)
	SW	%r4, 12(%r1)
	SW	%r9, 8(%r1)
	SW	%r12, 4(%r1)
	ADDI	%r26, %r28, 0
	ADDI	%r28, %r28, 24
	LA	%r2, rt.1923
	SW	%r2, 0(%r26)
	SW	%r8, 16(%r26)
	SW	%r1, 12(%r26)
	SW	%r13, 8(%r26)
	LW	%r1, 8(%r30) # restore1
	SW	%r1, 4(%r26)
	ADDI	%r1, %r0, 768
	ADDI	%r2, %r0, 768
	ADDI	%r3, %r0, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 140(%r30)
	ADDI	%r30, %r30, 144
	LW	%r29, 0(%r26)
	JALR	%r29
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
	ADDI	%r31, %r29, 0
   # main program end
