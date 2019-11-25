; print
; inputs:
;   ecx - the address of the string buffer to print
;   edx - an integer containing the number of characters to print
; outputs:
;   none
print:
    mov eax, 4
	mov ebx, 1
	int 80h
    ret