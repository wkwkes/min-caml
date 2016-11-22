	.data
l.4921:	 # 128.000000
	.word	1124073472
l.4910:	 # 40000.000000
	.word	1193033728
l.4858:	 # -2.000000
	.word	-1073741824
l.4857:	 # 0.100000
	.word	1036831949
l.4856:	 # 0.200000
	.word	1045220557
l.4828:	 # 20.000000
	.word	1101004800
l.4827:	 # 0.050000
	.word	1028443341
l.4823:	 # 0.250000
	.word	1048576000
l.4819:	 # 10.000000
	.word	1092616192
l.4815:	 # 0.300000
	.word	1050253722
l.4814:	 # 255.000000
	.word	1132396544
l.4813:	 # 0.500000
	.word	1056964608
l.4812:	 # 0.150000
	.word	1041865114
l.4810:	 # 3.141593
	.word	1078530011
l.4809:	 # 30.000000
	.word	1106247680
l.4808:	 # 15.000000
	.word	1097859072
l.4807:	 # 0.000100
	.word	953267991
l.4761:	 # 100000000.000000
	.word	1287568416
l.4757:	 # 1000000000.000000
	.word	1315859240
l.4724:	 # -0.100000
	.word	-1110651699
l.4709:	 # 0.010000
	.word	1008981770
l.4708:	 # -0.200000
	.word	-1102263091
l.4682:	 # 4.000000
	.word	1082130432
l.4481:	 # -200.000000
	.word	-1018691584
l.4467:	 # 0.017453
	.word	1016003125
l.4466:	 # -1.000000
	.word	-1082130432
l.4465:	 # 1.000000
	.word	1065353216
l.4464:	 # 0.000000
	.word	0
l.4440:	 # 2.000000
	.word	1073741824
	.text
	.globl  _min_caml_start
xor.1977:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5685
	ADDI	%r1, %r2, 0
	JR	%r31
BEQ_else.5685:
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.5686
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5686:
	ADDI	%r1, %r0, 0
	JR	%r31
fsqr.1980:
	MUL.s	%f1, %f1, %f1
	JR	%r31
fhalf.1982:
	LA	%r29, l.4440
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	JR	%r31
o_texturetype.1984:
	LW	%r1, 0(%r1)
	JR	%r31
o_form.1986:
	LW	%r1, 4(%r1)
	JR	%r31
o_reflectiontype.1988:
	LW	%r1, 8(%r1)
	JR	%r31
o_isinvert.1990:
	LW	%r1, 24(%r1)
	JR	%r31
o_isrot.1992:
	LW	%r1, 12(%r1)
	JR	%r31
