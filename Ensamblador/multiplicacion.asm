section .data;aqui se definen las constantes
		multiplicacion db 'La multiplicacion de 2*3 es:', 0xA, 0xD
		tamano equ $ -multiplicacion
section .bss
		resultado resb 1 ;para crear una variable se pone el nombre el RESB y el numero de bits
section .text
		global _start

_start:
		; *********************MOSTRAR MENSAJE***************
		mov eax, 4
		mov ebx, 1
		mov ecx, multiplicacion
		mov edx, tamano
		int 80h
		;**********proceso de multiplicacion****************
		mov eax, 2
		mov ebx, 3
		mul ebx ; 
		add eax, '0' ;el caraccter '0' significa que es un concatenador de cadenas
		mov [resultado], eax;se mueve el valor de eax a la direccion especifica de resultado
		;cuando tenemos una operacion no debemos poner el int80h 

		; *********************IMPRIMIR LA MULTIPLICACION***************
		mov eax, 4
		mov ebx, 1
		mov ecx, resultado
		mov edx, 1
		int 80h
		;**********salir*************
		mov eax, 1
		int 80h