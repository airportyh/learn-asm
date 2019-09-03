	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$1, %edi
	leaq	-1(%rbp), %rsi
	movl	$1, %eax
	movl	%eax, %edx
	movb	$97, -1(%rbp)
	callq	_write
	xorl	%edi, %edi
	movq	%rax, -16(%rbp)         ## 8-byte Spill
	movl	%edi, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
                                        ## -- End function

.subsections_via_symbols
