SECTION .data
question db "What is your name? "
.len: equ $ - question
greeting db "Hello, "
.len: equ $ - greeting

SECTION .bss
input: resb 255

SECTION .text
global start

start:
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, question
    mov rdx, question.len
    syscall

    mov rax, 0x2000003
    mov rdi, 2
    mov rsi, input
    mov rdx, 255
    syscall

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, greeting
    mov rdx, greeting.len
    syscall

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, input
    mov rdx, 10
    syscall

    mov rax, 0x2000001
    mov rdi, 0
    syscall
