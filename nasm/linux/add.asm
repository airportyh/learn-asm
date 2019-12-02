%include '../lib/exit_linux.asm'
%include '../lib/atoi.asm'
%include '../lib/itoa.asm'
%include '../lib/print_linux.asm'
%include '../lib/print_char.asm'
%include '../lib/input_linux.asm'

SECTION .data
ask_number_1 db 'Enter a number: '
ask_number_2 db 'Enter another number: '
answer db 'The sum is '

SECTION .bss
atoi_buffer: resb 255
itoa_buffer: resb 255

SECTION .text
global _start
_start:
    mov ecx, ask_number_1
    mov edx, 16
    call print

    mov ecx, atoi_buffer
    mov edx, 255
    call input

    mov esi, atoi_buffer
    call atoi
    push eax

    mov ecx, ask_number_2
    mov edx, 22
    call print

    mov ecx, atoi_buffer
    mov edx, 255
    call input

    mov esi, atoi_buffer
    call atoi
    pop ebx

    add eax, ebx

    mov ebx, itoa_buffer
    call itoa

    push ecx
    push edx

    mov ecx, answer
    mov edx, 11
    call print

    pop edx
    pop ecx

    call print

    mov esi, 10
    call print_char

    call exit
