    .globl  _main

_main:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp

    leaq    -12(%rbp), %rsi
    movb    $72, -12(%rbp)
    movb    $101, -11(%rbp)
    movb    $108, -10(%rbp)
    movb    $108, -9(%rbp)
    movb    $111, -8(%rbp)

    movl    $1, %edi
    movl    $5, %edx
    callq   _write

    addq    $32, %rsp
    popq    %rbp
    retq