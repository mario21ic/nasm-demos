section .bss
    rpta resb 1

section .text
    global _start


_start:
    ; example
    ;eax = 3
    ;while (eax > 0):
    ;    ebx = ebx + 2
    ;    eax = eax - 1

    ;mov eax, 3 ; dara 6
    mov eax, 4 ; dara 8

while:
    cmp eax, 0
    jna salida_while

    add ebx, 2
    sub eax, 1

    jmp while

salida_while:
    add ebx, 48 ; ascii
    mov [rpta], ebx

    ; Imprimir en pantalla
    mov eax, 4
    mov ebx, 1 ; codigo monitor
    mov ecx, rpta ; direccion de memoria donde esta la data
    mov edx, 1 ; cantidad de caracteres
    int 0x80

    ; Finalizar
    mov eax, 1
    mov ebx, 0 ; Ok
    ;mov ebx, 1 ; Error
    int 0x80
