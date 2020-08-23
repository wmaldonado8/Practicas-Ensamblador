section .data;aqui se definen las constantes
		msj1 db "El resultado en AL: ", 0xA, 0xD
		len1 equ $ -msj1

		msj2 db 0xA,0xD, "El resultado en AX: ", 0xA, 0xD
		len2 equ $ -msj2

		msj3 db 0xA,0xD, "El resultado en EAX: ", 0xA, 0xD
		len3 equ $ -msj3
section .bss
		resultado_AL resb 1 ;para crear una variable se pone el nombre el RESB y el numero de bits
		resultado_AX resb 1 ;para crear una variable se pone el nombre el RESB y el numero de bits
		resultado_EAX resb 1;

section .text
		global _start

_start:
		
		mov al, 2
		mov bl, 3

		mul bl   ;se esta multiplicando al= al*bl porque solo hay un operando osea no se pone ,
		add al,'0'

		mov[resultado_AL], al
		mov[resultado_AX], ax
		mov[resultado_EAX], eax



		mov eax,4 
		mov ebx,1
		mov ecx, msj1
		mov edx, len1
		int 80h

		mov eax, 4
		mov ebx, 1
		mov ecx, resultado_AL
		mov edx, 1
		int 80h

		mov eax,4 
		mov ebx,1
		mov ecx, msj2
		mov edx, len2
		int 80h

		mov eax, 4
		mov ebx, 1
		mov ecx, resultado_AX
		mov edx, 1
		int 80h

		mov eax, 4
		mov ebx, 1
		mov ecx, msj3
		mov edx, len3
		int 80h

		mov eax, 4
		mov ebx, 1
		mov ecx, resultado_EAX
		mov edx, 1
		int 80h

		mov eax,1 
		int 80h


