section .data
    msg db 0xA,0xD, "NO es posible dividir entre cero", 0xA,0xD
    msglen equ $-msg

    fuga db 0xA, 0xD, "Salimos", 10, 13
    fugalen equ $-fuga

section .bss
    rpta resb 1

section .text
    global _start

_start:
    ; comparar
    mov eax, 4
    ; mov ebx, 2
    mov ebx, 0 ; para q salte
    mov edx, 0

    ; Comparar si es igual que 0
    cmp ebx, 0
    je es_cero ; saltar

    div ebx
    add ebx, 48 ; ascii
    mov [rpta], ebx

    mov eax, 4
    mov ebx, 1
    mov ecx, rpta
    mov edx, 1
    int 0x80
    jmp salir ; evitamos se ejecute es_cero

es_cero:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msglen ; numero de bytes a imprimir
    int 0x80

salir:
    ; Imprimir fuga
    mov eax, 4
    mov ebx, 1
    mov ecx, fuga
    mov edx, fugalen ; numero de bytes a imprimir
    int 0x80

    ; Finalizar
    mov eax, 1
    mov ebx, 0
    int 0x80
