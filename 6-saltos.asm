;section .data
msg db "Hello world", 10, 13
len equ $-msg
;ln db 10, 13
;lonln equ 2

section .bss
rpta resb 1

section .text
global _start

_start:
    ; saltar
    jmp print_hello

    ; Imprimir zf
    ;mov eax, 4
    ;mov ebx, 1
    ;mov ecx, rpta_zf
    ;mov edx, 1 ; numero de bytes a imprimir
    ;int 0x80

    jmp salir

salir:
    ; finalizar
    mov eax, 1
    mov ebx, 0
    int 0x80


print_hello:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len ; numero de bytes a imprimir
    int 0x80
