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
    x dd 4
    y dd 7
    z dd 0

.code
start:
    ; z = x + y
    mov eax, x
    add eax, y
    mov z, eax
    printf("Soma: %d\n",z)
    
    ; z = y - x
    mov eax, y
    sub eax, x
    mov z, eax
    printf("Subtracao: %d\n",z)

    ; z = x * y
    mov eax, x
    imul eax, y
    mov z, eax
    printf("Multiplicacao: %d",z)
    
    invoke ExitProcess, 0
end start