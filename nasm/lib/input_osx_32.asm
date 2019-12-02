; input
; inputs:
;   ecx - the address of the string buffer to store the input into
;   edx - the maximum number of characters to read
input:
    push eax

    push edx
    push ecx
    push 2
    mov eax, 3
    sub esp, 4
    int	80h
    add esp, 16

    pop eax
    ret
