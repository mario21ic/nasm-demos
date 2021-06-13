USE16 ; especifica que se usara el modo de compilacion de 16 bits
ORG 0x7C00 ; especifica que el programa se cargara en la direccion
           ; 0x7C00 de la memoria


jmp inicio ; salta a inicio

inicio:

    mov al, 'h'
    mov ah, 0x0e ; mueva el cursor en 1
    int 0x10

    mov al, 'e'
    mov ah, 0x0e ; mueva el cursor en 1
    int 0x10

    mov al, 'l'
    mov ah, 0x0e ; mueva el cursor en 1
    int 0x10

    mov al, 'l'
    mov ah, 0x0e ; mueva el cursor en 1
    int 0x10

    mov al, 'o'
    mov ah, 0x0e ; mueva el cursor en 1
    int 0x10

    hlt ; detener

    times 510-($-$$) db 0 ; luego de halt y posicion actual
    dw 0xaa55

