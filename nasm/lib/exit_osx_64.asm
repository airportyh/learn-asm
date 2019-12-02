; gracefully exits the program
exit:
    mov    rax, 0x2000001
    mov    rdi, 0
    syscall
    ret
