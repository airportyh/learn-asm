; input
; inputs:
;   rsi - the address of the string buffer to store the input into
;   rdx - the maximum number of characters to read
input:
    push rax
    push rdi

    mov rax, 0x2000003
    mov rdi, 2
    syscall

    pop rdi
    pop rax
    ret
