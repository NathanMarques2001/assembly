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
reiciaCalculadora dd 0
inputNumber1 dd 0
inputNumber2 dd 0
apresentacao db "-------------------------------\nBem vindo a calculadora em ASM\n-------------------------------\n", 13, 10, 0
perguntaNum1  db "Insira o primeiro numero -> ", 0
perguntaOp  db "\nEscolha o numero do operador:\n1. Soma\n2.Subtracao\n3.Multiplicacao\n4.Divisao\n5.Modulo\n-> "
perguntaNum2  db "\nInsira o segundo numero -> ", 0
num1 dd 0
op dd 0
opErro db "O numero '%d' nao eh um numero de operador valido!\nDigite um numero valido do menu!", 13, 10, 0
num2 dd 0
resultado dd 0
exibeResultado db "Restultado = %d", 13, 10, 0

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
    invoke crt_printf, addr apresentacao

_insereDados:
    invoke crt_printf, addr perguntaNum1
    invoke crt_gets, addr num1
    push num1
    
    invoke crt_printf, addr perguntaNum2
    invoke crt_gets, addr num2
    push num2

_escolheOperador:
    invoke crt_printf, addr perguntaOp
    invoke crt_gets, addr op

    cmp op, 1
    jne _else1
    call _soma

_else1:
    cmp op, 2
    jne _else2
    call _subtrai
    
_else2:
    cmp op, 3
    jne _else3
    call _produto
    
_else3:
    cmp op, 4
    jne _else4
    call _divisao
    
_else4:
    cmp op, 5
    jne _else5
    call _modulo

_else5:
    invoke crt_printf, addr opErro
    jmp _escolheOperador

_exibeResultado:
    invoke crt_printf, addr exibeResultado, addr resultado
    

    invoke ExitProcess, 0
end start