o_param_a.1994:
	LW	%r1, 16(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_b.1996:
	LW	%r1, 16(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_c.1998:
	LW	%r1, 16(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_param_x.2000:
	LW	%r1, 20(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_y.2002:
	LW	%r1, 20(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_z.2004:
	LW	%r1, 20(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_diffuse.2006:
	LW	%r1, 28(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_hilight.2008:
	LW	%r1, 28(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_color_red.2010:
	LW	%r1, 32(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_color_green.2012:
	LW	%r1, 32(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_color_blue.2014:
	LW	%r1, 32(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
o_param_r1.2016:
	LW	%r1, 36(%r1)
	LWC1	%f1, 0(%r1)
	JR	%r31
o_param_r2.2018:
	LW	%r1, 36(%r1)
	LWC1	%f1, 4(%r1)
	JR	%r31
o_param_r3.2020:
	LW	%r1, 36(%r1)
	LWC1	%f1, 8(%r1)
	JR	%r31
normalize_vector.2022:
	LWC1	%f1, 0(%r1)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	fsqr.1980
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
	JAL	fsqr.1980
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
	JAL	fsqr.1980
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
	BNE	%r1, %r27, BEQ_else.5687
	J	BEQ_cont.5688
BEQ_else.5687:
	SUB.s	%f1, %f0, %f1
BEQ_cont.5688:
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
sgn.2025:
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5690
	LA	%r29, l.4466
	LWC1	%f1, 0(%r29)
	JR	%r31
BEQ_else.5690:
	LA	%r29, l.4465
	LWC1	%f1, 0(%r29)
	JR	%r31
rad.2027:
	LA	%r29, l.4467
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	JR	%r31
read_environ.2029:
	LA	%r1, min_caml_screen
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_screen
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_screen
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 8(%r1)
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
	JAL	rad.2027
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_cos_v
	SWC1	%f1, 16(%r30)
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_cos
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_sin_v
	LWC1	%f1, 16(%r30) # restore2
	SW	%r1, 28(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	min_caml_sin
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
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	rad.2027
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_cos_v
	SWC1	%f1, 32(%r30)
	SW	%r1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_cos
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 40(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_sin_v
	LWC1	%f1, 32(%r30) # restore2
	SW	%r1, 44(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_sin
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
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	rad.2027
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
	LA	%r1, min_caml_light
	SUB.s	%f1, %f0, %f1
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
	JAL	rad.2027
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
	LA	%r1, min_caml_light
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
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
	LA	%r1, min_caml_light
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	LA	%r1, min_caml_beam
	SW	%r1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 72(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_vp
	LA	%r2, min_caml_cos_v
	LWC1	%f1, 0(%r2)
	LA	%r2, min_caml_sin_v
	LWC1	%f2, 4(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.4481
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_vp
	LA	%r2, min_caml_sin_v
	LWC1	%f1, 0(%r2)
	SUB.s	%f1, %f0, %f1
	LA	%r29, l.4481
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_vp
	LA	%r2, min_caml_cos_v
	LWC1	%f1, 0(%r2)
	LA	%r2, min_caml_cos_v
	LWC1	%f2, 4(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.4481
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	LA	%r1, min_caml_view
	LA	%r2, min_caml_vp
	LWC1	%f1, 0(%r2)
	LA	%r2, min_caml_screen
	LWC1	%f2, 0(%r2)
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_view
	LA	%r2, min_caml_vp
	LWC1	%f1, 4(%r2)
	LA	%r2, min_caml_screen
	LWC1	%f2, 4(%r2)
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_view
	LA	%r2, min_caml_vp
	LWC1	%f1, 8(%r2)
	LA	%r2, min_caml_screen
	LWC1	%f2, 8(%r2)
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	JR	%r31
read_nth_object.2031:
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
	BNE	%r1, %r2, BEQ_else.5693
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5693:
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	min_caml_read_int
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
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
	ADDI	%r2, %r0, 3
	LA	%r29, l.4464
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
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r2, %r0, 3
	LA	%r29, l.4464
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
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5695
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5696
BEQ_else.5695:
	ADDI	%r1, %r0, 1
BEQ_cont.5696:
	ADDI	%r2, %r0, 2
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SW	%r1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 44(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_read_float
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
	LW	%r1, 44(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r2, %r0, 3
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 48(%r30) # restore1
	SWC1	%f1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 48(%r30) # restore1
	SWC1	%f1, 4(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_read_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 48(%r30) # restore1
	SWC1	%f1, 8(%r1)
	ADDI	%r2, %r0, 3
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_create_float_array
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 16(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.5697
	J	BEQ_cont.5698
BEQ_else.5697:
	SW	%r1, 52(%r30)
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
	JAL	rad.2027
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
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	rad.2027
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
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
	JAL	rad.2027
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 8(%r1)
BEQ_cont.5698:
	LW	%r2, 8(%r30) # restore1
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.5699
	ADDI	%r3, %r0, 1
	J	BEQ_cont.5700
BEQ_else.5699:
	LW	%r3, 40(%r30) # restore1
BEQ_cont.5700:
	ADDI	%r4, %r28, 0
	ADDI	%r28, %r28, 40
	SW	%r1, 36(%r4)
	LW	%r5, 48(%r30) # restore1
	SW	%r5, 32(%r4)
	LW	%r5, 44(%r30) # restore1
	SW	%r5, 28(%r4)
	SW	%r3, 24(%r4)
	LW	%r3, 24(%r30) # restore1
	SW	%r3, 20(%r4)
	LW	%r3, 20(%r30) # restore1
	SW	%r3, 16(%r4)
	LW	%r5, 16(%r30) # restore1
	SW	%r5, 12(%r4)
	LW	%r6, 12(%r30) # restore1
	SW	%r6, 8(%r4)
	SW	%r2, 4(%r4)
	LW	%r6, 4(%r30) # restore1
	SW	%r6, 0(%r4)
	LA	%r6, min_caml_objects
	LW	%r7, 0(%r30) # restore1
	SLL	%r7, %r7, 2
	ADD	%r29, %r6, %r7
	SW	%r4, 0(%r29)
	SW	%r1, 52(%r30)
	ADDI	%r27, %r0, 3
	BNE	%r2, %r27, BEQ_else.5701
	LWC1	%f1, 0(%r3)
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.eq.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5703
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	sgn.2025
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
	JAL	fsqr.1980
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.5704
BEQ_else.5703:
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
BEQ_cont.5704:
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LWC1	%f1, 4(%r1)
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.eq.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5705
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	sgn.2025
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
	JAL	fsqr.1980
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.5706
BEQ_else.5705:
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
BEQ_cont.5706:
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LWC1	%f1, 8(%r1)
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.eq.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5707
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	sgn.2025
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
	JAL	fsqr.1980
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	J	BEQ_cont.5708
BEQ_else.5707:
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
BEQ_cont.5708:
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 8(%r1)
	J	BEQ_cont.5702
BEQ_else.5701:
	ADDI	%r27, %r0, 2
	BNE	%r2, %r27, BEQ_else.5709
	LW	%r2, 40(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.5711
	ADDI	%r2, %r0, 1
	J	BEQ_cont.5712
BEQ_else.5711:
	ADDI	%r2, %r0, 0
BEQ_cont.5712:
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	normalize_vector.2022
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.5710
BEQ_else.5709:
BEQ_cont.5710:
BEQ_cont.5702:
	LW	%r1, 16(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5713
	J	BEQ_cont.5714
BEQ_else.5713:
	LA	%r1, min_caml_cs_temp
	LW	%r2, 52(%r30) # restore1
	LWC1	%f1, 0(%r2)
	SW	%r1, 104(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_cos
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 104(%r30) # restore1
	SWC1	%f1, 40(%r1)
	LA	%r1, min_caml_cs_temp
	LW	%r2, 52(%r30) # restore1
	LWC1	%f1, 0(%r2)
	SW	%r1, 108(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_sin
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 108(%r30) # restore1
	SWC1	%f1, 44(%r1)
	LA	%r1, min_caml_cs_temp
	LW	%r2, 52(%r30) # restore1
	LWC1	%f1, 4(%r2)
	SW	%r1, 112(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_cos
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 112(%r30) # restore1
	SWC1	%f1, 48(%r1)
	LA	%r1, min_caml_cs_temp
	LW	%r2, 52(%r30) # restore1
	LWC1	%f1, 4(%r2)
	SW	%r1, 116(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	min_caml_sin
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 116(%r30) # restore1
	SWC1	%f1, 52(%r1)
	LA	%r1, min_caml_cs_temp
	LW	%r2, 52(%r30) # restore1
	LWC1	%f1, 8(%r2)
	SW	%r1, 120(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	min_caml_cos
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 120(%r30) # restore1
	SWC1	%f1, 56(%r1)
	LA	%r1, min_caml_cs_temp
	LW	%r2, 52(%r30) # restore1
	LWC1	%f1, 8(%r2)
	SW	%r1, 124(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	min_caml_sin
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 124(%r30) # restore1
	SWC1	%f1, 60(%r1)
	LA	%r1, min_caml_cs_temp
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 48(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 56(%r2)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_cs_temp
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 44(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 52(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 56(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 40(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f3, 60(%r2)
	MUL.s	%f2, %f2, %f3
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_cs_temp
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 40(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 52(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 56(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 44(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f3, 60(%r2)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	LA	%r1, min_caml_cs_temp
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 48(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 60(%r2)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 12(%r1)
	LA	%r1, min_caml_cs_temp
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 44(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 52(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 60(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 40(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f3, 56(%r2)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 16(%r1)
	LA	%r1, min_caml_cs_temp
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 40(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 52(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 60(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 44(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f3, 56(%r2)
	MUL.s	%f2, %f2, %f3
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 20(%r1)
	LA	%r1, min_caml_cs_temp
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 52(%r2)
	SUB.s	%f1, %f0, %f1
	SWC1	%f1, 24(%r1)
	LA	%r1, min_caml_cs_temp
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 44(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 48(%r2)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 28(%r1)
	LA	%r1, min_caml_cs_temp
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 40(%r2)
	LA	%r2, min_caml_cs_temp
	LWC1	%f2, 48(%r2)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 32(%r1)
	LW	%r1, 20(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 8(%r1)
	LA	%r2, min_caml_cs_temp
	LWC1	%f4, 0(%r2)
	SWC1	%f3, 128(%r30)
	SWC1	%f2, 136(%r30)
	SWC1	%f1, 144(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f4, %f0 # args
	SW	%r29, 156(%r30) # save link register
	ADDI	%r30, %r30, 160
	JAL	fsqr.1980
	ADDI	%r29, %r0, 160
	SUB	%r30, %r30, %r29
	LW	%r29, 156(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 144(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_cs_temp
	LWC1	%f3, 12(%r1)
	SWC1	%f1, 152(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	fsqr.1980
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 152(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LA	%r1, min_caml_cs_temp
	LWC1	%f3, 24(%r1)
	SWC1	%f1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	fsqr.1980
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 160(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 4(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	fsqr.1980
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 144(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_cs_temp
	LWC1	%f3, 16(%r1)
	SWC1	%f1, 168(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 180(%r30) # save link register
	ADDI	%r30, %r30, 184
	JAL	fsqr.1980
	ADDI	%r29, %r0, 184
	SUB	%r30, %r30, %r29
	LW	%r29, 180(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 168(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LA	%r1, min_caml_cs_temp
	LWC1	%f3, 28(%r1)
	SWC1	%f1, 176(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	fsqr.1980
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 176(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r2, min_caml_cs_temp
	LWC1	%f1, 8(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	fsqr.1980
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 144(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_cs_temp
	LWC1	%f3, 20(%r1)
	SWC1	%f1, 184(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 196(%r30) # save link register
	ADDI	%r30, %r30, 200
	JAL	fsqr.1980
	ADDI	%r29, %r0, 200
	SUB	%r30, %r30, %r29
	LW	%r29, 196(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 184(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LA	%r1, min_caml_cs_temp
	LWC1	%f3, 32(%r1)
	SWC1	%f1, 192(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 204(%r30) # save link register
	ADDI	%r30, %r30, 208
	JAL	fsqr.1980
	ADDI	%r29, %r0, 208
	SUB	%r30, %r30, %r29
	LW	%r29, 204(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f3, 192(%r30) # restore2
	ADD.s	%f1, %f3, %f1
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LA	%r29, l.4440
	LWC1	%f1, 0(%r29)
	LA	%r1, min_caml_cs_temp
	LWC1	%f3, 4(%r1)
	LWC1	%f4, 144(%r30) # restore2
	MUL.s	%f3, %f4, %f3
	LA	%r1, min_caml_cs_temp
	LWC1	%f5, 8(%r1)
	MUL.s	%f3, %f3, %f5
	LA	%r1, min_caml_cs_temp
	LWC1	%f5, 16(%r1)
	LWC1	%f6, 136(%r30) # restore2
	MUL.s	%f5, %f6, %f5
	LA	%r1, min_caml_cs_temp
	LWC1	%f7, 20(%r1)
	MUL.s	%f5, %f5, %f7
	ADD.s	%f3, %f3, %f5
	LA	%r1, min_caml_cs_temp
	LWC1	%f5, 28(%r1)
	MUL.s	%f5, %f2, %f5
	LA	%r1, min_caml_cs_temp
	LWC1	%f7, 32(%r1)
	MUL.s	%f5, %f5, %f7
	ADD.s	%f3, %f3, %f5
	MUL.s	%f1, %f1, %f3
	LW	%r1, 52(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r29, l.4440
	LWC1	%f1, 0(%r29)
	LA	%r2, min_caml_cs_temp
	LWC1	%f3, 0(%r2)
	MUL.s	%f3, %f4, %f3
	LA	%r2, min_caml_cs_temp
	LWC1	%f5, 8(%r2)
	MUL.s	%f3, %f3, %f5
	LA	%r2, min_caml_cs_temp
	LWC1	%f5, 12(%r2)
	MUL.s	%f5, %f6, %f5
	LA	%r2, min_caml_cs_temp
	LWC1	%f7, 20(%r2)
	MUL.s	%f5, %f5, %f7
	ADD.s	%f3, %f3, %f5
	LA	%r2, min_caml_cs_temp
	LWC1	%f5, 24(%r2)
	MUL.s	%f5, %f2, %f5
	LA	%r2, min_caml_cs_temp
	LWC1	%f7, 32(%r2)
	MUL.s	%f5, %f5, %f7
	ADD.s	%f3, %f3, %f5
	MUL.s	%f1, %f1, %f3
	SWC1	%f1, 4(%r1)
	LA	%r29, l.4440
	LWC1	%f1, 0(%r29)
	LA	%r2, min_caml_cs_temp
	LWC1	%f3, 0(%r2)
	MUL.s	%f3, %f4, %f3
	LA	%r2, min_caml_cs_temp
	LWC1	%f4, 4(%r2)
	MUL.s	%f3, %f3, %f4
	LA	%r2, min_caml_cs_temp
	LWC1	%f4, 12(%r2)
	MUL.s	%f4, %f6, %f4
	LA	%r2, min_caml_cs_temp
	LWC1	%f5, 16(%r2)
	MUL.s	%f4, %f4, %f5
	ADD.s	%f3, %f3, %f4
	LA	%r2, min_caml_cs_temp
	LWC1	%f4, 24(%r2)
	MUL.s	%f2, %f2, %f4
	LA	%r2, min_caml_cs_temp
	LWC1	%f4, 28(%r2)
	MUL.s	%f2, %f2, %f4
	ADD.s	%f2, %f3, %f2
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
BEQ_cont.5714:
	ADDI	%r1, %r0, 1
	JR	%r31
read_object.2033:
	ADDI	%r27, %r0, 61
	SLT	%r27, %r1, %r27
	BNE	%r27, %r0, BEQ_else.5715
	JR	%r31
BEQ_else.5715:
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_nth_object.2031
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5717
	JR	%r31
BEQ_else.5717:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	J	read_object.2033
read_all_object.2035:
	ADDI	%r1, %r0, 0
	J	read_object.2033
read_net_item.2037:
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
	BNE	%r1, %r2, BEQ_else.5719
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	ADDI	%r2, %r0, 1
	SUB	%r29, %r0, %r2
	ADDI	%r2, %r29, 0
	J	min_caml_create_array
BEQ_else.5719:
	LW	%r2, 0(%r30) # restore1
	ADDI	%r3, %r2, 1
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	read_net_item.2037
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
read_or_network.2039:
	ADDI	%r2, %r0, 0
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_net_item.2037
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r2)
	ADDI	%r3, %r0, 1
	SUB	%r29, %r0, %r3
	ADDI	%r3, %r29, 0
	BNE	%r1, %r3, BEQ_else.5720
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	J	min_caml_create_array
BEQ_else.5720:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r3, %r1, 1
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	read_or_network.2039
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
read_and_network.2041:
	ADDI	%r2, %r0, 0
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_net_item.2037
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r1)
	ADDI	%r3, %r0, 1
	SUB	%r29, %r0, %r3
	ADDI	%r3, %r29, 0
	BNE	%r2, %r3, BEQ_else.5721
	JR	%r31
BEQ_else.5721:
	LA	%r2, min_caml_and_net
	LW	%r3, 0(%r30) # restore1
	SLL	%r4, %r3, 2
	ADD	%r29, %r2, %r4
	SW	%r1, 0(%r29)
	ADDI	%r1, %r3, 1
	J	read_and_network.2041
read_parameter.2043:
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_environ.2029
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_all_object.2035
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_and_network.2041
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_or_net
	ADDI	%r2, %r0, 0
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_or_network.2039
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 0(%r2)
	JR	%r31
solver_rect.2045:
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 0(%r2)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	C.eq.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5724
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f2, 0(%r2)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5726
	ADDI	%r3, %r0, 0
	J	BEQ_cont.5727
BEQ_else.5726:
	ADDI	%r3, %r0, 1
BEQ_cont.5727:
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	xor.1977
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5728
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	J	BEQ_cont.5729
BEQ_else.5728:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.5729:
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f2, 0(%r1)
	SUB.s	%f1, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	DIV.s	%f1, %f1, %f2
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 8(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LA	%r2, min_caml_solver_w_vec
	LWC1	%f4, 4(%r2)
	ADD.s	%f2, %f2, %f4
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
	BNE	%r27, %r0, BEQ_else.5730
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5731
BEQ_else.5730:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LWC1	%f3, 8(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LA	%r2, min_caml_solver_w_vec
	LWC1	%f4, 8(%r2)
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
	BNE	%r27, %r0, BEQ_else.5732
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5733
BEQ_else.5732:
	LA	%r1, min_caml_solver_dist
	LWC1	%f1, 8(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
BEQ_cont.5733:
BEQ_cont.5731:
	J	BEQ_cont.5725
BEQ_else.5724:
	ADDI	%r1, %r0, 0
BEQ_cont.5725:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5734
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	C.eq.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5735
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f2, 4(%r2)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5737
	ADDI	%r3, %r0, 0
	J	BEQ_cont.5738
BEQ_else.5737:
	ADDI	%r3, %r0, 1
BEQ_cont.5738:
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	xor.1977
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5739
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	J	BEQ_cont.5740
BEQ_else.5739:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.5740:
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f2, 4(%r1)
	SUB.s	%f1, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	DIV.s	%f1, %f1, %f2
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LWC1	%f3, 32(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LA	%r2, min_caml_solver_w_vec
	LWC1	%f4, 8(%r2)
	ADD.s	%f2, %f2, %f4
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5741
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5742
BEQ_else.5741:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LWC1	%f3, 32(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LA	%r2, min_caml_solver_w_vec
	LWC1	%f4, 0(%r2)
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
	BNE	%r27, %r0, BEQ_else.5743
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5744
BEQ_else.5743:
	LA	%r1, min_caml_solver_dist
	LWC1	%f1, 32(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
BEQ_cont.5744:
BEQ_cont.5742:
	J	BEQ_cont.5736
BEQ_else.5735:
	ADDI	%r1, %r0, 0
BEQ_cont.5736:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5745
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	C.eq.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5746
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	LW	%r2, 4(%r30) # restore1
	LWC1	%f2, 8(%r2)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5748
	ADDI	%r3, %r0, 0
	J	BEQ_cont.5749
BEQ_else.5748:
	ADDI	%r3, %r0, 1
BEQ_cont.5749:
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	xor.1977
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5750
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	J	BEQ_cont.5751
BEQ_else.5750:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.5751:
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f2, 8(%r1)
	SUB.s	%f1, %f1, %f2
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	DIV.s	%f1, %f1, %f2
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 0(%r1)
	LWC1	%f3, 56(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LA	%r2, min_caml_solver_w_vec
	LWC1	%f4, 0(%r2)
	ADD.s	%f2, %f2, %f4
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5752
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5753
BEQ_else.5752:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LWC1	%f3, 56(%r30) # restore2
	MUL.s	%f2, %f3, %f2
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f4, 4(%r1)
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
	BNE	%r27, %r0, BEQ_else.5754
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5755
BEQ_else.5754:
	LA	%r1, min_caml_solver_dist
	LWC1	%f1, 56(%r30) # restore2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
BEQ_cont.5755:
BEQ_cont.5753:
	J	BEQ_cont.5747
BEQ_else.5746:
	ADDI	%r1, %r0, 0
BEQ_cont.5747:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5756
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5756:
	ADDI	%r1, %r0, 3
	JR	%r31
BEQ_else.5745:
	ADDI	%r1, %r0, 2
	JR	%r31
BEQ_else.5734:
	ADDI	%r1, %r0, 1
	JR	%r31
solver_surface.2048:
	LWC1	%f1, 0(%r2)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 4(%r1)
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	SWC1	%f2, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 32(%r30)
	SWC1	%f2, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 32(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5757
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5757:
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f2, 0(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 48(%r30)
	SWC1	%f2, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f2, 4(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 64(%r30)
	SWC1	%f2, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 64(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f2, 8(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 80(%r30)
	SWC1	%f2, 88(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 104
	SUB	%r30, %r30, %r29
	LW	%r29, 100(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 88(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 80(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LWC1	%f2, 48(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	LA	%r1, min_caml_solver_dist
	SUB.s	%f1, %f0, %f1
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
in_prod_sqr_obj.2051:
	LWC1	%f1, 0(%r2)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	fsqr.1980
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_a.1994
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
	JAL	fsqr.1980
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_b.1996
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
	JAL	fsqr.1980
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 32(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
in_prod_co_objrot.2054:
	LWC1	%f1, 4(%r2)
	LWC1	%f2, 8(%r2)
	MUL.s	%f1, %f1, %f2
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_r1.2016
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
	JAL	o_param_r2.2018
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
	JAL	o_param_r3.2020
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 32(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
solver2nd_mul_b.2057:
	LA	%r3, min_caml_solver_w_vec
	LWC1	%f1, 0(%r3)
	LWC1	%f2, 0(%r2)
	MUL.s	%f1, %f1, %f2
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f2, 4(%r1)
	LW	%r1, 4(%r30) # restore1
	LWC1	%f3, 4(%r1)
	MUL.s	%f2, %f2, %f3
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	SWC1	%f2, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f2, 8(%r1)
	LW	%r1, 4(%r30) # restore1
	LWC1	%f3, 8(%r1)
	MUL.s	%f2, %f2, %f3
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 32(%r30)
	SWC1	%f2, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 32(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
solver2nd_rot_b.2060:
	LA	%r3, min_caml_solver_w_vec
	LWC1	%f1, 8(%r3)
	LWC1	%f2, 4(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r3, min_caml_solver_w_vec
	LWC1	%f2, 4(%r3)
	LWC1	%f3, 8(%r2)
	MUL.s	%f2, %f2, %f3
	ADD.s	%f1, %f1, %f2
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_r1.2016
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f2, 0(%r1)
	LW	%r1, 4(%r30) # restore1
	LWC1	%f3, 8(%r1)
	MUL.s	%f2, %f2, %f3
	LA	%r2, min_caml_solver_w_vec
	LWC1	%f3, 8(%r2)
	LWC1	%f4, 0(%r1)
	MUL.s	%f3, %f3, %f4
	ADD.s	%f2, %f2, %f3
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	SWC1	%f2, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_r2.2018
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LA	%r1, min_caml_solver_w_vec
	LWC1	%f2, 0(%r1)
	LW	%r1, 4(%r30) # restore1
	LWC1	%f3, 4(%r1)
	MUL.s	%f2, %f2, %f3
	LA	%r2, min_caml_solver_w_vec
	LWC1	%f3, 4(%r2)
	LWC1	%f4, 0(%r1)
	MUL.s	%f3, %f3, %f4
	ADD.s	%f2, %f2, %f3
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 32(%r30)
	SWC1	%f2, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_r3.2020
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 32(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	JR	%r31
solver_second.2063:
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	in_prod_sqr_obj.2051
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_isrot.1992
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5758
	LWC1	%f1, 8(%r30) # restore2
	J	BEQ_cont.5759
BEQ_else.5758:
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	in_prod_co_objrot.2054
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	ADD.s	%f1, %f2, %f1
BEQ_cont.5759:
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.eq.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5760
	LA	%r29, l.4440
	LWC1	%f2, 0(%r29)
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	SWC1	%f2, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	solver2nd_mul_b.2057
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_isrot.1992
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5761
	LWC1	%f1, 32(%r30) # restore2
	J	BEQ_cont.5762
BEQ_else.5761:
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	solver2nd_rot_b.2060
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	ADD.s	%f1, %f2, %f1
BEQ_cont.5762:
	LA	%r2, min_caml_solver_w_vec
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	in_prod_sqr_obj.2051
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_isrot.1992
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5763
	LWC1	%f1, 48(%r30) # restore2
	J	BEQ_cont.5764
BEQ_else.5763:
	LA	%r2, min_caml_solver_w_vec
	LW	%r1, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	in_prod_co_objrot.2054
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	ADD.s	%f1, %f2, %f1
BEQ_cont.5764:
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_form.1986
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.5765
	LA	%r29, l.4465
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 56(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	J	BEQ_cont.5766
BEQ_else.5765:
	LWC1	%f1, 56(%r30) # restore2
BEQ_cont.5766:
	LA	%r29, l.4682
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 16(%r30) # restore2
	MUL.s	%f2, %f2, %f3
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 40(%r30) # restore2
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	fsqr.1980
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	SUB.s	%f1, %f1, %f2
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5767
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5767:
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5768
	LWC1	%f1, 72(%r30) # restore2
	SUB.s	%f1, %f0, %f1
	J	BEQ_cont.5769
BEQ_else.5768:
	LWC1	%f1, 72(%r30) # restore2
BEQ_cont.5769:
	LA	%r1, min_caml_solver_dist
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f1, %f2
	LA	%r29, l.4440
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	LWC1	%f2, 16(%r30) # restore2
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5760:
	ADDI	%r1, %r0, 0
	JR	%r31
solver.2066:
	LA	%r4, min_caml_objects
	SLL	%r1, %r1, 2
	ADD	%r29, %r4, %r1
	LW	%r1, 0(%r29)
	LA	%r4, min_caml_solver_w_vec
	LWC1	%f1, 0(%r3)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	SW	%r3, 8(%r30)
	SW	%r4, 12(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_x.2000
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 12(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_solver_w_vec
	LW	%r2, 8(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LW	%r3, 4(%r30) # restore1
	SW	%r1, 24(%r30)
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_y.2002
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_solver_w_vec
	LW	%r2, 8(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 4(%r30) # restore1
	SW	%r1, 40(%r30)
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_z.2004
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 40(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r1, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_form.1986
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.5772
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	J	solver_rect.2045
BEQ_else.5772:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.5773
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	J	solver_surface.2048
BEQ_else.5773:
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	J	solver_second.2063
is_rect_outside.2070:
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_isoutside_q
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
	BNE	%r27, %r0, BEQ_else.5775
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5776
BEQ_else.5775:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_isoutside_q
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
	BNE	%r27, %r0, BEQ_else.5777
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5778
BEQ_else.5777:
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_isoutside_q
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
	BNE	%r27, %r0, BEQ_else.5779
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5780
BEQ_else.5779:
	ADDI	%r1, %r0, 1
BEQ_cont.5780:
BEQ_cont.5778:
BEQ_cont.5776:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5781
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5782
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5782:
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5781:
	LW	%r1, 0(%r30) # restore1
	J	o_isinvert.1990
is_plane_outside.2072:
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_isoutside_q
	LWC1	%f2, 0(%r1)
	MUL.s	%f1, %f1, %f2
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_isoutside_q
	LWC1	%f2, 4(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 8(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_isoutside_q
	LWC1	%f2, 8(%r1)
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5784
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5785
BEQ_else.5784:
	ADDI	%r1, %r0, 1
BEQ_cont.5785:
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	xor.1977
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5786
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5786:
	ADDI	%r1, %r0, 0
	JR	%r31
is_second_outside.2074:
	LA	%r2, min_caml_isoutside_q
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	in_prod_sqr_obj.2051
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_form.1986
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.5788
	LA	%r29, l.4465
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 8(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	J	BEQ_cont.5789
BEQ_else.5788:
	LWC1	%f1, 8(%r30) # restore2
BEQ_cont.5789:
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_isrot.1992
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5790
	LWC1	%f1, 16(%r30) # restore2
	J	BEQ_cont.5791
BEQ_else.5790:
	LA	%r2, min_caml_isoutside_q
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	in_prod_co_objrot.2054
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	ADD.s	%f1, %f2, %f1
BEQ_cont.5791:
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5792
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5793
BEQ_else.5792:
	ADDI	%r1, %r0, 1
BEQ_cont.5793:
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r2, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	xor.1977
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5794
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5794:
	ADDI	%r1, %r0, 0
	JR	%r31
is_outside.2076:
	LA	%r2, min_caml_isoutside_q
	LA	%r3, min_caml_chkinside_p
	LWC1	%f1, 0(%r3)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_x.2000
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_isoutside_q
	LA	%r2, min_caml_chkinside_p
	LWC1	%f1, 4(%r2)
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 16(%r30)
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_y.2002
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_isoutside_q
	LA	%r2, min_caml_chkinside_p
	LWC1	%f1, 8(%r2)
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 32(%r30)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_z.2004
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r1, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_form.1986
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.5797
	LW	%r1, 0(%r30) # restore1
	J	is_rect_outside.2070
BEQ_else.5797:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.5798
	LW	%r1, 0(%r30) # restore1
	J	is_plane_outside.2072
BEQ_else.5798:
	LW	%r1, 0(%r30) # restore1
	J	is_second_outside.2074
check_all_inside.2078:
	SLL	%r3, %r1, 2
	ADD	%r29, %r2, %r3
	LW	%r3, 0(%r29)
	ADDI	%r4, %r0, 1
	SUB	%r29, %r0, %r4
	ADDI	%r4, %r29, 0
	BNE	%r3, %r4, BEQ_else.5799
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5799:
	LA	%r4, min_caml_objects
	SLL	%r3, %r3, 2
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	is_outside.2076
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5800
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 0(%r30) # restore1
	J	check_all_inside.2078
BEQ_else.5800:
	ADDI	%r1, %r0, 0
	JR	%r31
shadow_check_and_group.2081:
	SLL	%r4, %r1, 2
	ADD	%r29, %r2, %r4
	LW	%r4, 0(%r29)
	ADDI	%r5, %r0, 1
	SUB	%r29, %r0, %r5
	ADDI	%r5, %r29, 0
	BNE	%r4, %r5, BEQ_else.5801
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5801:
	SLL	%r4, %r1, 2
	ADD	%r29, %r2, %r4
	LW	%r4, 0(%r29)
	LA	%r5, min_caml_light
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	SW	%r4, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r5, 0 # args
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	solver.2066
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LA	%r2, min_caml_solver_dist
	LWC1	%f1, 0(%r2)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5802
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5803
BEQ_else.5802:
	LA	%r29, l.4708
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5804
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5805
BEQ_else.5804:
	ADDI	%r1, %r0, 1
BEQ_cont.5805:
BEQ_cont.5803:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5806
	LA	%r1, min_caml_objects
	LW	%r2, 12(%r30) # restore1
	SLL	%r2, %r2, 2
	ADD	%r29, %r1, %r2
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5807
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5807:
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	J	shadow_check_and_group.2081
BEQ_else.5806:
	LA	%r29, l.4709
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
	LA	%r1, min_caml_chkinside_p
	LA	%r2, min_caml_light
	LWC1	%f2, 0(%r2)
	MUL.s	%f2, %f2, %f1
	LW	%r2, 0(%r30) # restore1
	LWC1	%f3, 0(%r2)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 0(%r1)
	LA	%r1, min_caml_chkinside_p
	LA	%r3, min_caml_light
	LWC1	%f2, 4(%r3)
	MUL.s	%f2, %f2, %f1
	LWC1	%f3, 4(%r2)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 4(%r1)
	LA	%r1, min_caml_chkinside_p
	LA	%r3, min_caml_light
	LWC1	%f2, 8(%r3)
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 8(%r2)
	ADD.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	ADDI	%r1, %r0, 0
	LW	%r3, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	check_all_inside.2078
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5808
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	J	shadow_check_and_group.2081
BEQ_else.5808:
	ADDI	%r1, %r0, 1
	JR	%r31
shadow_check_one_or_group.2085:
	SLL	%r4, %r1, 2
	ADD	%r29, %r2, %r4
	LW	%r4, 0(%r29)
	ADDI	%r5, %r0, 1
	SUB	%r29, %r0, %r5
	ADDI	%r5, %r29, 0
	BNE	%r4, %r5, BEQ_else.5809
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5809:
	LA	%r5, min_caml_and_net
	SLL	%r4, %r4, 2
	ADD	%r29, %r5, %r4
	LW	%r4, 0(%r29)
	ADDI	%r5, %r0, 0
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r5, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	shadow_check_and_group.2081
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5810
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	J	shadow_check_one_or_group.2085
BEQ_else.5810:
	ADDI	%r1, %r0, 1
	JR	%r31
shadow_check_one_or_matrix.2089:
	SLL	%r4, %r1, 2
	ADD	%r29, %r2, %r4
	LW	%r4, 0(%r29)
	LW	%r5, 0(%r4)
	ADDI	%r6, %r0, 1
	SUB	%r29, %r0, %r6
	ADDI	%r6, %r29, 0
	BNE	%r5, %r6, BEQ_else.5811
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5811:
	ADDI	%r27, %r0, 99
	BNE	%r5, %r27, BEQ_else.5812
	ADDI	%r5, %r0, 1
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r5, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	shadow_check_one_or_group.2085
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5813
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	J	shadow_check_one_or_matrix.2089
BEQ_else.5813:
	ADDI	%r1, %r0, 1
	JR	%r31
BEQ_else.5812:
	LA	%r6, min_caml_light
	SW	%r4, 12(%r30)
	SW	%r3, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r6, 0 # args
	ADDI	%r1, %r5, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	solver.2066
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5814
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	J	shadow_check_one_or_matrix.2089
BEQ_else.5814:
	LA	%r29, l.4724
	LWC1	%f1, 0(%r29)
	LA	%r1, min_caml_solver_dist
	LWC1	%f2, 0(%r1)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5815
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	J	shadow_check_one_or_matrix.2089
BEQ_else.5815:
	ADDI	%r1, %r0, 1
	LW	%r2, 12(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	shadow_check_one_or_group.2085
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5816
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	LW	%r3, 0(%r30) # restore1
	J	shadow_check_one_or_matrix.2089
BEQ_else.5816:
	ADDI	%r1, %r0, 1
	JR	%r31
solve_each_element.2093:
	SLL	%r3, %r1, 2
	ADD	%r29, %r2, %r3
	LW	%r3, 0(%r29)
	ADDI	%r4, %r0, 1
	SUB	%r29, %r0, %r4
	ADDI	%r4, %r29, 0
	BNE	%r3, %r4, BEQ_else.5817
	JR	%r31
BEQ_else.5817:
	LA	%r4, min_caml_vscan
	LA	%r5, min_caml_viewpoint
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r3, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	ADDI	%r3, %r5, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	solver.2066
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5819
	LA	%r1, min_caml_objects
	LW	%r2, 8(%r30) # restore1
	SLL	%r2, %r2, 2
	ADD	%r29, %r1, %r2
	LW	%r1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5821
	LA	%r1, min_caml_end_flag
	ADDI	%r2, %r0, 1
	SW	%r2, 0(%r1)
	J	BEQ_cont.5822
BEQ_else.5821:
BEQ_cont.5822:
	J	BEQ_cont.5820
BEQ_else.5819:
	LA	%r2, min_caml_solver_dist
	LWC1	%f1, 0(%r2)
	LA	%r29, l.4724
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5823
	J	BEQ_cont.5824
BEQ_else.5823:
	LA	%r2, min_caml_tmin
	LWC1	%f2, 0(%r2)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5825
	J	BEQ_cont.5826
BEQ_else.5825:
	LA	%r29, l.4709
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
	LA	%r2, min_caml_chkinside_p
	LA	%r3, min_caml_vscan
	LWC1	%f2, 0(%r3)
	MUL.s	%f2, %f2, %f1
	LA	%r3, min_caml_viewpoint
	LWC1	%f3, 0(%r3)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 0(%r2)
	LA	%r2, min_caml_chkinside_p
	LA	%r3, min_caml_vscan
	LWC1	%f2, 4(%r3)
	MUL.s	%f2, %f2, %f1
	LA	%r3, min_caml_viewpoint
	LWC1	%f3, 4(%r3)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 4(%r2)
	LA	%r2, min_caml_chkinside_p
	LA	%r3, min_caml_vscan
	LWC1	%f2, 8(%r3)
	MUL.s	%f2, %f2, %f1
	LA	%r3, min_caml_viewpoint
	LWC1	%f3, 8(%r3)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 8(%r2)
	ADDI	%r2, %r0, 0
	LW	%r3, 4(%r30) # restore1
	SW	%r1, 12(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	check_all_inside.2078
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5827
	J	BEQ_cont.5828
BEQ_else.5827:
	LA	%r1, min_caml_tmin
	LWC1	%f1, 16(%r30) # restore2
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_crashed_point
	LA	%r2, min_caml_chkinside_p
	LWC1	%f1, 0(%r2)
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_crashed_point
	LA	%r2, min_caml_chkinside_p
	LWC1	%f1, 4(%r2)
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_crashed_point
	LA	%r2, min_caml_chkinside_p
	LWC1	%f1, 8(%r2)
	SWC1	%f1, 8(%r1)
	LA	%r1, min_caml_intsec_rectside
	LW	%r2, 12(%r30) # restore1
	SW	%r2, 0(%r1)
	LA	%r1, min_caml_crashed_object
	LW	%r2, 8(%r30) # restore1
	SW	%r2, 0(%r1)
BEQ_cont.5828:
BEQ_cont.5826:
BEQ_cont.5824:
BEQ_cont.5820:
	LA	%r1, min_caml_end_flag
	LW	%r1, 0(%r1)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5829
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 4(%r30) # restore1
	J	solve_each_element.2093
BEQ_else.5829:
	JR	%r31
solve_one_or_network.2096:
	SLL	%r3, %r1, 2
	ADD	%r29, %r2, %r3
	LW	%r3, 0(%r29)
	ADDI	%r4, %r0, 1
	SUB	%r29, %r0, %r4
	ADDI	%r4, %r29, 0
	BNE	%r3, %r4, BEQ_else.5831
	JR	%r31
BEQ_else.5831:
	LA	%r4, min_caml_and_net
	SLL	%r3, %r3, 2
	ADD	%r29, %r4, %r3
	LW	%r3, 0(%r29)
	LA	%r4, min_caml_end_flag
	ADDI	%r5, %r0, 0
	SW	%r5, 0(%r4)
	ADDI	%r4, %r0, 0
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	solve_each_element.2093
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 0(%r30) # restore1
	J	solve_one_or_network.2096
trace_or_matrix.2099:
	SLL	%r3, %r1, 2
	ADD	%r29, %r2, %r3
	LW	%r3, 0(%r29)
	LW	%r4, 0(%r3)
	ADDI	%r5, %r0, 1
	SUB	%r29, %r0, %r5
	ADDI	%r5, %r29, 0
	BNE	%r4, %r5, BEQ_else.5833
	JR	%r31
BEQ_else.5833:
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r27, %r0, 99
	BNE	%r4, %r27, BEQ_else.5835
	ADDI	%r4, %r0, 1
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r3, 0 # args
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	solve_one_or_network.2096
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	J	BEQ_cont.5836
BEQ_else.5835:
	LA	%r5, min_caml_vscan
	LA	%r6, min_caml_viewpoint
	SW	%r3, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r3, %r6, 0 # args
	ADDI	%r2, %r5, 0 # args
	ADDI	%r1, %r4, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	solver.2066
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5837
	J	BEQ_cont.5838
BEQ_else.5837:
	LA	%r1, min_caml_solver_dist
	LWC1	%f1, 0(%r1)
	LA	%r1, min_caml_tmin
	LWC1	%f2, 0(%r1)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5839
	J	BEQ_cont.5840
BEQ_else.5839:
	ADDI	%r1, %r0, 1
	LW	%r2, 8(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	solve_one_or_network.2096
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
BEQ_cont.5840:
BEQ_cont.5838:
BEQ_cont.5836:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r1, %r1, 1
	LW	%r2, 0(%r30) # restore1
	J	trace_or_matrix.2099
tracer.2102:
	LA	%r1, min_caml_tmin
	LA	%r29, l.4757
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 0
	LA	%r2, min_caml_or_net
	LW	%r2, 0(%r2)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	trace_or_matrix.2099
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_tmin
	LWC1	%f1, 0(%r1)
	LA	%r29, l.4724
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5841
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5841:
	LA	%r29, l.4761
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5842
	ADDI	%r1, %r0, 0
	JR	%r31
BEQ_else.5842:
	ADDI	%r1, %r0, 1
	JR	%r31
get_nvector_rect.2105:
	LA	%r1, min_caml_intsec_rectside
	LW	%r1, 0(%r1)
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.5843
	LA	%r1, min_caml_nvector
	LA	%r2, min_caml_vscan
	LWC1	%f1, 0(%r2)
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	sgn.2025
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_nvector
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_nvector
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5843:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.5845
	LA	%r1, min_caml_nvector
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_nvector
	LA	%r2, min_caml_vscan
	LWC1	%f1, 4(%r2)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	sgn.2025
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_nvector
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5845:
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.5847
	LA	%r1, min_caml_nvector
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_nvector
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_nvector
	LA	%r2, min_caml_vscan
	LWC1	%f1, 8(%r2)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	sgn.2025
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5847:
	JR	%r31
get_nvector_plane.2107:
	LA	%r2, min_caml_nvector
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_nvector
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_nvector
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LW	%r1, 12(%r30) # restore1
	SWC1	%f1, 8(%r1)
	JR	%r31
get_nvector_second_norot.2109:
	LA	%r3, min_caml_nvector
	LWC1	%f1, 0(%r2)
	SW	%r2, 0(%r30)
	SW	%r3, 4(%r30)
	SW	%r1, 8(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_x.2000
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
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_nvector
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LW	%r3, 8(%r30) # restore1
	SW	%r1, 32(%r30)
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	o_param_y.2002
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 40(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 32(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_nvector
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 8(%r30) # restore1
	SW	%r1, 56(%r30)
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_z.2004
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 56(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LA	%r1, min_caml_nvector
	LW	%r2, 8(%r30) # restore1
	SW	%r1, 80(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 80(%r30) # restore1
	J	normalize_vector.2022
get_nvector_second_rot.2112:
	LA	%r3, min_caml_nvector_w
	LWC1	%f1, 0(%r2)
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SW	%r3, 8(%r30)
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_param_x.2000
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_nvector_w
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 4(%r2)
	LW	%r3, 0(%r30) # restore1
	SW	%r1, 24(%r30)
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_param_y.2002
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_nvector_w
	LW	%r2, 4(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 40(%r30)
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_z.2004
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 40(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LA	%r1, min_caml_nvector
	LA	%r2, min_caml_nvector_w
	LWC1	%f1, 0(%r2)
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 56(%r30)
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_nvector_w
	LWC1	%f2, 4(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 72(%r30)
	SWC1	%f2, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_param_r3.2020
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_nvector_w
	LWC1	%f2, 8(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 88(%r30)
	SWC1	%f2, 96(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	o_param_r2.2018
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 88(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	fhalf.1982
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 56(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_nvector
	LA	%r2, min_caml_nvector_w
	LWC1	%f1, 4(%r2)
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 104(%r30)
	SWC1	%f1, 112(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_nvector_w
	LWC1	%f2, 0(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 120(%r30)
	SWC1	%f2, 128(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 140(%r30) # save link register
	ADDI	%r30, %r30, 144
	JAL	o_param_r3.2020
	ADDI	%r29, %r0, 144
	SUB	%r30, %r30, %r29
	LW	%r29, 140(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 128(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_nvector_w
	LWC1	%f2, 8(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 136(%r30)
	SWC1	%f2, 144(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 156(%r30) # save link register
	ADDI	%r30, %r30, 160
	JAL	o_param_r1.2016
	ADDI	%r29, %r0, 160
	SUB	%r30, %r30, %r29
	LW	%r29, 156(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 144(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 136(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 156(%r30) # save link register
	ADDI	%r30, %r30, 160
	JAL	fhalf.1982
	ADDI	%r29, %r0, 160
	SUB	%r30, %r30, %r29
	LW	%r29, 156(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 120(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 104(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_nvector
	LA	%r2, min_caml_nvector_w
	LWC1	%f1, 8(%r2)
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 152(%r30)
	SWC1	%f1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 160(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_nvector_w
	LWC1	%f2, 0(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 168(%r30)
	SWC1	%f2, 176(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	o_param_r2.2018
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 176(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_nvector_w
	LWC1	%f2, 4(%r1)
	LW	%r1, 0(%r30) # restore1
	SWC1	%f1, 184(%r30)
	SWC1	%f2, 192(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 204(%r30) # save link register
	ADDI	%r30, %r30, 208
	JAL	o_param_r1.2016
	ADDI	%r29, %r0, 208
	SUB	%r30, %r30, %r29
	LW	%r29, 204(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 192(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 184(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 204(%r30) # save link register
	ADDI	%r30, %r30, 208
	JAL	fhalf.1982
	ADDI	%r29, %r0, 208
	SUB	%r30, %r30, %r29
	LW	%r29, 204(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 168(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	LW	%r1, 152(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LA	%r1, min_caml_nvector
	LW	%r2, 0(%r30) # restore1
	SW	%r1, 200(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 204(%r30) # save link register
	ADDI	%r30, %r30, 208
	JAL	o_isinvert.1990
	ADDI	%r29, %r0, 208
	SUB	%r30, %r30, %r29
	LW	%r29, 204(%r30)
	ADDI	%r2, %r1, 0
	ADDI	%r31, %r29, 0
	LW	%r1, 200(%r30) # restore1
	J	normalize_vector.2022
get_nvector.2115:
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_form.1986
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.5860
	J	get_nvector_rect.2105
BEQ_else.5860:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.5861
	LW	%r1, 4(%r30) # restore1
	J	get_nvector_plane.2107
BEQ_else.5861:
	LW	%r1, 4(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_isrot.1992
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5862
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	J	get_nvector_second_norot.2109
BEQ_else.5862:
	LW	%r1, 4(%r30) # restore1
	LW	%r2, 0(%r30) # restore1
	J	get_nvector_second_rot.2112
utexture.2118:
	SW	%r2, 0(%r30)
	SW	%r1, 4(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	o_texturetype.1984
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	LA	%r2, min_caml_texture_color
	LW	%r3, 4(%r30) # restore1
	SW	%r1, 8(%r30)
	SW	%r2, 12(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_color_red.2010
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 12(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_texture_color
	LW	%r2, 4(%r30) # restore1
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	o_color_green.2012
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_texture_color
	LW	%r2, 4(%r30) # restore1
	SW	%r1, 20(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	o_color_blue.2014
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 20(%r30) # restore1
	SWC1	%f1, 8(%r1)
	LW	%r1, 8(%r30) # restore1
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.5863
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 24(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 36(%r30) # save link register
	ADDI	%r30, %r30, 40
	JAL	o_param_x.2000
	ADDI	%r29, %r0, 40
	SUB	%r30, %r30, %r29
	LW	%r29, 36(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 24(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4827
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	min_caml_floor
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4828
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.4819
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 32(%r30) # restore2
	SUB.s	%f1, %f3, %f1
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5864
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5865
BEQ_else.5864:
	ADDI	%r1, %r0, 1
BEQ_cont.5865:
	LW	%r2, 0(%r30) # restore1
	LWC1	%f1, 8(%r2)
	LW	%r2, 4(%r30) # restore1
	SW	%r1, 40(%r30)
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_param_z.2004
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4827
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_floor
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4828
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	LA	%r29, l.4819
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 56(%r30) # restore2
	SUB.s	%f1, %f3, %f1
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5867
	ADDI	%r1, %r0, 0
	J	BEQ_cont.5868
BEQ_else.5867:
	ADDI	%r1, %r0, 1
BEQ_cont.5868:
	LA	%r2, min_caml_texture_color
	LW	%r3, 40(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r3, %r27, BEQ_else.5869
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5871
	LA	%r29, l.4814
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.5872
BEQ_else.5871:
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
BEQ_cont.5872:
	J	BEQ_cont.5870
BEQ_else.5869:
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5873
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.5874
BEQ_else.5873:
	LA	%r29, l.4814
	LWC1	%f1, 0(%r29)
BEQ_cont.5874:
BEQ_cont.5870:
	SWC1	%f1, 4(%r2)
	JR	%r31
BEQ_else.5863:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.5876
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 4(%r1)
	LA	%r29, l.4823
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	min_caml_sin
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	fsqr.1980
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_texture_color
	LA	%r29, l.4814
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LA	%r1, min_caml_texture_color
	LA	%r29, l.4814
	LWC1	%f2, 0(%r29)
	LA	%r29, l.4465
	LWC1	%f3, 0(%r29)
	SUB.s	%f1, %f3, %f1
	MUL.s	%f1, %f2, %f1
	SWC1	%f1, 4(%r1)
	JR	%r31
BEQ_else.5876:
	ADDI	%r27, %r0, 3
	BNE	%r1, %r27, BEQ_else.5878
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_param_x.2000
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 72(%r30)
	SWC1	%f2, 80(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 92(%r30) # save link register
	ADDI	%r30, %r30, 96
	JAL	o_param_z.2004
	ADDI	%r29, %r0, 96
	SUB	%r30, %r30, %r29
	LW	%r29, 92(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 80(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LWC1	%f2, 72(%r30) # restore2
	SWC1	%f1, 88(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 100(%r30) # save link register
	ADDI	%r30, %r30, 104
	JAL	fsqr.1980
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
	JAL	fsqr.1980
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 96(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 108(%r30) # save link register
	ADDI	%r30, %r30, 112
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 112
	SUB	%r30, %r30, %r29
	LW	%r29, 108(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4819
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 104(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_floor
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 104(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4810
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	min_caml_cos
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 116(%r30) # save link register
	ADDI	%r30, %r30, 120
	JAL	fsqr.1980
	ADDI	%r29, %r0, 120
	SUB	%r30, %r30, %r29
	LW	%r29, 116(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_texture_color
	LA	%r29, l.4814
	LWC1	%f2, 0(%r29)
	MUL.s	%f2, %f1, %f2
	SWC1	%f2, 4(%r1)
	LA	%r1, min_caml_texture_color
	LA	%r29, l.4465
	LWC1	%f2, 0(%r29)
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4814
	LWC1	%f2, 0(%r29)
	MUL.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5878:
	ADDI	%r27, %r0, 4
	BNE	%r1, %r27, BEQ_else.5880
	LW	%r1, 0(%r30) # restore1
	LWC1	%f1, 0(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 112(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 124(%r30) # save link register
	ADDI	%r30, %r30, 128
	JAL	o_param_x.2000
	ADDI	%r29, %r0, 128
	SUB	%r30, %r30, %r29
	LW	%r29, 124(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 112(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 120(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	o_param_a.1994
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 132(%r30) # save link register
	ADDI	%r30, %r30, 136
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 136
	SUB	%r30, %r30, %r29
	LW	%r29, 132(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 120(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f2, 8(%r1)
	LW	%r2, 4(%r30) # restore1
	SWC1	%f1, 128(%r30)
	SWC1	%f2, 136(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	SW	%r29, 148(%r30) # save link register
	ADDI	%r30, %r30, 152
	JAL	o_param_z.2004
	ADDI	%r29, %r0, 152
	SUB	%r30, %r30, %r29
	LW	%r29, 148(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 136(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 144(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 156(%r30) # save link register
	ADDI	%r30, %r30, 160
	JAL	o_param_c.1998
	ADDI	%r29, %r0, 160
	SUB	%r30, %r30, %r29
	LW	%r29, 156(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 156(%r30) # save link register
	ADDI	%r30, %r30, 160
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 160
	SUB	%r30, %r30, %r29
	LW	%r29, 156(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 144(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LWC1	%f2, 128(%r30) # restore2
	SWC1	%f1, 152(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 164(%r30) # save link register
	ADDI	%r30, %r30, 168
	JAL	fsqr.1980
	ADDI	%r29, %r0, 168
	SUB	%r30, %r30, %r29
	LW	%r29, 164(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 152(%r30) # restore2
	SWC1	%f1, 160(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	fsqr.1980
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 160(%r30) # restore2
	ADD.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 172(%r30) # save link register
	ADDI	%r30, %r30, 176
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 176
	SUB	%r30, %r30, %r29
	LW	%r29, 172(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4807
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 128(%r30) # restore2
	SWC1	%f1, 168(%r30)
	SWC1	%f2, 176(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 176(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5881
	LWC1	%f1, 128(%r30) # restore2
	LWC1	%f2, 152(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 188(%r30) # save link register
	ADDI	%r30, %r30, 192
	JAL	min_caml_atan
	ADDI	%r29, %r0, 192
	SUB	%r30, %r30, %r29
	LW	%r29, 188(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4809
	LWC1	%f2, 0(%r29)
	LA	%r29, l.4810
	LWC1	%f3, 0(%r29)
	DIV.s	%f2, %f2, %f3
	MUL.s	%f1, %f1, %f2
	J	BEQ_cont.5882
BEQ_else.5881:
	LA	%r29, l.4808
	LWC1	%f1, 0(%r29)
BEQ_cont.5882:
	SWC1	%f1, 184(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 196(%r30) # save link register
	ADDI	%r30, %r30, 200
	JAL	min_caml_floor
	ADDI	%r29, %r0, 200
	SUB	%r30, %r30, %r29
	LW	%r29, 196(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 184(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 0(%r30) # restore1
	LWC1	%f3, 4(%r1)
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 192(%r30)
	SWC1	%f3, 200(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 212(%r30) # save link register
	ADDI	%r30, %r30, 216
	JAL	o_param_y.2002
	ADDI	%r29, %r0, 216
	SUB	%r30, %r30, %r29
	LW	%r29, 212(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 200(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 208(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 220(%r30) # save link register
	ADDI	%r30, %r30, 224
	JAL	o_param_b.1996
	ADDI	%r29, %r0, 224
	SUB	%r30, %r30, %r29
	LW	%r29, 220(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 220(%r30) # save link register
	ADDI	%r30, %r30, 224
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 224
	SUB	%r30, %r30, %r29
	LW	%r29, 220(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 208(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r29, l.4807
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 184(%r30) # restore2
	SWC1	%f1, 216(%r30)
	SWC1	%f2, 224(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 236(%r30) # save link register
	ADDI	%r30, %r30, 240
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 240
	SUB	%r30, %r30, %r29
	LW	%r29, 236(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 224(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5883
	LWC1	%f1, 168(%r30) # restore2
	LWC1	%f2, 216(%r30) # restore2
	DIV.s	%f1, %f2, %f1
	ADDI	%r29, %r31, 0
	SW	%r29, 236(%r30) # save link register
	ADDI	%r30, %r30, 240
	JAL	min_caml_abs_float
	ADDI	%r29, %r0, 240
	SUB	%r30, %r30, %r29
	LW	%r29, 236(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 236(%r30) # save link register
	ADDI	%r30, %r30, 240
	JAL	min_caml_atan
	ADDI	%r29, %r0, 240
	SUB	%r30, %r30, %r29
	LW	%r29, 236(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4809
	LWC1	%f2, 0(%r29)
	LA	%r29, l.4810
	LWC1	%f3, 0(%r29)
	DIV.s	%f2, %f2, %f3
	MUL.s	%f1, %f1, %f2
	J	BEQ_cont.5884
BEQ_else.5883:
	LA	%r29, l.4808
	LWC1	%f1, 0(%r29)
BEQ_cont.5884:
	SWC1	%f1, 232(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 244(%r30) # save link register
	ADDI	%r30, %r30, 248
	JAL	min_caml_floor
	ADDI	%r29, %r0, 248
	SUB	%r30, %r30, %r29
	LW	%r29, 244(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 232(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4812
	LWC1	%f2, 0(%r29)
	LA	%r29, l.4813
	LWC1	%f3, 0(%r29)
	LWC1	%f4, 192(%r30) # restore2
	SUB.s	%f3, %f3, %f4
	SWC1	%f1, 240(%r30)
	SWC1	%f2, 248(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f3, %f0 # args
	SW	%r29, 260(%r30) # save link register
	ADDI	%r30, %r30, 264
	JAL	fsqr.1980
	ADDI	%r29, %r0, 264
	SUB	%r30, %r30, %r29
	LW	%r29, 260(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 248(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r29, l.4813
	LWC1	%f2, 0(%r29)
	LWC1	%f3, 240(%r30) # restore2
	SUB.s	%f2, %f2, %f3
	SWC1	%f1, 256(%r30)
	ADDI	%r29, %r31, 0
	ADD.s	%f1, %f2, %f0 # args
	SW	%r29, 268(%r30) # save link register
	ADDI	%r30, %r30, 272
	JAL	fsqr.1980
	ADDI	%r29, %r0, 272
	SUB	%r30, %r30, %r29
	LW	%r29, 268(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 256(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r1, min_caml_texture_color
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5885
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	J	BEQ_cont.5886
BEQ_else.5885:
	LA	%r29, l.4814
	LWC1	%f2, 0(%r29)
	LA	%r29, l.4815
	LWC1	%f3, 0(%r29)
	DIV.s	%f2, %f2, %f3
	MUL.s	%f1, %f1, %f2
BEQ_cont.5886:
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5880:
	JR	%r31
in_prod.2121:
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
accumulate_vec_mul.2124:
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
raytracing.2128:
	LA	%r2, min_caml_viewpoint
	LA	%r3, min_caml_vscan
	SWC1	%f1, 0(%r30)
	SW	%r1, 8(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 12(%r30) # save link register
	ADDI	%r30, %r30, 16
	JAL	tracer.2102
	ADDI	%r29, %r0, 16
	SUB	%r30, %r30, %r29
	LW	%r29, 12(%r30)
	ADDI	%r31, %r29, 0
	SW	%r1, 12(%r30)
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5890
	LW	%r2, 8(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r2, %r27, BEQ_else.5892
	J	BEQ_cont.5893
BEQ_else.5892:
	LA	%r3, min_caml_vscan
	LA	%r4, min_caml_light
	ADDI	%r29, %r31, 0
	ADDI	%r2, %r4, 0 # args
	ADDI	%r1, %r3, 0 # args
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	in_prod.2121
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5894
	J	BEQ_cont.5895
BEQ_else.5894:
	SWC1	%f1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	fsqr.1980
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 16(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 0(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LA	%r1, min_caml_beam
	LWC1	%f3, 0(%r1)
	MUL.s	%f1, %f1, %f3
	LA	%r1, min_caml_rgb
	LA	%r2, min_caml_rgb
	LWC1	%f3, 0(%r2)
	ADD.s	%f3, %f3, %f1
	SWC1	%f3, 0(%r1)
	LA	%r1, min_caml_rgb
	LA	%r2, min_caml_rgb
	LWC1	%f3, 4(%r2)
	ADD.s	%f3, %f3, %f1
	SWC1	%f3, 4(%r1)
	LA	%r1, min_caml_rgb
	LA	%r2, min_caml_rgb
	LWC1	%f3, 8(%r2)
	ADD.s	%f1, %f3, %f1
	SWC1	%f1, 8(%r1)
BEQ_cont.5895:
BEQ_cont.5893:
	J	BEQ_cont.5891
BEQ_else.5890:
BEQ_cont.5891:
	LW	%r1, 12(%r30) # restore1
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5896
	JR	%r31
BEQ_else.5896:
	LA	%r1, min_caml_objects
	LA	%r2, min_caml_crashed_object
	LW	%r2, 0(%r2)
	SLL	%r2, %r2, 2
	ADD	%r29, %r1, %r2
	LW	%r1, 0(%r29)
	LA	%r2, min_caml_crashed_point
	SW	%r1, 24(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	get_nvector.2115
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 0
	LA	%r2, min_caml_or_net
	LW	%r2, 0(%r2)
	LA	%r3, min_caml_crashed_point
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	shadow_check_one_or_matrix.2089
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 0
	BNE	%r1, %r27, BEQ_else.5898
	LA	%r1, min_caml_nvector
	LA	%r2, min_caml_light
	ADDI	%r29, %r31, 0
	SW	%r29, 28(%r30) # save link register
	ADDI	%r30, %r30, 32
	JAL	in_prod.2121
	ADDI	%r29, %r0, 32
	SUB	%r30, %r30, %r29
	LW	%r29, 28(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5900
	LA	%r29, l.4856
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
	J	BEQ_cont.5901
BEQ_else.5900:
	LA	%r29, l.4856
	LWC1	%f1, 0(%r29)
BEQ_cont.5901:
	LWC1	%f2, 0(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 32(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 44(%r30) # save link register
	ADDI	%r30, %r30, 48
	JAL	o_diffuse.2006
	ADDI	%r29, %r0, 48
	SUB	%r30, %r30, %r29
	LW	%r29, 44(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 32(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	J	BEQ_cont.5899
BEQ_else.5898:
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
BEQ_cont.5899:
	LA	%r2, min_caml_crashed_point
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 40(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	utexture.2118
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_rgb
	LA	%r2, min_caml_texture_color
	LWC1	%f1, 40(%r30) # restore2
	ADDI	%r29, %r31, 0
	SW	%r29, 52(%r30) # save link register
	ADDI	%r30, %r30, 56
	JAL	accumulate_vec_mul.2124
	ADDI	%r29, %r0, 56
	SUB	%r30, %r30, %r29
	LW	%r29, 52(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 8(%r30) # restore1
	ADDI	%r27, %r0, 4
	SLT	%r27, %r27, %r1
	BNE	%r27, %r0, BEQ_else.5903
	LA	%r29, l.4857
	LWC1	%f1, 0(%r29)
	LWC1	%f2, 0(%r30) # restore2
	C.lt.s	%r27, %f1, %f2
	BNE	%r27, %r0, BEQ_else.5904
	JR	%r31
BEQ_else.5904:
	LA	%r29, l.4858
	LWC1	%f1, 0(%r29)
	LA	%r2, min_caml_vscan
	LA	%r3, min_caml_nvector
	SWC1	%f1, 48(%r30)
	ADDI	%r29, %r31, 0
	ADDI	%r1, %r2, 0 # args
	ADDI	%r2, %r3, 0 # args
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	in_prod.2121
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 48(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_vscan
	LA	%r2, min_caml_nvector
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	accumulate_vec_mul.2124
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 24(%r30) # restore1
	ADDI	%r29, %r31, 0
	SW	%r29, 60(%r30) # save link register
	ADDI	%r30, %r30, 64
	JAL	o_reflectiontype.1988
	ADDI	%r29, %r0, 64
	SUB	%r30, %r30, %r29
	LW	%r29, 60(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r27, %r0, 1
	BNE	%r1, %r27, BEQ_else.5906
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 56(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	o_hilight.2008
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 56(%r30) # restore2
	C.eq.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5907
	LA	%r1, min_caml_vscan
	LA	%r2, min_caml_light
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	in_prod.2121
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	SUB.s	%f1, %f0, %f1
	LA	%r29, l.4464
	LWC1	%f2, 0(%r29)
	C.lt.s	%r27, %f2, %f1
	BNE	%r27, %r0, BEQ_else.5908
	JR	%r31
BEQ_else.5908:
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	fsqr.1980
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 68(%r30) # save link register
	ADDI	%r30, %r30, 72
	JAL	fsqr.1980
	ADDI	%r29, %r0, 72
	SUB	%r30, %r30, %r29
	LW	%r29, 68(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 0(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LWC1	%f2, 40(%r30) # restore2
	MUL.s	%f1, %f1, %f2
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 64(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 76(%r30) # save link register
	ADDI	%r30, %r30, 80
	JAL	o_hilight.2008
	ADDI	%r29, %r0, 80
	SUB	%r30, %r30, %r29
	LW	%r29, 76(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 64(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LA	%r1, min_caml_rgb
	LA	%r2, min_caml_rgb
	LWC1	%f2, 0(%r2)
	ADD.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LA	%r1, min_caml_rgb
	LA	%r2, min_caml_rgb
	LWC1	%f2, 4(%r2)
	ADD.s	%f2, %f2, %f1
	SWC1	%f2, 4(%r1)
	LA	%r1, min_caml_rgb
	LA	%r2, min_caml_rgb
	LWC1	%f2, 8(%r2)
	ADD.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	JR	%r31
BEQ_else.5907:
	JR	%r31
BEQ_else.5906:
	ADDI	%r27, %r0, 2
	BNE	%r1, %r27, BEQ_else.5912
	LA	%r1, min_caml_viewpoint
	LA	%r2, min_caml_crashed_point
	LWC1	%f1, 0(%r2)
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_viewpoint
	LA	%r2, min_caml_crashed_point
	LWC1	%f1, 4(%r2)
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_viewpoint
	LA	%r2, min_caml_crashed_point
	LWC1	%f1, 8(%r2)
	SWC1	%f1, 8(%r1)
	LA	%r29, l.4465
	LWC1	%f1, 0(%r29)
	LW	%r1, 24(%r30) # restore1
	SWC1	%f1, 72(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 84(%r30) # save link register
	ADDI	%r30, %r30, 88
	JAL	o_diffuse.2006
	ADDI	%r29, %r0, 88
	SUB	%r30, %r30, %r29
	LW	%r29, 84(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 72(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LWC1	%f2, 0(%r30) # restore2
	MUL.s	%f1, %f2, %f1
	LW	%r1, 8(%r30) # restore1
	ADDI	%r1, %r1, 1
	J	raytracing.2128
BEQ_else.5912:
	JR	%r31
BEQ_else.5903:
	JR	%r31
write_rgb.2131:
	LA	%r1, min_caml_rgb
	LWC1	%f1, 0(%r1)
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
	BNE	%r27, %r0, BEQ_else.5915
	J	BEQ_cont.5916
BEQ_else.5915:
	ADDI	%r1, %r0, 255
BEQ_cont.5916:
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_byte
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_rgb
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
	BNE	%r27, %r0, BEQ_else.5917
	J	BEQ_cont.5918
BEQ_else.5917:
	ADDI	%r1, %r0, 255
BEQ_cont.5918:
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_byte
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_rgb
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
	BNE	%r27, %r0, BEQ_else.5919
	J	BEQ_cont.5920
BEQ_else.5919:
	ADDI	%r1, %r0, 255
BEQ_cont.5920:
	J	min_caml_print_byte
write_ppm_header.2133:
	ADDI	%r1, %r0, 80
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_byte
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 48
	ADDI	%r1, %r1, 6
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_byte
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r1, %r0, 10
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_print_byte
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_size
	LW	%r1, 0(%r1)
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
	JAL	min_caml_print_byte
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_size
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
	JAL	min_caml_print_byte
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
	J	min_caml_print_byte
scan_point.2135:
	LA	%r2, min_caml_size
	LW	%r2, 0(%r2)
	SLT	%r27, %r1, %r2
	BNE	%r27, %r0, BEQ_else.5921
	JR	%r31
BEQ_else.5921:
	SW	%r1, 0(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_scan_offset
	LWC1	%f2, 0(%r1)
	SUB.s	%f1, %f1, %f2
	LA	%r1, min_caml_scan_d
	LWC1	%f2, 0(%r1)
	MUL.s	%f1, %f1, %f2
	LA	%r1, min_caml_vscan
	LA	%r2, min_caml_cos_v
	LWC1	%f2, 4(%r2)
	MUL.s	%f2, %f1, %f2
	LA	%r2, min_caml_wscan
	LWC1	%f3, 0(%r2)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 0(%r1)
	LA	%r1, min_caml_vscan
	LA	%r2, min_caml_scan_sscany
	LWC1	%f2, 0(%r2)
	LA	%r2, min_caml_cos_v
	LWC1	%f3, 0(%r2)
	MUL.s	%f2, %f2, %f3
	LA	%r2, min_caml_vp
	LWC1	%f3, 4(%r2)
	SUB.s	%f2, %f2, %f3
	SWC1	%f2, 4(%r1)
	LA	%r1, min_caml_vscan
	SUB.s	%f2, %f0, %f1
	LA	%r2, min_caml_sin_v
	LWC1	%f3, 4(%r2)
	MUL.s	%f2, %f2, %f3
	LA	%r2, min_caml_wscan
	LWC1	%f3, 8(%r2)
	ADD.s	%f2, %f2, %f3
	SWC1	%f2, 8(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	fsqr.1980
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_scan_met1
	LWC1	%f2, 0(%r1)
	ADD.s	%f1, %f1, %f2
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_sqrt
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_vscan
	LA	%r2, min_caml_vscan
	LWC1	%f2, 0(%r2)
	DIV.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LA	%r1, min_caml_vscan
	LA	%r2, min_caml_vscan
	LWC1	%f2, 4(%r2)
	DIV.s	%f2, %f2, %f1
	SWC1	%f2, 4(%r1)
	LA	%r1, min_caml_vscan
	LA	%r2, min_caml_vscan
	LWC1	%f2, 8(%r2)
	DIV.s	%f1, %f2, %f1
	SWC1	%f1, 8(%r1)
	LA	%r1, min_caml_viewpoint
	LA	%r2, min_caml_view
	LWC1	%f1, 0(%r2)
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_viewpoint
	LA	%r2, min_caml_view
	LWC1	%f1, 4(%r2)
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_viewpoint
	LA	%r2, min_caml_view
	LWC1	%f1, 8(%r2)
	SWC1	%f1, 8(%r1)
	LA	%r1, min_caml_rgb
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_rgb
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 4(%r1)
	LA	%r1, min_caml_rgb
	LA	%r29, l.4464
	LWC1	%f1, 0(%r29)
	SWC1	%f1, 8(%r1)
	ADDI	%r1, %r0, 0
	LA	%r29, l.4465
	LWC1	%f1, 0(%r29)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	raytracing.2128
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	write_rgb.2131
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	J	scan_point.2135
scan_line.2137:
	LA	%r2, min_caml_size
	LW	%r2, 0(%r2)
	SLT	%r27, %r1, %r2
	BNE	%r27, %r0, BEQ_else.5923
	JR	%r31
BEQ_else.5923:
	LA	%r2, min_caml_scan_sscany
	LA	%r3, min_caml_scan_offset
	LWC1	%f1, 0(%r3)
	LA	%r29, l.4465
	LWC1	%f2, 0(%r29)
	SUB.s	%f1, %f1, %f2
	SW	%r1, 0(%r30)
	SW	%r2, 4(%r30)
	SWC1	%f1, 8(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LWC1	%f2, 8(%r30) # restore2
	SUB.s	%f1, %f2, %f1
	LA	%r1, min_caml_scan_d
	LWC1	%f2, 0(%r1)
	MUL.s	%f1, %f2, %f1
	LW	%r1, 4(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_scan_met1
	LA	%r2, min_caml_scan_sscany
	LWC1	%f1, 0(%r2)
	SW	%r1, 16(%r30)
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	fsqr.1980
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LA	%r29, l.4910
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
	LW	%r1, 16(%r30) # restore1
	SWC1	%f1, 0(%r1)
	LA	%r1, min_caml_scan_sscany
	LWC1	%f1, 0(%r1)
	LA	%r1, min_caml_sin_v
	LWC1	%f2, 0(%r1)
	MUL.s	%f1, %f1, %f2
	LA	%r1, min_caml_wscan
	LA	%r2, min_caml_sin_v
	LWC1	%f2, 4(%r2)
	MUL.s	%f2, %f1, %f2
	LA	%r2, min_caml_vp
	LWC1	%f3, 0(%r2)
	SUB.s	%f2, %f2, %f3
	SWC1	%f2, 0(%r1)
	LA	%r1, min_caml_wscan
	LA	%r2, min_caml_cos_v
	LWC1	%f2, 4(%r2)
	MUL.s	%f1, %f1, %f2
	LA	%r2, min_caml_vp
	LWC1	%f2, 8(%r2)
	SUB.s	%f1, %f1, %f2
	SWC1	%f1, 8(%r1)
	ADDI	%r1, %r0, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 20(%r30) # save link register
	ADDI	%r30, %r30, 24
	JAL	scan_point.2135
	ADDI	%r29, %r0, 24
	SUB	%r30, %r30, %r29
	LW	%r29, 20(%r30)
	ADDI	%r31, %r29, 0
	LW	%r1, 0(%r30) # restore1
	ADDI	%r1, %r1, 1
	J	scan_line.2137
scan_start.2139:
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	write_ppm_header.2133
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_size
	LW	%r1, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	min_caml_float_of_int
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	LA	%r1, min_caml_scan_d
	LA	%r29, l.4921
	LWC1	%f2, 0(%r29)
	DIV.s	%f2, %f2, %f1
	SWC1	%f2, 0(%r1)
	LA	%r1, min_caml_scan_offset
	LA	%r29, l.4440
	LWC1	%f2, 0(%r29)
	DIV.s	%f1, %f1, %f2
	SWC1	%f1, 0(%r1)
	ADDI	%r1, %r0, 0
	J	scan_line.2137
rt.2141:
	LA	%r4, min_caml_size
	SW	%r1, 0(%r4)
	LA	%r1, min_caml_size
	SW	%r2, 4(%r1)
	LA	%r1, min_caml_dbg
	SW	%r3, 0(%r1)
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	read_parameter.2043
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
	J	scan_start.2139
_min_caml_start: # main entry point
	SUB	%r0, %r0, %r0
	ADDI	%r28, %r0, 32668
   # main program start
	ADDI	%r1, %r0, 768
	ADDI	%r2, %r0, 768
	ADDI	%r3, %r0, 0
	ADDI	%r29, %r31, 0
	SW	%r29, 4(%r30) # save link register
	ADDI	%r30, %r30, 8
	JAL	rt.2141
	ADDI	%r29, %r0, 8
	SUB	%r30, %r30, %r29
	LW	%r29, 4(%r30)
	ADDI	%r31, %r29, 0
   # main program end
