global _start

section .text ;este es el segmento de cogido,  es una directiva


_start:
	mov eax, 4 ;aqui se le dice que son operaciones de salida, 4 escritura
	mov ebx, 1 ;el 1 es salida
	mov ecx, numero
	mov edx, tamano
	int 80h

	mov eax,1
	mov ebx,0
	int 80h

section .data				; segmento de datos
	numero: dw 85 			;etiqueta, capacidad
	tamano: equ $-numero            ;es una directiva apra definir constantes





