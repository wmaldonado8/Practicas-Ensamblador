section .data

	msj db 'sisa'
	len equ $ - msj
	

section .text

	global _start
	
_start:

	mov eax, 4 
	mov ebx, 1
	mov ecx, msj
	mov edx, len
	int 80h
	
	mov [msj], dword 'sisa '
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msj 
	mov edx, len
	int 80h
	
	mov eax,1 
	int 80h

	
