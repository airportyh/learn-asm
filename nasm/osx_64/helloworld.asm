section .data
    msg db      "hello, world!"

section .text
    global start

start:
    mov     rax, 0x2000004
    mov     rdi, 1
    mov     rsi, msg
    mov     rdx, 13
    syscall
    mov    rax, 0x2000001
    mov    rdi, 0
    syscall
