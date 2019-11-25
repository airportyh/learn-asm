; print(ecx: string buffer, edx: length)
print:
    mov eax, 4
	mov ebx, 1
	int 80h
    ret