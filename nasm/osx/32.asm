; /usr/local/bin/nasm -f macho 32.asm && ld -macosx_version_min 10.7.0 -o 32 32.o && ./32

global start

section .data
msg:    db      "Hello, world!", 10
.len:   equ     $ - msg

section .text
start:
    push    msg.len
    push    msg
    push    1
    mov     eax, 4
    sub     esp, 4
    int     80h
    add     esp, 16

    push    0
    mov     eax, 1
    sub     esp, 12
    int     80h
