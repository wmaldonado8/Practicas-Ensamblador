;A igual a B
section .data 
	msj1 db 'A es igual a B', 0xA, 0xD
	len1 equ $- msj1
	
	msj2 db 'A NO es igual a B', 0xA, 0xD
	len2 equ $- msj1
	
section .bss 

respuesta resb 2
section .text 

global _start
_start:
	mov ax,7
	mov bx, 5
	cmp ax,bx 
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
	
