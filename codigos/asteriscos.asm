section .data
	mensaje db  'Desplegar 10 estrellas'
	len equ $-mensaje
	estrellas times 8 db '*'
	
section .text
	
global _start
	
_start:
	;ESCRITURA DEL MENSAJE
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len
	int 80h

	;ESCRITURA DE LOS ASTERISCOS
	mov eax, 4
	mov ebx, 1
	mov ecx, estrellas
	mov edx, 8
	int 80h

	mov eax,1
	int 80h

