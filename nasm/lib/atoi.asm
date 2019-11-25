; atoi
; inputs:
;	esi - the address of the string buffer which contains the digits
; outputs:
;	eax - the resulting integer
; locals: ecx, ebx, edx
atoi:
	push ecx
	push ebx
	push edx
	; initializing ecx which is used as the loop counter as well as
	; the index into the esi
	mov ecx, 0
	; eax will contain the number we are accumulating to base on
	; the digits entered by the user
	mov eax, 0

.accumulate_loop:
	; clear out ebx before reading a char into its lower byte (bl)
	; this is needed so that later on when we subtract the 48 offset
	; from it, it will make sense
	mov ebx, 0
	; read a char from the esi into the lower byte of ebx: aka bl
	mov bl, [esi + ecx]

	; if we read a '\n' character, we are done
	cmp bl, 10
	je .accumulate_loop_end
	; if we read a NULL character, we are done
	cmp bl, 0
	je .accumulate_loop_end

	; multiple the contents of eax by 10 (imul always uses eax)
	mov edx, 10
	imul edx

	; subtract the 48 offset from ebx to get the digit's numeric value
	; (because 48 is the ascii code of char '0')
	sub ebx, 48
	; add the digit's value to eax - the number being accumulated
	add eax, ebx

	; increment ecx - the loop counter - by 1
	inc ecx
	jmp .accumulate_loop

.accumulate_loop_end:

	pop edx
    pop ebx
	pop ecx
	ret
