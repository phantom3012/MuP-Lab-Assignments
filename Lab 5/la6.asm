.model tiny
.386

.data
    username db "SaiKartik$"
    password db "2020A3PS0435P"
    string1  db "Enter your name without any space:$"
    string2  db "Kindly enter your password: $"
    nauthu   db "User does not exist!$",0ah
    nauthp   db "Wrong password!$",0ah
    auth     db 0ah,"Authentication Successful, you are welcome $"
    newline  db 0ah,"$"

.code

.startup
    lea dx,string1
    mov ah,09h
    int 21h
    mov cx,00h
    L1: mov ah,01h
        int 21h
        mov [si],al
        inc si
        inc cx
        cmp al,0dh
        jnz L1
    lea di,username
    sub si,cx
    dec cx
    L2: mov bl,byte ptr[si]
        cmp bl,byte ptr[di]
        jnz X1
        inc si
        inc di
        dec cx
        jnz L2
    lea dx,string2
    mov ah,09h
    int 21h
    add si,100h
    mov cx,00h
    L3: mov al,2ah
        mov ah,07h
        int 21h
        mov [si],al
        mov ah,02h
        mov dl,2ah
        int 21h
        mov al,[si]
        inc si
        inc cx
        cmp al,0dh
        jnz L3
    lea dx,newline
    mov ah,09h
    int 21h
    sub si,cx
    dec cx
    lea di,password
    L4: mov bl,byte ptr[si]
        cmp bl,byte ptr[di]
        jnz X2
        inc si
        inc di
        dec cx
        jnz L4
    lea dx,newline
    mov ah,09h
    int 21h
    lea dx, auth
    int 21h
    lea dx, username
    int 21h
    jmp X3
    X1: lea dx,nauthu
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
    X2: lea dx,nauthp
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
    X3: mov ah,4ch
        int 21h
.exit
end
