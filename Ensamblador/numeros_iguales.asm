section .data
	msj1 db 'Son iguales', 0xA
	len1 equ $-msj1
	msj2 db 'No son iguales', 0xA
    len2 equ $-msj2
    
    
section .text

		global _start
		
_start:

	mov ax, 7
	mov bx, 7
	mov cx, 7
	jmp proceso
	
proceso:
	cmp ax, bx
	jz siguiente
	jmp mensaje2
	
siguiente:
	cmp ax, cx
	jz mensaje1
	jmp mensaje2
	
mensaje1:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h
	jmp salir

mensaje2:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj2
	mov edx, len2
	int 80h
	jmp salir
	
salir:
		mov eax, 1
		int 80h






;-----------------------------------------------
;section .data 
;	msj1 db 'Primer valor', 0xDx
;	len equ $- msj1
;	msj2 db 'Primer valor', 0xDx
;	len equ $- msj2
;	msj3 db 'Primer valor', 0xDx
;	len equ $- msj3
	

;section .txt 

;   globsl _start
   
;_start:
;		mov ax, 7
;		mov bx, 7
;		mov cx, 7
;		j o proceso 
	
;proceso: 
;		cmp ax, bx 
;		jg comparacionAx
;		jmp comparacionBx
		
;comparacionAx:
;			cmp ax, cx
;			jg mensaje1
						
;comparacionBx:
;		cmp bx,cx 
;		jg mensaje3
;		jmp mensaje3
		
;mensaje1:
;		mov eax,4 
;		mov ebx,1 
;		mov ecx, msj1
;		mov edx, len1
;		int 80h
;		jmp salir 
		
;mensaje2:
;		mov eax,4 
;		mov ebx,1 
;		mov ecx, msj2
;		mov edx, len2
;		int 80h
;		jmp salir	
		
;mensaje3:
;		mov eax,4 
;		mov ebx,1 
;		mov ecx, msj3
;		mov edx, len3
;		int 80h
;		jmp salir	
		
;salir:
;		mov eax, 4 
;		int 80h
		
		
				

   
