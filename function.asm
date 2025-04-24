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
    num1 dd 10
    num2 dd 23

.code
_soma:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    add eax, [ebp + 12]

    pop ebp
    ret 8

start:   
    push num1
    push num2
    call _soma
    printf("Soma: %d\n", eax)
    invoke ExitProcess, 0
end start

; ebp -> topo da pilha
; esp -> base da pilha