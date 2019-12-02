section .data
question: db "Are you sure? (y/n)", 10
affirmative: db "Okay, fine.", 10
negative: db "Nevermind, then.", 10

section .bss
input: resb 255

section .text
global start
start:
	; print question
	push 19
	push question
	push 1
	mov eax, 4
	sub esp, 4  ; this is like another push but you don't care about the value
	int 80h
	add esp, 16 ; this is like pop 4 times

	push 255
	push input
	push 0
	mov eax, 3
	sub esp, 4
	int 80h
	add esp, 16

	; if input's first character is y, go to label: yes
	; byte [input] means the byte value that input points to, in this
	; case that is the first letter entered by the user
	; 121 is the ASCII code for the 'y' character
	cmp byte [input], 121
	; if the previous comparison yielded equal, jump to the yes label
	je yes

	; else, print "negative" message
	; another print out similar to the first one
	push 17
	push negative
	push 1
	mov eax, 4
	sub esp, 4
	int 80h
	add esp, 16

	; call system exit, number is 1, with error code of 0, which means no error
	push 0
	mov eax, 1
	sub esp, 12
	int 80h

yes:

	; print affirmative message
	push 12
	push affirmative
	push 1
	mov eax, 4
	sub esp, 4
	int 80h
	add esp, 16

	; call system exit
	push 0
	mov eax, 1
	sub esp, 12
	int 80h
