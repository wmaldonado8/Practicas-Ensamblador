section .data
	msj1 db 'El cociente es: ',0xA,0xB,0XD
	len1 equ $-msj1
	msj2 db 'El residuo es: ',0xA, 0xD 
	len2 equ $-msj2
	msj3 db 'No se puede dividir(el dividendo no puede ser menor al divisor): ',0xA, 0xD 
	len3 equ $-msj3
section .bss 

respuesta_Al resb 5
respuesta_Ax resb 5 

section .text 

global _start

_start:

	mov al,4
	mov bl,1
	cmp al,bl 
	jg respuesta
	jmp error
	
respuesta:	
	
	div bl 
	add al,'0'
	add ah,'0'
	mov [respuesta_Al],al
	mov [respuesta_Ax],ah
	jmp presentarMensaje
	
presentarMensaje:	
	    mov eax, 4
		mov ebx, 1
		mov ecx, msj1
		mov edx, len1
		int 80h

	    mov eax, 4
		mov ebx, 1
		mov ecx, respuesta_Al
		mov edx, 5
		int 80h
		
		mov eax, 4
		mov ebx, 1
		mov ecx, msj2
		mov edx, len2
		int 80h

	    mov eax, 4
		mov ebx, 1
		mov ecx, respuesta_Ax
		mov edx, 5
		int 80h
		jmp salir
		
error:
		

	    mov eax, 4
		mov ebx, 1
		mov ecx, msj3
		mov edx, len3
		int 80h
		
salir:		
		
		mov eax, 1
		int 80h
