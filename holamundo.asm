section .data
    ; b 1 byte = 8 bits, 
    ; w 2 bytes = 16 bits
    ; d 4 bytes = 32 bits
    ; q 8 bytes = 64 bits
    ; t 10 bytes = 80 bits
    ; dq 16 bytes = 128 bits
;13 0xd => \ ; 10 = 0xa => \n 
msg db "Hola Mundo!!",0xa,0xd
;obtener el tamanio desde sentinel
len equ $-msg

section .text
    global _start

_start:
mov eax, 4
mov ebx, 1
mov ecx, msg
;mov edx, 14
mov edx, len
;int 80h
int 0x80 

; salir exitosamente
mov eax, 1
int 0x80

