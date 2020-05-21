org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
        mov	    al, 03h
        int 	10h
        ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b		
	int 	10h
	ret

w_char:	mov 	ah, 09h
        mov 	al, cl
        mov 	bh, 0h
        mov 	bl, 00001111b
        mov 	cx, 1h
        int 	10h
        ret

kbwait: mov 	ax, 0000h
        int 	16h
        ret


m_cursr:mov 	ah, 02h
        mov 	dx, di  ; columna
        add     dx, 0d
        mov 	dh, 6d ; fila
        mov 	bh, 0h
        int 	10h
        ret

m_cursr1:mov 	ah, 02h
        mov 	dx, di  ; columna
        add     dx, 30d
        mov 	dh, 12d ; fila
        mov 	bh, 0h
        int 	10h
        ret

m_cursr2:mov 	ah, 02h
        mov 	dx, di  ; columna
        add     dx, 50d
        mov 	dh, 18d ; fila
        mov 	bh, 0h
        int 	10h
        ret

phrase:	mov 	di, 0d
lupi:	mov 	cl, [msg+di]
        call    m_cursr
        call 	w_char
        inc	    di
        cmp 	di, len
        jb	    lupi        
        mov 	di, 0d

lupi2:	mov 	cl, [msg2+di]
        call    m_cursr1
        call 	w_char
        inc	    di
        cmp 	di, len2
        jb	    lupi2        
        mov     di, 0d

lupi3:	mov 	cl, [msg3+di]
        call    m_cursr2
        call 	w_char
        inc	    di
        cmp 	di, len3
        jb  	lupi3
        ret


section .data1
msg	db 	"The more people I meet  "
len 	equ	$-msg

section .data2
msg2	db 	"the more "
len2 	equ	$-msg2

section .data3
msg3	db 	"I like my dog "
len3 	equ	$-msg3