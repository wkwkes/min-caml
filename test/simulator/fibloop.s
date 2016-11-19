#fibloop.s
#fib(n) = 1 (if n=0,1)
#fib(n) = fib(n-1)+fib(n-2) (otherwise)
	.globl _min_caml_start
fibloop:
	ADDI	%r4,%r0,$2
	SLT	%r4,%r3,%r4
	BEQ	%r4,%r0,.GT1
.LE1:
	ADDI	%r3,%r0,$1
	JR	%r31
.GT1:
	SW	%r3,0(%r30)
	SW	%r31,4(%r30)
	ADDI	%r30,%r30,$8
	ADDI	%r3,%r3,$-1
	JAL 	fibloop
	SW	%r3,0(%r30)
	LW	%r3,-8(%r30)
	ADDI	%r30,%r30,$4
	ADDI	%r3,%r3,$-2
	JAL	fibloop
	ADDI	%r30,%r30,$-12
	LW	%r4,8(%r30)
	ADD	%r3,%r3,%r4
	LW	%r31,4(%r30)
	JR	%r31
_min_caml_start:
	ADDI	%r3,%r0,30
	ADDI	%r30,%r0,0
	JAL	fibloop
	J	SYS_EXIT
