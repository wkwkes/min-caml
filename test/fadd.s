	.data
l.5:	 # 3.500000
	.word	1080033280
l.4:	 # 1.500000
	.word	1069547520
	.text
	.globl  _min_caml_start
_min_caml_start: # main entry point
	!
	SUB	%r0, %r0, %r0
	!
   # main program start
	LA	%r29, l.4
	LWC1	%f1, 0(%r29)
	!
	LA	%r29, l.5
	LWC1	%f2, 0(%r29)
	ADD.s	%f1, %f1, %f2
   # main program end
