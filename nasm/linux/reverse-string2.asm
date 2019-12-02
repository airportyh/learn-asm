; This version or reverse string reverses the characters in the
; string buffer itself, and then prints the whole string buffer.
SECTION .data
buffer db 'Hello, world!'
done_message db 'Mone.'

SECTION .text
global _start

_start:
	mov ecx, 0

print_loop:
	cmp ecx, 7
	je print_loop_end

	mov ebx, 0
	mov edx, 12
	sub edx, ecx
	mov bl, [buffer + ecx]
	mov al, [buffer + edx] 
	mov [buffer + ecx], al
	mov [buffer + edx], bl

	inc ecx
	jmp print_loop

print_loop_end:

	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	mov edx, 13
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
