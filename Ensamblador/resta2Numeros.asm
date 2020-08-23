section .data
	msj1 db 'El resultado de la resta es:', 0xA, 0xD
	len1 equ $-msj1 
	
	msj2 db 'No se puede restar un numero menor a un numero mayor', 0xA, 0xD
	len2 equ $-msj2 
section .bss 
resultado resb 2
	
section .text 


global _start

_start:

	mov ax, 7
	mov bx, 5
	cmp ax,bx
	jg Restar
	jmp esMenor
	
Restar:
		sub ax,bx
		add ax, '0'
		mov [resultado],ax	
		jmp PresentaarResta
		
		
		
PresentaarResta:
			mov eax,4 
			mov ebx,1 
			mov ecx, msj1
			mov edx,len1
			int 80h
			
			mov eax,4
			mov ebx,1 
			mov ecx, resultado
			mov edx,1
			int 80h

esMenor:
		mov eax, 4 
		mov ebx, 1 
		mov ecx, msj2
		mov edx, len2 
		int 80h 

salir:
	  mov eax,1
	  int 80h
	  
	 


