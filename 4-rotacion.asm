section .data
ln db 10, 13
lonln equ 2

section .bss
rpta resb 1

section .text
global _start

_start:
; rotar a la izquierda
mov bl, 128 ; binario = 10000000
rol bl, 1 ; solo mueve 1 bit = 000000001
add bl, 48 ; 49 = 1 ascii
mov [rpta], bl

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
mov edx, lonln ; numero de bytes a imprimir
int 0x80

; rotar a la derecha
mov bl, 128 ; binario = 10000000
ror bl, 1 ; solo mueve 1 bit = 01000000
add bl, 48 ; 112 = p ascii
mov [rpta], bl

; Imprimir rpta
mov eax, 4
mov ebx, 1
mov ecx, rpta
mov edx, 1 ; numero de bytes a imprimir
int 0x80

; finalizar
mov eax, 1
mov ebx, 0
int 0x80

