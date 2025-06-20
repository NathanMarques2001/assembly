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
    num1 dd 50
    num2 dd 3
    soma dd 0
    subtrai dd 0
    produto dd 0
    divisao dd 0
    modulo dd 0
.code
_soma:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    add eax, [ebp + 12]

    pop ebp
    ret 8

_subtrai:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    sub eax, [ebp + 12]
    
    pop ebp
    ret 8
    
_produto:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    imul eax, [ebp + 12]
    
    pop ebp
    ret 8
    
_divisao:
    push ebp
    mov ebp, esp

    mov edx, 0
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    div ebx

    pop ebp
    ret 8

_modulo:
    push ebp
    mov ebp, esp

    mov edx, 0
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    div ebx

    pop ebp
    ret 8
    
start:
    push num2
    push num1
    call _soma
    mov soma, eax

    push num2
    push num1
    call _subtrai
    mov subtrai, eax

    push num2
    push num1
    call _produto
    mov produto, eax

    push num2
    push num1
    call _divisao
    mov divisao, eax

    push num2
    push num1
    call _modulo
    mov modulo, eax

    printf("Soma: %d\n",soma)
    printf("Subtrai: %d\n",subtrai)
    printf("Produto: %d\n",produto)
    printf("Divisao: %d\n",divisao)
    printf("Modulo: %d\n",modulo)

    invoke ExitProcess, 0
end start