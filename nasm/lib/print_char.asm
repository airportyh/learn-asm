; input esi
print_char:
    push esi
    mov ecx, esp
    mov edx, 1
    call print
    pop esi
    ret