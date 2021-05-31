;section .data
;ln db 10, 13
;lonln equ 2

section .bss
rpta_zf resb 1
rpta_cf resb 1

section .text
global _start

_start:
; comparar
mov ax, 5
mov bx, 8
cmp ax, bx
;add zf, 48
;add cf, 48
;mov [rpta_zf], zf
;mov [rpta_cf], cf

; Imprimir zf
;mov eax, 4
;mov ebx, 1
;mov ecx, rpta_zf
;mov edx, 1 ; numero de bytes a imprimir
;int 0x80

; finalizar
mov eax, 1
mov ebx, 0
int 0x80

