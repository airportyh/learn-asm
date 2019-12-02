%include '../lib/itoa_64.asm'
%include '../lib/exit_osx_64.asm'
%include '../lib/print_osx_64.asm'

SECTION .bss
itoa_buffer: resb 255
atoi_buffer: resb 255

SECTION .text
global start
start:
    mov rax, 123
    mov rbx, itoa_buffer

    call itoa

    mov rsi, rcx
    call print
    call exit
