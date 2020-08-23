section .data;aqui se definen las constantes
		decremento db 'El decremento de 4 es:', 0xA, 0xD
		tamano equ $ -decremento
section .bss
		resultado resb 1 ;para crear una variable se pone el nombre el RESB y el numero de bits
section .text
		global _start

_start:
		; *********************MOSTRAR MENSAJE***************
		mov eax, 4
		mov ebx, 1
		mov ecx, decremento 
		mov edx, tamano
		int 80h
		;**********proceso de Incremento****************
		mov eax, 4
		dec eax 
		add eax, '0'
		mov [resultado], eax;se mueve el valor de eax a la direccion especifica de resultado
		;cuando tenemos una operacion no debemos poner el int80h 

		; *********************Imprecion del Incremento***************
		mov eax, 4
		mov ecx, resultado
		mov edx, 1
		int 80h
		;**********salir*************
		mov eax, 1
		int 80h