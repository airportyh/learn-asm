%include '../lib/exit_linux.asm'
%include '../lib/atoi.asm'
%include '../lib/itoa.asm'
%include '../lib/print_linux.asm'
%include '../lib/print_char.asm'
%include '../lib/input_linux.asm'

SECTION .data
message db 'Number is: '

SECTION .bss
scratch_buffer: resb 255

SECTION .text
global _start
_start:
    push -1
    mov edx, 0
    mov eax, 15
    pop ebx
    imul ebx

    add eax, 15

    mov ebx, scratch_buffer
    call itoa
    call print

    call exit
