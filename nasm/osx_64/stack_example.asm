; example from "Local Variables and Stack Frames" of https://cs.lmu.edu/~ray/notes/nasmtutorial/

global  example
section .text

example:
mov     qword [rsp-16], 7
mov     rax, rdi
imul    rax, [rsp+8]
add     rax, rsi
ret
