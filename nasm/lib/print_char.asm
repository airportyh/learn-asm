; print_char
; inputs:
;   esi - the ascii code of the character to print_char
; outputs:
;   none
print_char:
    push ecx
    push edx
    push esi
    mov ecx, esp
    mov edx, 1
    call print
    pop esi
    pop edx
    pop ecx
    ret
