.686
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\msvcrt.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\msvcrt.lib
include \masm32\macros\macros.asm

.data
    nAtual dd 0
    qtdSomado dd 0
    soma dd 0

.code
start:
    ; Soma dos primeiros 100 números positivos e pares
    _while:
        cmp qtdSomado, 100
        jge _fim

        mov eax, nAtual
        mov edx, 0
        mov ebx, 2
        div ebx
        cmp edx, 0
        jne _incrementa

        mov eax, nAtual
        add soma, eax
        add qtdSomado, 1

    _incrementa:
        add nAtual, 1
        jmp _while

    _fim:
        printf("Soma: %d", soma)
        invoke ExitProcess, 0

end start
