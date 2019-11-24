%include 'helpers.asm'

SECTION .bss
atoi_buffer: resb 255

SECTION .text
global _start
_start:
    mov eax, 927482
    call itoa
    mov eax, 4
    mov ebx, 1
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
