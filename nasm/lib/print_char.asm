; print_char
; inputs:
;   esi - the ascii code of the character to print_char
; outputs:
;   none
print_char:
    push esi
    mov ecx, esp
    mov edx, 1
    call print
    pop esi
    ret