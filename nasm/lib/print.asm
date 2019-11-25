; print
; inputs:
;   ecx - the address of the string buffer to print
;   edx - an integer containing the number of characters to print
; outputs:
;   none
print:
    push eax
    push edx
    
    mov eax, 4
	mov ebx, 1
	int 80h

    pop edx
    pop eax
    ret
