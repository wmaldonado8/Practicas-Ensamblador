section .data
	msj4 db "El resultado en AL: ", 0xA, 0xD
	len4 equ $ -msj4

	msj5 db 0xA,0xD, "El resultado en AH: ", 0xA, 0xD
	len5 equ $ -msj5

	msj6 db 0xA,0xD, "El resultado en AX: ", 0xA, 0xD
	len6 equ $ -msj6
	
	msj2 db 'No se puede dividir para 0  ',0xA, 0xD
	len2 equ $-msj2
	msj3 db 'El divisor no puede ser mayor al dividendo  ',0xA, 0xD
	len3 equ $-msj3

	msjIngreso1 db 'Ingrese Dividendo', 0xA, 0xD
	lenIngreso1 equ $-msjIngreso1
	msjIngreso2 db 'Ingrese Divisor', 0xA, 0xD
	lenIngreso2 equ $-msjIngreso2

	
section .bss
	nIngresado1 resb 2
	nIngresado2 resb 2
	resultado_AL resb 2
	resultado_AH resb 2
	resultado_AX resb 2

section .text
	global _start
_start:
	
	jmp imprimir_numeros
	
guardarNumeros:

	mov eax,[nIngresado1]
	mov ebx,[nIngresado2]
	cmp eax,ebx
	jg Division
	jmp DivisorMayor


Division:
	mov eax, [nIngresado1]
	sub eax,'0'
	mov ebx, [nIngresado2]
	sub ebx,'0'

	div ebx
	add al,'0'
	add ah,'0'

	mov[resultado_AL], al
	mov[resultado_AH], ah
	mov[resultado_AX], eax
	
	jmp ResultadoDivision
	

DivisorMayor:
	mov eax,4
	mov ebx,1
	mov ecx, msj3
	mov edx, len3
	int 80h

	jmp salir

ResultadoDivision:
	mov eax,4
	mov ebx,1
	mov ecx, msj4
	mov edx, len4
	int 80h

	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado_AL
	mov edx, 1
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx, msj5
	mov edx, len5
	int 80h

	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado_AH
	mov edx, 1
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx, msj6
	mov edx, len6
	int 80h

	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado_AX
	mov edx, 1
	int 0x80

	jmp salir


salir:
	mov eax,1
	int 0x80



imprimir_numeros:
	;Imprimir Primer ingreso
	mov eax, 4
	mov ebx, 1
	mov ecx, msjIngreso1
	mov edx, lenIngreso1
	int 80h  ;Es una interrupcion del sistema que llama al kernel

	;Leer primer numero
	mov eax, 3
	mov ebx, 2 
	mov ecx, nIngresado1
	mov edx, 2 
	int 0x80

	;Imprimir Segundo ingreso
	mov eax, 4
	mov ebx, 1
	mov ecx, msjIngreso2
	mov edx, lenIngreso2
	int 80h  ;Es una interrupcion del sistema que llama al kernel

	;Leer segundo numero
	mov eax, 3
	mov ebx, 2 
	mov ecx, nIngresado2
	mov edx, 2 
	int 0x80

	jmp guardarNumeros