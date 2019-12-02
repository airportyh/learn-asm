%include '../lib/exit_osx.asm'
%include '../lib/print_osx.asm'
%include '../lib/print_char.asm'
%include '../lib/input_osx.asm'
%include '../lib/itoa.asm'
%include '../lib/atoi.asm'

SECTION .data
prompt db '> '

SECTION .bss
scratch_buffer: resb 255
current_number: resb 1

SECTION .text
global start
start:
    mov dword [current_number], 0

repl:

    mov ecx, prompt
    mov edx, 2
    call print

    mov ecx, scratch_buffer
    mov edx, 255
    call input

    cmp byte [scratch_buffer], 113 ; is it 'q'?
    je done

    mov esi, scratch_buffer
    call atoi

    add dword [current_number], eax
    mov eax, dword [current_number]

    mov ebx, scratch_buffer
    call itoa
    call print
    mov esi, 10
    call print_char

    jmp repl

done:
    call exit
