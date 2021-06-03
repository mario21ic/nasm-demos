%macro imprimir 2
; 2 = nro de params
mov eax, 4
mov ebx, 1
mov ecx, %1 ; primer param
mov edx, %2 ; segundo param
int 0x80
%endmacro

section .data
    datos db '45', '23', '11', '09'
    datoslen equ $-datos

    len db 0xA, 0xD
    lenln equ $-len

section .bss
    rpta resb 1

section .text

    global _start

    ; String[] datos = {"45", "23", "11", "9"};
    ; System.ou.println(datos[0])
    ; System.ou.println(datos[1])
    ; System.ou.println(datos[2])
    ; System.ou.println(datos[3])


_start:
    imprimir datos, 2 ; imprimira 45
    imprimir len, lenln

    imprimir datos+2, 2 ; imprimira 23
    imprimir len, lenln

    imprimir datos+4, 2 ; imprimira 11
    imprimir len, lenln

    imprimir datos+6, 2 ; imprimira 09
    imprimir len, lenln

    ; Finalizar
    mov eax, 1
    mov ebx, 0 ; Ok
    ;mov ebx, 1 ; Error
    int 0x80
