.model tiny
.386

.data
year equ 2020h
id equ 0435h
len equ 10
NM db 'Sai Kartik'
FLIP db len DUP(?)

.code 
.startup
    mov cx,len
    mov bx,year
    mov es,bx
    lea dx,FLIP
    lea si,NM
    mov di,id
    add di,len-1
    cld
x1: lodsb
    std
    stosb
    cld
    add cx,1
    jnz x1
.exit

END