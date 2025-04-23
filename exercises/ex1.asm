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

.code
start:
    ; Somar 5 numeros e exibir o resultado
    mov eax, 1
    add eax, 3
    add eax, 5
    add eax, 7
    add eax, 9

    printf("1 + 3 + 5 + 7 + 9 = %d",eax)
    
    invoke ExitProcess, 0
end start