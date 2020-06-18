org	100h

section	.text
	call	texto
	mov 	dx, msg
	call	w_strng
	xor 	si, si
	xor	    ax, ax 	
lupi:	call 	kb
        cmp 	al, "$"
        je	validar
        sub	al, 30h
        mov	[200h+si],al
        inc 	si
        jmp 	lupi

inicio:	call	texto
        
        mov	    dx, len1
        mov 	bx, msg1
		call 	w_strng2
        xor 	si, si
        xor	    ax, ax 
        jmp 	lupi
	
validar:	xor	ax, ax   
	cmp si, 5d 
	jne error
	mov	ax, [200h]
	add	ax, [201h]
	add	ax, [202h]
	add	ax, [203h]
	add	ax, [204h]
	mov	bl, 5d
	mov	ah, 00h
	div	bl
	mov	dx, len2
	mov	bx, msg2
	cmp	al, 1h
	je	w_strng1
	mov	dx, len3
	mov	bx, msg3
	cmp	al, 2h
	je	w_strng1
	mov	dx, len4
	mov	bx, msg4
	cmp	al, 3h
	je	w_strng1
	mov	dx, len5
	mov	bx, msg5
	cmp	al, 4h
	je	w_strng1
	mov	dx, len6
	mov	bx, msg6
	cmp	al, 5h
	je	w_strng1
	mov	dx, len7
	mov	bx, msg7
	cmp	al, 6h
	je	w_strng1
	mov	dx, len8
	mov	bx, msg8
	cmp	al, 7h
	je	w_strng1
	mov	dx, len9
	mov	bx, msg9
	cmp	al, 8h
	je	w_strng1
	mov	dx, len10
	mov	bx, msg10
	cmp	al, 9h
	je	w_strng1
	mov	dx, len11
	mov	bx, msg11
	cmp	al, 10h
	je	w_strng1

texto:	mov 	ah, 00h
		mov		al, 03h
		int 	10h
		ret


error:				
		jmp 	inicio	
		ret

w_strng1:mov	ah, 13h
        mov 	al, 01h 
        mov	    bp, bx
        mov 	bh, 00h 
        mov	    bl, 00111111b 
        mov	    cx, dx
        mov	    dl, 10h 
        mov	    dh, 10h	  
        int 	10h
        ret

w_strng2:mov	ah, 13h
        mov 	al, 01h 
        mov	    bp, bx
        mov 	bh, 00h 
        mov	    bl, 00001111b 
        mov	    cx, dx
        mov	    dl, 2h 
        mov	    dh, 2h	  
        int 	10h
        ret

w_strng:mov	ah, 09h
		int 	21h
		ret

kb: 	mov	ah, 1h
        int 	21h
        ret	

section	.data

msg 	db 	"Ingrese ultimos 5 digitos de su carne $"
len	    db 	 0xA, 0xD, "$"
msg1	db	"Ingrese 5 digitos "
len1	equ	$-msg1
msg2	db	"Solo necesito el 0"
len2	equ	$-msg2
msg3	db	"Aun se pasa"
len3	equ	$-msg3
msg4	db	"Hay salud"
len4	equ	$-msg4
msg5	db	"Me recupero"
len5	equ	$-msg5
msg6	db	"En el segundo"
len6	equ	$-msg6
msg7	db	"Peor es nada"
len7	equ	$-msg7
msg8	db	"Muy bien"
len8	equ	$-msg8
msg9	db	"Colocho"
len9	equ	$-msg9
msg10	db	"Siempre me esfuerzo"
len10	equ	$-msg10
msg11	db	"Perfecto solo Dios"
len11	equ	$-msg11