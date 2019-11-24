%include 'helpers.asm'

SECTION .bss
itoa_buffer: resb 255

SECTION .text
global _start
_start:
    mov eax, 927482
    call itoa
    mov eax, 4
    mov ebx, 1
    int 80h

    call exit
