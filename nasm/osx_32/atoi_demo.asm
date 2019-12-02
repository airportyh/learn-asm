%include '../lib/exit_osx.asm'
%include '../lib/atoi.asm'
%include '../lib/itoa.asm'
%include '../lib/print_osx.asm'
%include '../lib/print_char.asm'
%include '../lib/input_osx.asm'

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
	mov ecx, ask_number
	mov edx, ask_number.len
	call print

	mov ecx, atoi_buffer
	mov edx, 255
    call input

    mov esi, atoi_buffer
    call atoi

    mov ebx, itoa_buffer
    call itoa
    call print

    ; print a newline
    mov esi, 10
    call print_char
    call exit
