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
    x dd 18
    y dd 4
    z dd 0
    w dd 0

.code
start:
    mov eax, x
    mov ebx, y
    mov edx, 0
    div ebx ; Quando usa div o eax recebe o resultado da divisao e edx o resto

    mov z, eax
    mov w, edx
    
    printf("Resultado: %d\n", z)
    printf("Resto: %d\n", w)
    
    invoke ExitProcess, 0
end start