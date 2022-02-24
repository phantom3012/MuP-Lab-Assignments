.model tiny
.386

.data
year equ 2020h
id equ 0435h
len equ 10
NM db 'Sai Kartik'
FLIP db 10 DUP(?)

.code 
.startup
    mov cx,10
    mov bx,year
    mov es,bx
    lea si,NM
    mov di,id
    add di,len
    cld
x1: lodsb
    std
    stosb
    dec cx
    cld
    jnz x1
.exit
END