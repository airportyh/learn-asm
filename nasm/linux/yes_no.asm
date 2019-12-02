section .data
question: db "Are you sure? (y/n)", 10
affirmative: db "Okay, fine.", 10
negative: db "Nevermind, then.", 10

section .bss
input: resb 255

section .text
global _start
_start:
	; print question
	mov ecx, question
	; set fd parameter to 1, which means STDOUT
	mov ebx, 1
	; set system call number to 4, which is sys_write (https://syscalls.kernelgrok.com/)
	mov eax, 4
	; set the length of the string (20)
	mov edx, 20
	; int means interrupt, it means interrupt this program and
	; let the OS handle the system call before returning to us
	int 80h

	; prompt user and store answer in input
	; set max length to read from user to 255 characters
	mov edx, 255
	; set the buffer to read into: input from the .bss section
	mov ecx, input
	; set the fd parameter to 0, which means STDIN
	mov ebx, 0
	; set system call number to 3, which is sys_read
	mov eax, 3
	int 80h

	; if input's first character is y, go to label: yes
	; byte [input] means the byte value that input points to, in this
	; case that is the first letter entered by the user
	; 121 is the ASCII code for the 'y' character
	cmp byte [input], 121
	; if the previous comparison yielded equal, jump to the yes label
	je yes

	; else, print "negative" message
	; another print out similar to the first one
	mov ecx, negative
	mov ebx, 1
	mov eax, 4
	mov edx, 17
	int 80h

	; call system exit, number is 1, with error code of 0, which means no error
	mov ebx, 0
	mov eax, 1
	int 80h

yes:

	; print affirmative message
	mov ecx, affirmative
	mov ebx, 1
	mov eax, 4
	mov edx, 12
	int 80h

	; call system exit
	mov ebx, 0
	mov eax, 1
	int 80h
