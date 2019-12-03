.global _main

.text
_main:
    mov $0x2000004, %rax
    mov $1, %rdi
    lea message(%rip), %rsi
    mov $13, %rdx
    syscall

    mov $0x2000001, %rax
    mov $0, %rdi
    syscall

message:
    .ascii "Hello, world!"
