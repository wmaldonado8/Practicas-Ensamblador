section .data
	mensaje db'Ingrese un numero',0xA, 0xD; decorar para enter
	tamano equ $-mensaje
	mostrar db 'El numero ingresado es ', 0xA, 0xD;este decorador sirve para dar enter
	tamano_mostrar equ $-mostrar

section .bss
	numero resb 5 ;asi se declara una variable, primero el nombre luego RESB y luego el numero de bites

section .text
		global _start
_start:
	;********escritura**********
	mov eax, 4
	mov ebx,1 ;es el imprimirir
	mov ecx, mensaje
	mov edx, tamano
	int 80h

	;*************lectura************

	mov eax, 3 ;invoca a la subrutina de lectura
	mov ebx, 2
	mov ecx, numero
	mov edx, 5
	int 80h

	;********escritura**********
	mov eax, 4
	mov ebx,1 ;es el imprimirir
	mov ecx, mostrar
	mov edx, tamano_mostrar
	int 80h
	;********escritura**********
	mov eax, 4
	mov ebx,1 ;es el imprimirir
	mov ecx, numero
	mov edx, tamano_mostrar
	int 80h


	;********salida**********
	mov eax, 1;para retornar el control
	int 80h
