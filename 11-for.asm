;section .bss
segment .bss
    rpta resb 1

;section .text
segment .text
    global _start


_start:
    ;mov ecx, 2 ; saldra 3=2+1
    ;mov ecx, 3 ; saldra 6=3+2+1
    ;mov ecx, 4 ; saldra : 10=5+4+3+2+1
    mov ecx, 5 ; saldra ? 15=5+4+3+2+1
    mov eax, 0 ; acumulador


for:
    add eax, ecx
    loop for ; va a decrementar y regresar a for hasta que ecx=0


    add eax, 48 ; ascii
    mov [rpta], eax

    ; Imprimir en pantalla
    mov eax, 4
    mov ebx, 1 ; codigo monitor
    mov ecx, rpta ; direccion de memoria donde esta la data
    mov edx, 1 ; cantidad de caracteres
    int 0x80

    ; Imprimir en pantalla
    mov eax, 4
    mov ebx, 1 ; codigo monitor
    mov ecx, "xD"; direccion de memoria donde esta la data
    mov edx, 2 ; cantidad de caracteres
    int 0x80

    ; Finalizar
    mov eax, 1
    mov ebx, 0 ; Ok
    ;mov ebx, 1 ; Error
    int 0x80
