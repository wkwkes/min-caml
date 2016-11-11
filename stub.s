	.comm	_min_caml_stderr,8,3
	.cstring
LC0:
	.ascii "malloc or alloca failed\12\0"
LC1:
	.ascii "sp = %p, hp = %p\12\0"
	.text
	.globl _main
_main:
LFB4:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	subq	$16, %rsp
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movq	_min_caml_stderr@GOTPCREL(%rip), %rax
	movq	%rdx, (%rax)
	movl	$16, %eax
	subq	$1, %rax
	addq	$1000015, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	movq	%rax, -8(%rbp)
	movl	$4000000, %edi
	call	_malloc
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	L2
	cmpq	$0, -8(%rbp)
	jne	L3
L2:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	movl	$24, %edx
	movl	$1, %esi
	leaq	LC0(%rip), %rdi
	call	_fwrite
	movl	$1, %eax
	jmp	L4
L3:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rdx
	leaq	LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	_fprintf
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_min_caml_start
	movl	$0, %eax
L4:
	leave
LCFI2:
	ret
LFE4:
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB4-.
	.set L$set$2,LFE4-LFB4
	.quad L$set$2
	.byte	0
	.byte	0x4
	.set L$set$3,LCFI0-LFB4
	.long L$set$3
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE1:
	.subsections_via_symbols
