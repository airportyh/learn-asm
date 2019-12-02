%include '../lib/atoi.asm'
%include '../lib/itoa.asm'

SECTION .data
ask_number db 'Enter a number: '
.len:   equ     $ - ask_number

negative_message db 'That is negative: '
positive_message db 'That is positive: '

SECTION .bss
atoi_buffer: resb 255
itoa_buffer: resb 255

SECTION .text
global start
start:
	push ask_number.len
    push ask_number
    push 1
    mov eax, 4
    sub esp, 4
    int	80h
    add esp, 16

	mov ecx, atoi_buffer
	mov edx, 255
    push 255
    push atoi_buffer
    push 2
    mov eax, 3
    sub esp, 4
    int	80h
    add esp, 16

    mov esi, atoi_buffer
    call atoi

    mov ebx, itoa_buffer
    call itoa

    push edx
    push ecx
    push 1
    mov eax, 4
    sub esp, 4
    int	80h
    add esp, 16

    ; print a newline
    push 10
    push 1
    push esp
    push 1
    mov eax, 4
    sub esp, 4
    int 80h
    add esp, 20

    push 0
    mov	eax, 1
    sub esp, 12
    int	80h
    add esp, 16
