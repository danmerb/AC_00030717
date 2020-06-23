  
org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h
	xor 	di, di   



lupa:	mov 	cx, 100d ;columna
        add	    cx, di	 
        mov	    dx, 10d ;fila
        call 	pixel
        inc 	di
        cmp 	di, 120d ;C220
        jne 	lupa
       

	    xor 	di, di 
        	     
lupb:	mov 	cx, 100d ;columna 100
        mov	    dx, 10d ;fila 10
        add	    dx, di 
        call 	pixel
        inc 	di
        cmp 	di, 30d ; F40
        jne 	lupb

        xor 	di, di 

lupc:	mov 	cx, 100d ;columna
        add	    cx, di	 
        mov	    dx, 40d ;fila
        call 	pixel
        inc 	di
        cmp 	di, 45d; C145;
        jne 	lupc       

	    xor 	di, di 

lupd:	mov 	cx, 145d  ;columna
        mov	    dx, 40d  ;40
        add	    dx, di 
        call 	pixel
        inc 	di
        cmp 	di, 100d ;F140
        jne 	lupd

        xor 	di, di 

lupe:	mov 	cx, 90d ;columna
        add	    cx, di	 
        mov	    dx, 140d ;fila
        call 	pixel
        inc 	di
        cmp 	di, 55d ;c145
        jne 	lupe
       

	    xor 	di, di 
lupf:	mov 	cx, 90d  ;columna
        mov	    dx, 100d  ;fila
        add	    dx, di 
        call 	pixel
        inc 	di
        cmp 	di, 40d ;F140
        jne 	lupf

        xor 	di, di 

lupg:	mov 	cx, 60d ;columna
        add	    cx, di	 
        mov	    dx, 100d ;fila
        call 	pixel
        inc 	di
        cmp 	di, 30d ;c90
        jne 	lupg

	    xor 	di, di 

luph:	mov 	cx, 60d  ;columna
        mov	    dx, 100d  ;fila
        add	    dx, di 
        call 	pixel
        inc 	di
        cmp 	di, 70d ;F170
        jne 	luph

        xor 	di, di 
 
lupi:	mov 	cx, 60d ;columna
        add	    cx, di	 
        mov	    dx, 170d ;fila
        call 	pixel
        inc 	di
        cmp 	di, 115d ;C175
        jne 	lupi

        xor 	di, di 

lupj:	mov 	cx, 175d  ;columna
        mov	    dx, 40d  ;fila
        add	    dx, di 
        call 	pixel
        inc 	di
        cmp 	di, 130d ;F170
        jne 	lupj
        
        xor 	di, di 
 
lupk:	mov 	cx, 175d ;columna
        add	    cx, di	 
        mov	    dx, 40d ;fila
        call 	pixel
        inc 	di
        cmp 	di, 45d ;C220
        jne 	lupk
        
        xor 	di, di 

lupl:	mov 	cx, 220d  ;columna
        mov	    dx, 10d  ;fila
        add	    dx, di 
        call 	pixel
        inc 	di
        cmp 	di, 30d ;F40
        jne 	lupl
        call 	kb	 ; Utilizamos espera de alguna tecla

        int 	20h



grafico:mov	ah, 00h
        mov	al, 13h
        int 	10h
        ret

pixel:	mov	ah, 0Ch
        mov	al, 1011b
        int 	10h
        ret

kb: 	mov	ah, 00h
        int 	16h
        ret

section .data