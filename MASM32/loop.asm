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
    iterator dd 0
.code
start:
    ; for(int i = 0; i < 50; i++)
    ;{
    ;   printf("%d\n"ni);
    ;}

    mov iterator, 0
    
    _loop:
        cmp iterator, 50
        jge _end_loop
        printf("%d\n",iterator)
        add iterator, 1
        jmp _loop
        
    _end_loop:
        invoke ExitProcess, 0
end start