; itoa(eax) -> ecx, edx ready to call sys_write
; requires itoa_buffer: resb 255 to be declared in .bss section
itoa:
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
	mov [itoa_buffer + esi], dl

    dec esi
	; if quotient is not zero, go to top of loop and do it again
    cmp eax, 0
	jne .divide_loop
    lea ecx, [itoa_buffer + esi]
    mov edx, 255
    sub edx, esi
    ret
