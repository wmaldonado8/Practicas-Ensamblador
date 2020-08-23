section .data 
	msj1 db'Se activa jz = 1', 0xA
	len1 equ $-msj1
	msj2 db "Se activo jz = 0", 0xA
	len2 equ $-msj2
	
	n1 db '3'
	n2 db '4'
	
section .bss

section .text

	global _start 
	
start_:

		mov eax,[n1]
		mov ebx,[n2]
		mov ecx, ebx
		cmp edx, ebx 
		jz men1 
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
		
		
	
	
	
 
