section .data;aqui se definen las constantes
		suma db 'La suma de 4+3 es:', 0xA, 0xD
		tamano equ $ -suma
section .bss
		resultado resb 1 ;para crear una variable se pone el nombre el RESB y el numero de bits
section .text
		global _start

_start:
		; **********************MOSTRAR MENSAJE****************
		mov eax, 4
		mov ebx, 1
		mov ecx, suma
		mov edx, tamano
		int 80h
		;*************lectura************

		mov eax, 3 ;invoca a la subrutina de lectura
		mov ebx, 2
		mov ecx, numero
		mov edx, 5
		int 80h

		;**********proceso de suma****************
		mov eax,[]
		mov eax, eax
		add eax, eax ; en eax se almacena el valor de 7
		add eax, '0' ;el caraccter '0' significa que es un concatenador de cadenas
		mov [resultado], eax;se mueve el valor de eax a la direccion especifica de resultado
		;cuando tenemos una operacion no debemos poner el int80h 

		; **********************IMPRIMIR LA SUMA****************
		mov eax, 4
		mov ebx, 1
		mov ecx, resultado
		mov edx, 1
		int 80h
		;**********salir*************
		mov eax, 1
		int 80h