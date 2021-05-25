;section .data
;resultado db '0'
section .bss
div_rpta resb 1
div_residuo resb 1
mul_rpta resb 1

section .text
    global _start

_start:
; Dividir
mov bx, 2
mov dx, 0
mov ax, 7
div bx ; realiza la division (dx:ax / bx)

; convertir a ascii
add ax, 48
mov [div_rpta], ax
add dx, 48 ; ascii
mov [div_residuo], dx

; Imprimir rpta
mov eax, 4
mov ebx, 1
mov ecx, div_rpta
mov edx, 1 ; numero de bytes a imprimir
int 0x80

; Imprimir residuo
mov eax, 4
mov ebx, 1
mov ecx, div_residuo
mov edx, 1 ; numero de bytes a imprimir
int 0x80


; Multiplicar
mov ax, 3
mov cx, 2
mul cx ; realiza la multiplicacion (ax * cx)
add ax, 48 ; ascii
mov [mul_rpta], ax

; Imprimir rpta
mov eax, 4
mov ebx, 1
mov ecx, mul_rpta
mov edx, 1 ; numero de bytes a imprimir
int 0x80

mov eax, 1
mov ebx, 0
int 0x80

