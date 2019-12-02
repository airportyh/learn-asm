%include "../lib/print_osx_64.asm"
%include "../lib/exit_osx_64.asm"
%include "../lib/input_osx_64.asm"

SECTION .data
question db "What is your name? "
.len: equ $ - question
greeting db "Hello, "
.len: equ $ - greeting

SECTION .bss
input_buffer: resb 255

SECTION .text
global start

start:
    mov rsi, question
    mov rdx, question.len
    call print

    mov rsi, input_buffer
    mov rdx, 255
    call input

    mov rsi, greeting
    mov rdx, greeting.len
    call print

    mov rsi, input_buffer
    mov rdx, 4
    call print

    call exit
