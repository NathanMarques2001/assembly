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
    n1 dd 2
    n2 dd 9
    n3 dd 29
.code
_soma:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 16]
    add eax, [ebp + 12]
    add eax, [ebp + 8]

    pop ebp
    ret 12

start:
    push n1
    push n2
    push n3

    call _soma

    printf("Soma: %d",eax)
    
    invoke ExitProcess, 0
end start