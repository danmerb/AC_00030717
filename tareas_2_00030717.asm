   org 100h
; Ejercicio 3 


		mov     AX, 0d
		mov     [220h], AX
		mov     AX, 1d
		mov     [221h],AX
		mov     BX, 1d
		mov     DL, 1d


lupi:  
		INC     DL
		INC     BX
		mov     AX, [220h+bx-1]
		mov     CX, [220h+bx-2]
		add     AX, CX    
		mov     [220h+bx], ax    
		cmp     BX, 16d
		jb     lupi


; Ejercicio 2 
		mov ax, 0000h
		mov bx, 0000h
		mov cx, 0000h
		mov cx, 2d
		mov ax, 4d
		mov bx, 0d
		mov [210h], ax

fir:    INC bx
        mul cx
        mov [bx+ 210h], ax
        CMP ax, 0XFF
        jb fir

sec:    INC bx
        mul cx
        mov [bx+ 210h], ax
        CMP bx, 12d
        jb sec

; Ejercicio 1
; 00030717
;promedio 3

        MOV	    AX, 3d
	    MOV	    BX, 0d
	    ADD	    AX, BX
	    MOV	    BX, 7d
        ADD	    AX, BX
        MOV	    BX, 1d
        ADD	    AX, BX
        MOV	    BX, 7d
        ADD	    AX, BX

	    mov 	DX, 0000h
	    mov 	BX, 5h 
	    div	    BX
	    mov 	[220h], AX       


section .data
comnt         db      'Hay Salud' 
msglen        equ     $-comnt

section .text 
		mov di, 0d
		mov cx, [msglen]
    
mensaje: mov bl, [comnt+di]
		mov [di+200h], bl
		inc di 
		loop mensaje 

		int 20h