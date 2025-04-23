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
    n dd 3
.code
start:
    mov edx, 0
    mov ebx, 2
    mov eax, n
    div ebx

    cmp edx, 0
    je _par

    printf("O numero %d, eh impar!",n)
    invoke ExitProcess, 0

    _par:
        printf("O numero %d, eh par!",n)

    invoke ExitProcess, 0
end start