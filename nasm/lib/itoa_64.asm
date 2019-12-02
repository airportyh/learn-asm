; itoa
; inputs:
; 	rax - the integer to be converted
; 	rbx - the buffer to use to hold the resulting digits
; outputs (gets you partially ready to call sys_write):
; 	rsi - the address of the beginning of the string buffer containing the digits
;   rdx - the number of digits in the resulting string representation
itoa:
	push rcx
	push rdi
	cmp rax, 0
	jl .negative
	jmp .positive
.negative:
	mov rdx, 0
	mov rcx, -1
	imul rcx
	push -1
	jmp .begin
.positive:
	push 1

.begin:
    ; strategy - we are going to fill in the digits from
    ; the end of the buffer and then move backwards
	mov rcx, 254
.divide_loop:
	; zero out edx for division because it in the upper byte of the quotient
	; (idiv uses the combination of edx and eax as the quotient)
	mov rdx, 0
	; divide edx:eax by 10, the resulting quotient will be in eax, and the remainder
	; in edx
	mov rdi, 10
	idiv rdi

	; add 48 to the value of the digit to convert it into the ascii
	; representation of the digit (48 is the ascii code for the
	; character '0')
	add rdx, 48
	mov [rbx + rcx], dl

    dec rcx
	; if quotient is not zero, go to top of loop and do it again
    cmp rax, 0
	jne .divide_loop
    lea rsi, [rbx + rcx]
    mov rdx, 255
    sub rdx, rcx

	pop rdi ; check for negative sign
	cmp rdi, -1
	je .apply_negative_sign
	jmp .done

.apply_negative_sign:
	mov dl, 45
	mov [rbx + rcx], dl
	dec rdx

.done:
	pop rdi
	pop rcx
    ret
