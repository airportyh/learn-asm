; input
; inputs:
;   ecx - the address of the string buffer to store the input into
;   edx - the maximum number of characters to read
input:
    mov eax, 3
	mov ebx, 2
	int 80h
    ret
