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
    subtracao dd 0
    multiplicacao dd 0
    divisao dd 0
    modulo dd 0

.code
start:
    ; Converter codigo para assembly
    ; int num1 = 50
    ; int num2 = 3
    ; printf(num1+num2)
    ; printf(num1-num2)
    ; printf(num1*num2)
    ; printf(num1/num2)
    ; printf(num1%num2)
    
    mov eax, num1
    add eax, num2
    mov soma, eax
    printf("Add: %d\n",soma)

    mov eax, num1
    sub eax, num2
    mov subtracao, eax
    printf("Sub: %d\n",subtracao)

    mov eax, num1
    imul eax, num2
    mov multiplicacao, eax
    printf("Imul: %d\n",multiplicacao)

    mov edx, 0
    mov eax, num1
    mov ebx, num2
    div ebx
    mov divisao, eax
    mov modulo, edx
    printf("Div: %d\n",divisao)
    printf("Resto Div: %d\n",modulo)
    
    invoke ExitProcess, 0
end start