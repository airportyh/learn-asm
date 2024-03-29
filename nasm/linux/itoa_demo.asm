%include '../lib/itoa.asm'
%include '../lib/exit_linux.asm'
%include '../lib/print_linux.asm'

SECTION .bss
itoa_buffer: resb 255
atoi_buffer: resb 255

SECTION .text
global _start
_start:
    mov eax, -234
    mov ebx, itoa_buffer
    call itoa
    call print
    call exit
