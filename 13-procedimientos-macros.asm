%macro imprimir 2
; 2 = nro de params
mov eax, 4
mov ebx, 1
mov ecx, %1 ; primer param
mov edx, %2 ; segundo param
int 0x80
%endmacro


section .data
    msg1 db "mensaje1", 0xA, 0xD
    len1 equ $-msg1

    msg2 db "mensaje2", 0xA, 0xD
    len2 equ $-msg2

section .bss
    rpta resb 1

section .text

imprime:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret ; para no repetir

    global _start


_start:
    ; usando procedimientos
    mov ecx, msg2
    mov edx, len2
    call imprime

    mov ecx, msg1
    mov edx, len1
    call imprime

    ; usando macro
    imprimir msg1, len1
    imprimir msg2, len2

    ; Finalizar
    mov eax, 1
    mov ebx, 0 ; Ok
    ;mov ebx, 1 ; Error
    int 0x80
