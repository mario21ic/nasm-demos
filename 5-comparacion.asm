section .data
ln db 10, 13
lonln equ 2

section .bss
rpta resb 1

section .text
global _start

_start:
; comparar
;mov
;mov [rpta], bl

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

