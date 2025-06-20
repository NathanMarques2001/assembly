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
    n dd 0
.code
start:
    ; printar 32 numeros

    mov n, 0

    _loop:
        cmp n, 32
        jge _fim
        printf("%d\n",n)
        add n, 1
        jmp _loop
        
    _fim:
        invoke ExitProcess, 0
end start