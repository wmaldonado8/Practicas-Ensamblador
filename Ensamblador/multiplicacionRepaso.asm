section .data 
	msj1 db 'La multiplicacion es: ',0xA,0xD
	len1 equ $-msj1  

section .bss 

respuesta resb 2

section .text
global _start

_start:
 
	mov ax, 3
	mov bx, 2
	mul bx
	add ax, '0' 
	mov[respuesta],ax
	
	mov eax,4 
	mov ebx,1 
	mov ecx, msj1
	mov edx, len1
	int 80h
	
	mov eax, 4 
	mov ebx,1
	mov ecx, respuesta
	mov edx, 2
	int 80h
	jmp salir 
	
salir:
		mov eax,1 
		int 80h
	
