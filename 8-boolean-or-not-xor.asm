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
    ; Convertir mayuscula a minuscula
    ;mov bl, 'A'
    mov bl, 'Y'
    or bl, 00100000b ; mascara
    mov [rpta], bl

    ; Imprimir en pantalla
    mov eax, 4
    mov ebx, 1
    mov ecx, rpta
    mov edx, 1
    int 0x80

    ; Salto de linea
    mov eax, 4
    mov ebx, 1
    mov ecx, linea
    mov edx, 2
    int 0x80

    ; realizar un OR
    mov al, 2 ; 00000010
    ;mov bl, 1 ; 00000001
    mov bl, 2 ; 00000010
    or al, bl; con 1 sale 2 par y con 1 sale 3 impar
    add al, 48 ; ascii
    mov [rpta], al

    ; Imprimir en pantalla
    mov eax, 4
    mov ebx, 1
    mov ecx, rpta
    mov edx, 1
    int 0x80

    ; Salto de linea
    mov eax, 4
    mov ebx, 1
    mov ecx, linea
    mov edx, 2
    int 0x80

    ; XOR
    mov al, 00000101b ; 5
    mov bl, 00000011b ; 3
    xor al, bl ; si los bits son diferentes dara 1 sino 0 
    ; al => 00000110 = 6
    add al, 48 ; ascii
    mov [rpta], al
    ; Imprimir en pantalla
    mov eax, 4
    mov ebx, 1
    mov ecx, rpta
    mov edx, 1
    int 0x80

    ; Salto de linea
    mov eax, 4
    mov ebx, 1
    mov ecx, linea
    mov edx, 2
    int 0x80

    ; NOT
    mov al, 11110110b ; 246
    not al ; 00001001 = 9
    add al, 48 ; ascii
    mov [rpta], al
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
