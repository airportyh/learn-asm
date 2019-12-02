section .data
    ; Define constants
    num1:   equ 100
    num2:   equ 50
    ; initialize message
    msg:    db "Sum is correct\n"
    SYS_WRITE equ 0x2000004
    STD_IN    equ 1
    SYS_EXIT  equ 0x2000001

section .text
    global start

;; entry point
start:
    ; set num1's value to rax
    mov rax, num1
    ; set num2's value to rbx
    mov rbx, num2
    ; get sum of rax and rbx, and store it's value in rax
    add rbx, rax
    ; compare rax and 150
    cmp rbx, 150
    ; go to .exit label if rax and 150 are not equal
    jne .exit
    ; go to .rightSum label if rax and 150 are equal
    jmp .rightSum

; Print message that sum is correct
.rightSum:
    ;; write syscall
    mov     rax, SYS_WRITE
    ;; file descritor, standard output
    mov     rdi, 1
    ;; message address
    mov     rsi, msg
    ;; length of message
    mov     rdx, 15
    ;; call write syscall
    syscall
    ; exit from program
    jmp .exit

; exit procedure
.exit:
    ; exit syscall
    mov    rax, SYS_EXIT
    ; exit code
    mov    rdi, 0
    ; call exit syscall
    syscall