%macro imprimir 2 ; nro de params
    mov eax, 4
    mov ebx, 1
    mov ecx, %1 ; primer param
    mov edx, %2 ; segundo param
    int 0x80
%endmacro

%macro leer 2
    mov eax, 3 ; leer datos
    mov ebx, 0 ; device a leer es el teclado
    mov ecx, %1 ; guardar
    mov edx, %2 ; numero de bytes
    int 0x80
%endmacro

section .data
    datos db '0', '0', '0', '0', '0', '0'
    datoslen equ $-datos

    len db 0xA, 0xD
    lenln equ $-len

section .bss
    rpta resb 1

section .text

    global _start


_start:

    ; Leer
    mov ebp, datos ; copiar datos
    ;mov edi, 1 ; contador
    mov edi, 0 ; contador
    while_lectura:
        leer ebp, 1 ; leer 1 byte y guardarlo en ebp
        add ebp, 1 ; sumar 1
        add edi, 1 ; contador+1
        cmp edi, datoslen ; compara si son iguales
        jb while_lectura ; si es menor entonces while


    ; Imprimir
    mov ebp, datos ; copiar datos
    ;mov edi, 1 ; contador
    mov edi, 0 ; contador
    while_imprimir:
        imprimir ebp, 1 ; imprimira 1 byte
        imprimir len, lenln
        add ebp, 1 ; sumar 1
        add edi, 1 ; contador+1
        cmp edi, datoslen ; compara si son iguales
        jb while_imprimir ; si es menor entonces while


    ; Finalizar
    mov eax, 1
    mov ebx, 0 ; Ok
    ;mov ebx, 1 ; Error
    int 0x80
