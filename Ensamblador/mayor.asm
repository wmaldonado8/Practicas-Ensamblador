;Sacar el numero mayo (saca A mayor a B)
section .data 
	msj1 db 'A es mayor a B',0xA ,0xD 
	len1 equ $-msj1
	msj2 db 'A no es mayor a B', 0xA, 0xB
	len2 equ $-msj2
	
section .bss 
	respuesta resb 2 
	
section .text 

global _start

_start:

	mov ax, 4
	mov bx,2 
	cmp ax, bx 
	jg mensaje1
	jmp error
	
mensaje1:
		
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
