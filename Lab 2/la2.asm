.model tiny
.386

.data
year equ 2020h
id equ 0435h
sum db 02,00,02,00,03,00,04,03,05

.code
.startup
    ;uncomment the next 2 lines if directly debugging from vscode
    ;mov ax,076ch
    ;mov ds,ax
    lea si,sum
    mov bx,0000h
    mov cx,9
x1: add bl,[si]
    jnc x2
    inc bh
x2: inc si
    dec cx
    jnz x1
    mov ax,year
    mov ds,ax
    mov ds:id,bx    
.exit
END
;result of the above addition should result in 19d or 13h. The right value is seen at the location 2020:0435