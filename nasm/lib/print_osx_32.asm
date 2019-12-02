; print
; inputs:
;   ecx - the address of the string buffer to print
;   edx - an integer containing the number of characters to print
; outputs:
;   none
print:
    push eax

    push edx
    push ecx
    push 1
    mov eax, 4
    sub esp, 4
    int	80h
    add esp, 16

    pop eax
    ret
