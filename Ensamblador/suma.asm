section .data
	suma db 'La suma de 4+3 es:', 0xA,0xD
	tamano equ $ - suma 

section .bss
	resultado resb 1

section .texte 

	global _start 	

_start:

	;*******Mostrar mensaje************

	mov eax, 4
	mov ebx, 1 
	mov ecx, suma 
	mov edx, tamano
	int 80h

	;*******Proceso de la suma************

	mov eax, 3
	mov ebx, 4
	add eax, ebx		; en eax se almacenan el valor de 7 
	add eax, '0'		;significa que es un concatenador de cadenas  
	mov [resultado], eax	;se mueve el valor de eax a la direccion especifica de resultado

	;*******Imprimir la suma************
	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado 
	mov edx, 1
	int 80h	

	;*******Salida************

	mov eax, 1
	int 80h

