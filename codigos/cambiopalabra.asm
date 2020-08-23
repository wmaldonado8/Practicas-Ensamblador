section .data
	mensaje db  'Rene'
	len equ $-mensaje
	
section .text
	
global _start
	
_start:
	;ESCRITURA DEL MENSAJE
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len
	int 80h

	;VAMOS A DEFINIR UN MOVIMIENTO y con el dWORD DEFINIMOS QUE ES UNA PALABRA 
	mov [mensaje], dword'eneR'


	;ESCRITURA DEL MENSAJE
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len
	int 80h

	mov eax,1
	int 80h

