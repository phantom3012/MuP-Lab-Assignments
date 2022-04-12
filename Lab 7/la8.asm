.model tiny

.data
    fdata   db "File_1",0
    fcopy   db "File_2",0
    nm1     db "Sai",0dh,0
    nm2     db "Kartik",0dh,0
    roll    db "2020A3PS0435P",0
    handle1 dw ?
    handle2 dw ?
    buffer  db 24 dup(?)
    
.code

.startup
    ;create File_1
    mov ah,3ch
    mov cl,1
    lea dx,fdata
    int 21h
    mov handle1,ax
    ;create File_2
    mov ah,3ch
    mov cl,1
    lea dx,fcopy
    int 21h
    mov handle2,ax
    ;open File_1
    mov ah,3dh
    mov al,2
    lea dx,fdata
    int 21h
    mov handle1,ax
    ;open File_2 in write
    mov ah,3dh
    mov al,1
    lea dx,fcopy
    int 21h
    mov handle2,ax
    ;write to File_1
    mov ah,40h
    mov cx,4
    lea dx,nm1
    mov bx,handle1
    int 21h
    mov ah,40h
    mov cx,7
    lea dx,nm2
    mov bx,handle1
    int 21h
    mov ah,40h
    mov cx,13
    lea dx,roll
    mov bx,handle1
    int 21h
    ;move file pointer to the beginning of File_1
    mov ah,42h
    mov al,0
    mov bx,handle1
    mov dx,0
    mov cx,0
    int 21h
    ;read from the file
    mov ah,3fh
    mov bx,handle1
    mov cx,18h
    lea dx,buffer
    int 21h
    mov handle1,ax
    ;write to File_2
    mov ah,40h
    mov bx,handle2
    lea dx,buffer
    mov cx,18h
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