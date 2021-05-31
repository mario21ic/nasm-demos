section .data
    linea db 0xA, 0xD

    par db 0xA,0xD, "Es ", 0xA, 0xD
    par_len equ $-par

    impar db 0xA,0xD, "Es impar", 0xA, 0xD
    impar_len equ $-impar

section .bss
    rpta resb 1

section .text
    global _start

_start:
    mov eax, 5
    mov ebx, 9

    ;cmp eax, ebx ; no va a saltar
    cmp eax, 5 ; va a modificar zero flag y saltara
    jz cuerpo_if
else:
    mov ebx, 0
    jmp salir

cuerpo_if:
    mov ebx, 1

salir:
    add ebx, 48 ; ascii
    mov [rpta], ebx

    ; Imprimir en pantalla
    mov eax, 4
    mov ebx, 1
    mov ecx, rpta
    mov edx, 1
    int 0x80

    ; Finalizar
    mov eax, 1
    mov ebx, 0
    int 0x80
