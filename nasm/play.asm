section .data
	helloMessage: db "Hello, world!", 0xa
	helloLen equ $-helloMessage
    SYS_WRITE equ 0x2000004
    STD_IN    equ 1
    SYS_EXIT  equ 0x2000001

section .text
    global start

start:

    mov r8, 48
.loop:
	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, [rdi]
	mov rdx, 1
	syscall

	;; sub r8, 1

    ;; cmp r8, 0
	
    ;; mov    rax, SYS_EXIT
    ;; mov    rdi, 0
    ;; syscall