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
    n1 dd 6
    n2 dd 4
    n3 dd 1
.code
start:
    ; Verifica qual numero eh maior

    mov ebx, n1
    cmp ebx, n2
    jnge _compararN2ComN3
    
    cmp ebx, n3
    jnge _maioreEhN3
    mov eax, ebx
    jmp _fim

    _compararN2ComN3:
        mov ebx, n2
        cmp ebx, n3
        jnge _maioreEhN3
        mov eax, ebx
        jmp _fim

    _maioreEhN3:
        mov eax, n3

    _fim:
        printf("O maior numero eh o: %d",eax)
        invoke ExitProcess, 0
end start