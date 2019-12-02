SECTION .data
message	db	'Hello World!', 10

SECTION .text
global _start
_start:

	mov	edx, 13
	mov	ecx, message
	mov	ebx, 1
	mov	eax, 4
	int	128

	mov	eax, 1
	mov	ebx, 0
	int	128
