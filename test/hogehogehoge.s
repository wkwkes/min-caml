.data
.balign	8
.text
f.3:
	addl	$1, %eax
	ret
g.5:
	movl	%eax, %edi
	movl	%ebx, %eax
	jmp	*(%edi)
.globl	min_caml_start
min_caml_start:
.globl	_min_caml_start
_min_caml_start: # for cygwin
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	pushl	%ebp
	movl	32(%esp),%ebp
	movl	36(%esp),%eax
	movl	%eax,min_caml_hp
	movl	min_caml_hp, %eax
	addl	$8, min_caml_hp
	movl	$f.3, %ebx
	movl	%ebx, 0(%eax)
	movl	$1, %ebx
	call	g.5
	popl	%ebp
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	ret
