; comparar si tres numeros son iguales 
section .data 
	msj1 db 'Los tres numeros son iguales',0xA,0xD
	len1 equ $-msj1 
	
	msj2 db 'Los tres numeros NO son iguales',0xA,0xD
	len2 equ $-msj2 
	
section .dss
section .text 

global _start


_start:


	mov ax,2
	mov bx,2
	mov cx,5
	jmp compara
	
compara:
		cmp ax,bx
		jz compara2
		jmp error

compara2:
		cmp ax,cx
		jz mensaje
		jmp error
		
 
mensaje:
		
		
		mov eax,4 
		mov ebx,1 
		mov ecx, msj1
		mov edx,len1
		int 80h
		jmp salir
		
error:
		mov eax,4 
		mov ebx,1 
		mov ecx, msj2
		mov edx,len2
		int 80h
		jmp salir
		
salir:
	   mov eax,1
	   int 80h
