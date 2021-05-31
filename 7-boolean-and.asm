section .data
    par db 0xA,0xD, "Es par", 0xA,0xD
    par_len equ $-par

    impar db 0xA,0xD, "Es impar", 0xA,0xD
    impar_len equ $-impar

section .bss
    rpta resb 1

section .text
    global _start

_start:
    ; Convertir minuscula a mayuscula 
    ;mov bl, 'a'
    mov bl, 'y'
    and bl, 11011111b ; mascara
    mov [rpta], bl

    ; Imprimir en pantalla
    mov eax, 4
    mov ebx, 1
    mov ecx, rpta
    mov edx, 1
    int 0x80

    ; realizar un AND
    mov al, 5 ; 00000101
    ;mov al, 8 ; 00001000
    mov bl, 1 ; 00000001
    and al, bl; con 5=1 impar con 8=0 par
    ;add al, 48 ; ascii
    ;mov [rpta], al

    ; flag zero
    jz es_par ; saltar

    ; Imprimir en pantalla
    mov eax, 4
    mov ebx, 1
    mov ecx, impar
    mov edx, impar_len
    int 0x80


    jmp salir ; evitamos se ejecute es_cero

es_par:
    mov eax, 4
    mov ebx, 1
    mov ecx, par
    mov edx, par_len ; numero de bytes a imprimir
    int 0x80

salir:
    ;mov eax, 4
    ;mov ebx, 1
    ;mov ecx, rpta
    ;mov edx, 1
    ;int 0x80

    ; Finalizar
    mov eax, 1
    mov ebx, 0
    int 0x80
