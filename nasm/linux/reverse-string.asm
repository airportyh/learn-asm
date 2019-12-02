; this version of reverse string loops through each character in the
; string from the end of the string to the beginning, and prints them
; out one by one.
SECTION .data
buffer db 'Hello, world!'

SECTION .text
global _start

_start:
	mov ecx, 12

print_loop:
	cmp ecx, -1
	je print_loop_end

	mov ebx, 0
	mov bl, [buffer + ecx]

	push ecx
	push ebx
	mov eax, 4
	mov ebx, 1
	mov ecx, esp
	mov edx, 1
	int 80h

	pop ebx
	pop ecx
	dec ecx
	jmp print_loop

print_loop_end:
	mov eax, 1
	mov ebx, 0
	int 80h
