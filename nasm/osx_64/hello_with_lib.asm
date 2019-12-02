%include "../lib/print_osx_64.asm"
%include "../lib/exit_osx_64.asm"

section .data
    msg db      "hello, world!"

section .text
    global start

start:
    mov rsi, msg
    mov rdx, 13
    call print

    call exit
