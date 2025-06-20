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
_soma Proc
    push ebp
    mov ebp, esp

    mov eax, 0
    mov ebx, eax

    _loop:
        cmp ebx, 50
        jge _fimLoop
        add eax, 1
        mov ebx, eax
        jmp _loop

    _fimLoop:
        printf("%d",eax)

    mov esp, ebp
    pop ebp
    ret
_soma Endp

start:
    call _soma

    _fim:
        invoke ExitProcess, 0
end start

; ---------------------------------- ;
;          Codigo acima em C:        ;
; ---------------------------------- ;
; void soma()                        ;
; {                                  ;
;	int soma = 0;                  ;
;                                    ;
;	for(int i = 0; i < 50; i++){   ;
;		soma += i;               ;
;	}                              ;
;                                    ;
;	printf("%d",soma);             ;
; }                                  ;
;                                    ;
; int main()                         ;
; {                                  ;
;	fazSoma();                     ;
; }                                  ;
; ---------------------------------- ;