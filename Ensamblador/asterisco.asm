section .data 

		mensaje db 'Desplegar diez estrellas'
		len equ $-mensaje
		estrellas times 10 db '*'
section .text 

global _start 

_start:
 	;***********Escritura del mensaje ********
	mov eax,4
	mov ebx,1
	mov ecx, mensaje
	mov edx, len 
	int 80h 
	;*********** escritura de las estrellas*******
 	mov eax,4
	mov ebx,1
	mov ecx, estrellas
	mov edx, 10
	int 80h 


	mov eax,1
	int 80h 



