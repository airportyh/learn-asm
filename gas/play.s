	.globl	_main
_main:
	pushq	%rbp
	movl	$1, %edi
	leaq	hello_string(%rip), %rsi
	movl	$14, %edx
	callq	_write
	popq	%rbp
	retq
hello_string:
	.asciz	"Hello, world!\n"
