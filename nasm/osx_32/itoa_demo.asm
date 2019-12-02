%include '../lib/itoa.asm'
%include '../lib/exit_osx_32.asm'
%include '../lib/print_osx_32.asm'

SECTION .bss
itoa_buffer: resb 255
atoi_buffer: resb 255

SECTION .text
global start
start:
    mov eax, 1246
    mov ebx, itoa_buffer
    call itoa
    call print
    call exit
