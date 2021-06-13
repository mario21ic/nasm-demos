%macro imprimir 2
; 2 = nro de params
mov eax, 4
mov ebx, 1
mov ecx, %1 ; primer param
mov edx, %2 ; segundo param
int 0x80
%endmacro

section .data
    datos db '45', '23', '11', '09', '22', '99'
    datoslen equ $-datos

    len db 0xA, 0xD
    lenln equ $-len

section .bss
    rpta resb 1

section .text

    global _start


_start:
    mov ebp, datos ; copiar datos
    mov edi, 1 ; contador
    while:
        imprimir ebp, 2 ; imprimira 2 bytes
        imprimir len, lenln
        add ebp, 2 ; sumar 2
        add edi, 2 ; contador+2
        cmp edi, datoslen ; compara si son iguales
        jb while ; si es menor entonces while

    ; Finalizar
    mov eax, 1
    mov ebx, 0 ; Ok
    ;mov ebx, 1 ; Error
    int 0x80
