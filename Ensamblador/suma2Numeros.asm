section .data 
	msj1 db 'La suma es: ',0xA,0xD
	len1 equ $-msj1
	

section .bss
	resultado resb 2; (para guardar el resultado)el resb2 es el tamano de la variable resultado 

	section .text
	 
	 global _start
	 
_start:
	 mov ax, 3; ax es de 8 bits 
	 mov bx, 6; 
	 add ax,bx
	 add ax, '0' ; siempre las variables se gusrdan origen(AX)
	 mov [resultado], ax 
	 jmp mensaje 
	 
mensaje:
; solo presenta el mensaje nada mas 
		mov eax, 4
		mov ebx,1
		mov ecx, msj1
		mov ebx, len1
		int 80h
		
		;PARA PRESENTAR EL RESULTADO 
		mov eax,4 
		mov ebx,1
		mov ecx, resultado
		mov edx, 1
		int 80h
		jmp salir 
salir:
		mov eax,1
		int 80h
		
		
		
		
		
	 
	

		
	
	


