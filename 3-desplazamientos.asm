section .data
;ln db 10, 13
ln db 0xA, 0xD
lonln equ 2

section .bss
rpta resb 1

section .text
global _start

_start:
; desplazar a la izquierda (4 * 2)
mov ebx, 4
shl ebx, 1

add ebx, 48 ; ascii
mov [rpta], ebx

; Imprimir rpta
mov eax, 4
mov ebx, 1
mov ecx, rpta
mov edx, 1 ; numero de bytes a imprimir
int 0x80

; Imprimir linea
mov eax, 4
mov ebx, 1
mov ecx, ln
mov edx, lonln
int 0x80


; desplazar a la derecha (4 / 2)
mov ebx, 8
mov cl, 2
shr ebx, cl

add ebx, 48 ; ascii
mov [rpta], ebx

; Imprimir rpta
mov eax, 4
mov ebx, 1
mov ecx, rpta
mov edx, 1 ; numero de bytes a imprimir
int 0x80

mov eax, 1
mov ebx, 0
int 0x80

