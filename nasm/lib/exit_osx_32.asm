; gracefully exits the program
exit:
    push 0
    mov	eax, 1
    sub esp, 12
    int	80h
    add esp, 16
    ret
