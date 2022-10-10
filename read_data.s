	.file	"read_data.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"I'm child process of Pestov with pid=%d.\n"
	.section	.rodata.str1.1
.LC2:
	.string	"I read %d bytes: %s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$8193, %edx
	movq	%rsi, %rbx
	xorl	%esi, %esi
	subq	$8224, %rsp
	.cfi_def_cfa_offset 8240
	leaq	16(%rsp), %rdi
	call	memset
	movq	8(%rbx), %rdi
	leaq	12(%rsp), %rdx
	movl	$.LC0, %esi
	xorl	%eax, %eax
	call	__isoc99_sscanf
	movl	12(%rsp), %edi
	leaq	16(%rsp), %rsi
	movl	$8192, %edx
	call	read
	movq	%rax, %rbx
	call	getpid
	movl	$.LC1, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	printf
	leaq	16(%rsp), %rdx
	movl	%ebx, %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	addq	$8224, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
