.model tiny
.386

.data
year equ 2020h
id equ 0435h
len equ 10
NM db 'Sai Kartik'
FLIP db 10 DUP(8)

.code 
.startup
    mov cx,10
    mov bx,2020h
    mov es,bx
    lea si,NM
    mov di,0435h
    add di,len
x1: mov al,[si]
    mov es:[di],al
    dec di
    inc si
    dec cx
    jnz x1
.exit
END