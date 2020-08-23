section .data
	msj1 db 'Perimetro',0xA,0xD
	len1 equ $-msj1
	msj2 db 'area',0xA,0xD
	len2 equ $-msj2
	msj3 db 'Es un cuadrado',0xA,0xD
	len3 equ $-msj3

	msjIngreso1 db 'Ingrese la base', 0xA, 0xD
	lenIngreso1 equ $-msjIngreso1
	msjIngreso2 db 'Ingrese la altura', 0xA, 0xD
	lenIngreso2 equ $-msjIngreso2
	
section .bss
	nIngresado1 resb 2
	nIngresado2 resb 2
	perimetro resb 2
	area resb 2
	areaFin resb 2

section .text
	global _start
_start:
	jmp imprimir_numeros

guardarNumeros:

	mov ax,[nIngresado1]
	mov bx,[nIngresado2]
	sub ax,bx
	jz cuadrado
	jmp rectangulo

rectangulo:
	mov ax,[nIngresado1]
	mov bx,[nIngresado2]
	mul bx
	add ax,'0'
	mov [areaFin],ax
	jmp perimetroCuadrado

cuadrado:
	
	mov al,[nIngresado1]
	mov bl,[nIngresado1]
	mul bl
	add al,'0'
	mov [areaFin],al
	jmp perimetroCuadrado

perimetroCuadrado:

	mov [perimetro], areaFin
	mov cl,2
	mul cl
	add perimetro,'0'

	mov [areaFin],perimetro

	jmp mensaje1
	


mensaje1:
	mov eax,4
	mov ebx,1
	mov ecx, msj3
	mov edx, len3
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, areaFin
	mov edx, 1
	int 80h

	
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, area
	mov edx, 1
	int 80h
	jmp salir

mensaje2:
	mov eax,4
	mov ebx,1
	mov ecx, msj2
	mov edx, len2
	int 80h
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