section .data
suma_rpta db '0'
;resta_rpta db '0'

section .bss
resta_rpta resb 1

section .text
    global _start

_start:
; Suma
; d = d + f => d += f => add d, f
mov eax, 2
mov ebx, 3
add eax, ebx
; Convertir a ascii => 0 -> 48, 1 -> 49, 2 -> 50, 9 -> 57
;add eax, '0'
add eax, 48
mov [suma_rpta], eax

; Imprimir en pantalla
mov eax, 4
mov ebx, 1
mov ecx, suma_rpta
mov edx, 1
int 0x80

; Resta
mov eax, 8
mov ebx, 1
sub eax, ebx
add eax, 48 ; convertir a ascii
mov [resta_rpta], eax

; Imprimir en pantalla
mov eax, 4
mov ebx, 1
mov ecx, resta_rpta
mov edx, 1
int 0x80

; Finalizar correctamente
mov eax, 1
mov ebx, 0

int 0x80

