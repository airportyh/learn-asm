; print
; inputs:
;   rsi - the address of the string buffer to print
;   rdx - an integer containing the number of characters to print
; outputs:
;   none
print:
    push rax
    push rdi

    mov rax, 0x2000004
    mov rdi, 1
    syscall

    pop rdi
    pop rax
    ret
