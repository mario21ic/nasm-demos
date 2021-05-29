section .bss
resultado resb 1

section .text
global _start

_start:
mov ebx, 4
shl ebx, 1 ; desplazar a la izquierda (2 * 4)

add ebx, 48 ; ascii
mov [resultado], ebx

; Imprimir rpta
mov eax, 4
mov ebx, 1
mov ecx, resultado
mov edx, 1 ; numero de bytes a imprimir
int 0x80

mov eax, 1
mov ebx, 0
int 0x80

