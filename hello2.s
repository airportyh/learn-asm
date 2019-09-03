    .globl  _main

_main:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    leaq    -1(%rbp), %rsi
    movb    $72, -1(%rbp)
    movl    $1, %edi
    movl    $1, %edx
    callq   _write

    movb    $101, -1(%rbp)
    movl    $1, %edi
    movl    $1, %edx
    callq   _write

    movb    $108, -1(%rbp)
    movl    $1, %edi
    movl    $1, %edx
    callq   _write

    movb    $108, -1(%rbp)
    movl    $1, %edi
    movl    $1, %edx
    callq   _write

    movb    $111, -1(%rbp)
    movl    $1, %edi
    movl    $1, %edx
    callq   _write
    
    addq    $16, %rsp
    popq    %rbp
    retq