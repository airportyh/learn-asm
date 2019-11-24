    .globl  _main

_main:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp

    movq    $11, -14(%rbp)

    leaq    -12(%rbp), %rcx
    movb    $72, -12(%rbp)
    movb    $101, -11(%rbp)
    movb    $108, -10(%rbp)
    movb    $108, -9(%rbp)
    movb    $111, -8(%rbp)

    ## reverse the string
    movb    -12(%rbp), %sil
    movb    -8(%rbp), %al
    movb    %sil, -8(%rbp)
    movb    %al, -12(%rbp)

    movb    -11(%rbp), %sil
    movb    -9(%rbp), %al
    movb    %sil, -9(%rbp)
    movb    %al, -11(%rbp)

    movl    $1, %edi
    movl    $5, %edx
    movq	%rcx, %rsi
    callq   _write

    addq    $32, %rsp
    popq    %rbp
    retq