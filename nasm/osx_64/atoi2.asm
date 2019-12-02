; This program asks the user for their age, and then
; calculates the year that they were born in and prints it out to the user.

%include "../lib/exit_osx_64.asm"
%include "../lib/print_osx_64.asm"
%include "../lib/input_osx_64.asm"
%include "../lib/atoi_64.asm"

SECTION .data
; these are string constants
ask_number db 'How old are you? '
answer db 'So you were born in '
star db '*'
equal_message db 'They are equal!'
.len: equ $ - equal_message
not_equal_message db 'They are not equal!'
.len: equ $ - not_equal_message

SECTION .bss
; this buffer is used to store the user's input, which are expected to be all digits
; they can enter a max of 255 digits.
number_buffer: resb 255

SECTION .text
global start
start:
	mov rsi, ask_number
	mov rdx, 17
	call print

    mov rsi, number_buffer
    mov edx, 255
    call input

    call atoi

	cmp rax, -5
	je equal
	jmp not_equal

equal:
	mov rsi, equal_message
	mov rdx, equal_message.len
	call print

	jmp finish
not_equal:

	mov rsi, not_equal_message
	mov rdx, not_equal_message.len
	call print
finish:
    call exit
