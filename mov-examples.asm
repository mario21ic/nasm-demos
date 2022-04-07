;section .data
;resultado db '0'
section .bss
rpta resb 1

section .text
    global _start

_start:
; Asignar valor 8
mov ax, 8

; Convertir en ascii
add ax, 48
mov [rpta], ax

; Almacenar en puntero
mov [rpta], ax

; Imprimir rpta
mov eax, 4
mov ebx, 1
mov ecx, rpta
mov edx, 1 ; numero de bytes a imprimir
int 0x80

mov eax, 1
mov ebx, 0
int 0x80

