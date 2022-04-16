.model tiny
.data
nm   db "Name: Sai Kartik"
roll db "ID: 2020A3PS0435P"
dept db "Discipline: EEE"
.code
.startup
;set up video mode
mov ah,0
mov al,3
int 10h
;write the string
mov ah,13h
mov al,01h
mov bh,00h
mov bl,10101001b
mov cx,10h
mov dl,04h
mov dh,04h
lea bp,nm
int 10h
;write the second string
mov ah,13h
mov al,01h
mov bh,00h
mov bl,10101001b
mov cx,11h
mov dl,20h
mov dh,0ch
lea bp,roll
int 10h
;write the third string
mov ah,13h
mov al,01h
mov bh,00h
mov bl,10101001b
mov cx,0fh
mov dl,40h
mov dh,18h
lea bp,dept
int 10h
.exit
end