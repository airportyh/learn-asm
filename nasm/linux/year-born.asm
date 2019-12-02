; This program asks the user for their age, and then
; calculates the year that they were born in and prints it out to the user.

SECTION .data
; these are string constants
ask_number db 'How old are you? '
answer db 'So you were born in '

SECTION .bss
; this buffer is used to store the user's input, which are expected to be all digits
; they can enter a max of 255 digits.
number_buffer: resb 255

SECTION .text
global _start
_start:
	; ============== Begin User Interaction ==========================
	; this makes a call to sys_write to print the "ask_number" message
	; to the terminal. See https://syscalls.kernelgrok.com/
	mov eax, 4
	mov ebx, 1
	mov ecx, ask_number
	mov edx, 17
	int 80h

	; this makes a call to sys_read to read the user's input into
	; number_buffer
	mov eax, 3
	mov ebx, 2
	mov ecx, number_buffer
	mov edx, 255
	int 80h

	; ======== Begin Converting User Input to a Number ===========
	; The strategy here is to loop through each digit entered by
	; the user. We'll use the eax as the accumulator variable, which
	; will be initialized to 0. For each digit encountered, from left
	; to right, the numeric value of the digit will be added to the
	; accumulator variable, then each time the next digit is encountered,
	; the accumulator variable will be multiplied by 10 before that
	; digit is added into the result.

	; initializing ecx which is used as the loop counter as well as
	; the index into the number_buffer
	mov ecx, 0
	; eax will contain the number we are accumulating to base on
	; the digits entered by the user
	mov eax, 0

accumulate_loop:
	; clear out ebx before reading a char into its lower byte (bl)
	; this is needed so that later on when we subtract the 48 offset
	; from it, it will make sense
	mov ebx, 0
	; read a char from the number_buffer into the lower byte of ebx: aka bl
	mov bl, [number_buffer + ecx]

	; if we read a '\n' character, we are done
	cmp bl, 10
	je accumulate_loop_end
	; if we read a NULL character, we are done
	cmp bl, 0
	je accumulate_loop_end

	; multiply the contents of eax by 10 (imul always uses eax)
	mov edx, 10
	imul edx

	; subtract the 48 offset from ebx to get the digit's numeric value
	; (because 48 is the ascii code of char '0')
	sub ebx, 48
	; add the digit's value to eax - the number being accumulated
	add eax, ebx

	; increment ecx - the loop counter - by 1
	inc ecx
	jmp accumulate_loop

accumulate_loop_end:
	; save the value of eax onto the stack
	; because the next sys call is going to
	; obliterate it
	push eax

	; calls sys_write to print the "answer" message to the terminal
	mov eax, 4
	mov ebx, 1
	mov ecx, answer
	mov edx, 20
	int 80h

	; restore the previous value of eax that was saved earlier
	pop eax

	; copy eax to edx to maneuver for a subtraction
	; we want to do: 2019 - age
	; since age is the value currently in eax, but
	; we want eax to contain the result of the subtraction, so
	; that it can be printed (the number printing code reads from eax)
	; we move 2019 to eax, age (currently eax) to edx and then
	; perform the subtraction
	mov edx, eax
	mov eax, 2019
	sub eax, edx

	; =========== Begin Printing Resulting Number ==================
	; Now we start printing the resulting year whose value is in eax
	; the strategy is: we push each the ascii representation of each
	; digit of the number sequentially
	; onto the stack, then we go back through the stack and print
	; each digit sequentially. The reason we need a stack for this
	; is because we need to print in the reverse order versus
	; the order in which we calculate the individual digits via
	; integer division.

	; we push a value 0 onto the stack, this will be used as our
	; end marker to know we are out of digits
	mov edx, 0
	push edx
divide_loop:
	; zero out edx for division because it in the upper byte of the quotient
	; (idiv uses the combination of edx and eax as the quotient)
	mov edx, 0
	; divide edx:eax by 10, the resulting quotient will be in eax, and the remainder
	; in edx
	mov esi, 10
	idiv esi

	; add 48 to the value of the digit to convert it into the ascii
	; representation of the digit (48 is the ascii code for the
	; character '0')
	add edx, 48
	; push the ascii character onto the stack
	push edx

	; if quotient is not zero, go to top of loop and do it again
	cmp eax, 0
	jne divide_loop

print_loop:
	; now that the individual ascii digits are ready on the stack
	; this loop will print each digit

	; print the current digit that is on the stack
	; (esp is the stack pointer)
	mov ecx, esp
	mov ebx, 1
	mov eax, 4
	mov edx, 1
	int 80h

	; pop this digit and move to the next digit
	pop edx

	; if current digit is 0 we are done
	cmp edx, 0
	jne print_loop

	; exit the program
	mov eax, 1
	mov ebx, 0
	int 80h
