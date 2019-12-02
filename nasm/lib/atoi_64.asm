; atoi
; inputs:
;	rsi - the address of the string buffer which contains the digits
; outputs:
;	rax - the resulting integer
; locals: rcx, rbx, rdx
atoi:
	push rcx
	push rbx
	push rdx
	; check for - sign
	cmp byte [rsi], 45
	je .negative
	jmp .positive

.negative:
	push -1
	mov rcx, 1
	jmp .begin
.positive:
	push 1
	; initializing rcx which is used as the loop counter as well as
	; the index into the rsi
	mov rcx, 0

.begin:
	; rax will contain the number we are accumulating to base on
	; the digits entered by the user
	mov rax, 0

.accumulate_loop:
	; clear out rbx before reading a char into its lower byte (bl)
	; this is needed so that later on when we subtract the 48 offset
	; from it, it will make sense
	mov rbx, 0
	; read a char from the rsi into the lowest byte of rbx: aka bl
    mov bl, [rsi + rcx]

	; if we read a '\n' character, we are done
	cmp bl, 10
	je .accumulate_loop_end
	; if we read a NULL character, we are done
	cmp bl, 0
	je .accumulate_loop_end

	; multiple the contents of rax by 10 (imul always uses rax)
	mov rdx, 10
	imul rdx

	; subtract the 48 offset from rbx to get the digit's numeric value
	; (because 48 is the ascii code of char '0')
	sub rbx, 48
	; add the digit's value to rax - the number being accumulated
	add rax, rbx

	; increment rcx - the loop counter - by 1
	inc rcx
	jmp .accumulate_loop

.accumulate_loop_end:

	mov rdx, 0
	pop rbx
	imul rbx

	pop rdx
    pop rbx
	pop rcx
	ret
