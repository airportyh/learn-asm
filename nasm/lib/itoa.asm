; itoa
; inputs:
; 	eax - the integer to be converted
; 	ebx - the buffer to use to hold the resulting digits
; outputs (gets you partially ready to call sys_write):
; 	ecx - the address of the beginning of the string buffer containing the digits
;   edx - the number of digits in the resulting string representation
; requires itoa_buffer: resb 255 to be declared in .bss section
itoa:
	push esi
	push edi

    ; strategy - we are going to fill in the digits from
    ; the end of the buffer and then move backwards
	mov esi, 254
.divide_loop:
	; zero out edx for division because it in the upper byte of the quotient
	; (idiv uses the combination of edx and eax as the quotient)
	mov edx, 0
	; divide edx:eax by 10, the resulting quotient will be in eax, and the remainder
	; in edx
	mov edi, 10
	idiv edi

	; add 48 to the value of the digit to convert it into the ascii
	; representation of the digit (48 is the ascii code for the
	; character '0')
	add edx, 48
	mov [ebx + esi], dl

    dec esi
	; if quotient is not zero, go to top of loop and do it again
    cmp eax, 0
	jne .divide_loop
    lea ecx, [ebx + esi]
    mov edx, 255
    sub edx, esi

	pop edi
	pop esi
    ret
