section .data 
	msj1 db'Se activa jp= 1', 0xA
	len1 equ $-msj1
	msj2 db "No se activo jp = 0", 0xA
	len2 equ $-msj2
	
	n1 db '3' 0opo
	n2 db '1'
	
section .bss

section .text

	global _start
	
_start:

		mov eax,[n1]
		mov ebx,[n2]
		mov ecx, ebx
		cmp edx, ebx 
		jp men1 
		jmp men2 
		
 men1: 
	mov eax,4
	mov ebx, 1 
	mov ecx, msj1
	mov edx, len1
	int 80h 
	jmp salir 
	
	
men2:
	mov eax,4
	mov ebx, 1 
	mov ecx, msj2
	mov edx, len2
	int 80h 
	jmp salir
	
salir:
		mov eax,1 
		int 80h 

