	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	$1, %edi
	movl	$12, %eax
	movl	%eax, %edx
	leaq	-12(%rbp), %rcx
	movb	$72, -12(%rbp)
	movb	$101, -11(%rbp)
	movb	$108, -10(%rbp)
	movb	$108, -9(%rbp)
	movb	$111, -8(%rbp)
	movb	$32, -7(%rbp)
	movb	$119, -6(%rbp)
	movb	$111, -5(%rbp)
	movb	$114, -4(%rbp)
	movb	$108, -3(%rbp)
	movb	$100, -2(%rbp)
	movb	$33, -1(%rbp)
	movb	-11(%rbp), %sil
	movb	%sil, -13(%rbp)
	movsbl	-13(%rbp), %eax
	addl	$20, %eax
	movb	%al, %sil
	movb	%sil, -13(%rbp)
	movb	-13(%rbp), %sil
	movb	%sil, -11(%rbp)
	movq	%rcx, %rsi
	callq	_write
	xorl	%edi, %edi
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	movl	%edi, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
                                        ## -- End function

.subsections_via_symbols
