.model tiny
.386
.data
MYNAMEE db 'Sai Kartik'
FLIP db 10 dup (?)
.code
.startup
	lea si, MYNAMEE
	lea di, [FLIP + 9]
	mov cx,10
x1:
	cld
	lodsb
	std
	stosb
	dec cx
	cmp cx,0
	jne x1
	lea si, FLIP
	mov ax, 2020h
	mov es,ax
	mov di, 0435h
	mov cx, 10
	cld
	rep movsb
.exit
end