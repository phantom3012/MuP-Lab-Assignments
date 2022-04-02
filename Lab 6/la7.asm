.model tiny

.data
    fname     db "File_1",0
    froll     db "File_2",0
    nm        db "Sai Kartik",0dh,0
    roll      db "2020A3PS0435P",0
    handle1   dw ?
    handle2   dw ?
    bufferadd db 13 dup(?)  

.code

.startup
    ;create File 1
    mov ah,3ch
    mov cl,1
    lea dx,fname
    int 21h
    mov handle1,ax
    ;open File_1
    mov ah,3dh
    mov al,2
lea dx,fname
    int 21h
    mov handle1,ax
    ;write to File_1
    mov ah,40h
    mov cx,11
    lea dx,nm
    mov bx,handle1
    int 21h
    ;close File_1
    mov ah,3eh
    mov bx,handle1
    int 21h
    ;create File_2
    mov ah,3ch
mov cl,1
    lea dx,froll
    int 21h
    mov handle2,ax
    ;open File_2
    mov ah,3dh
    mov al,2
lea dx,froll
    int 21h
    mov handle2,ax
    ;write to File_2
    mov ah,40h
    mov cx,13
    lea dx,roll
    mov bx,handle2
    int 21h
    ;close File_2
    mov ah,3eh
    mov bx,handle2
    int 21h
    ;open File_1 in write
    mov ah,3dh
    mov al,1
lea dx,fname
int 21h
mov handle1,ax
    ;open File_2 in read
    mov ah,3dh
    mov al,0
lea dx,froll
    int 21h
    mov handle2,ax
    ;read from File_2
    mov ah,3fh
    mov cx,13
    mov bx,handle2
    lea dx,bufferadd
    int 21h
    mov handle2,ax
;move pointer to the EOF of File_1
    mov ah,42h
    mov al,2
    mov cx,0
mov dx,0
    mov bx,handle1
    int 21h
    ;write from bufferadd to File_1
    mov ah,40h
    mov bx,handle1
    lea dx,bufferadd
    mov cx,13
    int 21h
;close File_1
    mov ah,3eh
    mov bx,handle1
    int 21h
;close File_2
    mov ah,3eh
    mov bx,handle2
    int 21h
.exit
end