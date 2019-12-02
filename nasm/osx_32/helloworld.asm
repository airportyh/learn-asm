SECTION .data
message	db	'Hello World!', 10

SECTION .text
global start
start:

	push 13
	push message
	push 1
	mov eax, 4
	sub esp, 4
	int	80h
	add esp, 16

	push 0
	mov	eax, 1
	sub esp, 12
	int	80h
	add esp, 16
