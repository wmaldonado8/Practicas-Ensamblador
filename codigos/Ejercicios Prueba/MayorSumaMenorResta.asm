section .data
	msj1 db 'La suma es: ', 0xA, 0xD
	len1 equ $-msj1
	msj2 db 'La resta es: ',0xA, 0xD
	len2 equ $-msj2

	msjIngreso1 db 'Ingrese primer numero', 0xA, 0xD
	lenIngreso1 equ $-msjIngreso1
	msjIngreso2 db 'Ingrese segundo numero', 0xA, 0xD
	lenIngreso2 equ $-msjIngreso2

	
section .bss
	nIngresado1 resb 2
	nIngresado2 resb 2
	resultado resb 2

section .text
	global _start
_start:
	
	jmp imprimir_numeros
	
guardarNumeros:

	mov ax,[nIngresado1]
	mov bx,[nIngresado2]
	cmp ax,bx
	jg resta
	jmp suma


suma:
	mov eax, [nIngresado1]
	sub eax,'0'
	mov ebx, [nIngresado2]
	sub ebx,'0'
	add eax, ebx
	add eax,'0'
	mov [resultado],eax
	jmp ResultadoSuma
	

resta:
	mov eax, [nIngresado1]
	sub eax,'0'
	mov ebx, [nIngresado2]
	sub ebx,'0'
	sub eax, ebx
	add eax,'0'
	mov [resultado],eax
	jmp ResultadoResta

ResultadoSuma:
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h

	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado
	mov edx, 1
	int 0x80

	jmp salir

ResultadoResta:
	mov eax,4
	mov ebx,1
	mov ecx, msj2
	mov edx, len2
	int 80h

	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado
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