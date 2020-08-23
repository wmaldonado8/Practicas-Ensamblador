section .data
	msj1 db 'Ingrese # 1', 0xA , 0xD  ;Los db pueden cambiar pero los valores EQU no cambian
	len1 equ $-msj1
	
	msj2 db 'Ingrese # 2', 0xA , 0xD
	len2 equ $-msj2
	
	msj3 db 'Resultado: '
	len3 equ $-msj3

	imprimir equ 4
	leer equ 3
	salir equ 1
section .bss
	n1 resb 2    ;1 es un byte de memoria
	n2 resb 2
	r resb 2
section .text
	global _start

_start:
	
	;Imprimir el mensaje 1
	mov eax, imprimir
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 0x80  ;Es una interrupcion del sistema que llama al kernel

	;Leer numero 1
	mov eax, leer
	mov ebx, 2 
	mov ecx, n1
	mov edx, 2 
	int 0x80

	;Imprimir segundo mendaje 2 
	mov eax, imprimir     ;funcion
	mov ebx, 1  		  ;Parametro
	mov ecx, msj2		  ;Dato
	mov edx, len2		  ;tamaño
	int 0x80

	;Leer numero 2
	mov eax, leer
	mov ebx, 2
	mov ecx, n2
	mov edx, 2
	int 0x80

	;suma
	mov eax, [n1]
	sub eax,'0'		; transforma de caneda en digito
	mov ebx, [n2]
	sub ebx,'0'


	add eax, ebx
	add eax,'0'		;transforma de un digito a una cadena

	mov [r],eax     ;ponemos la posicion real en R con los corchetes para mover eax en R

	;Imprimir tercer mensaje

	mov eax, imprimir
	mov ebx,  1
	mov ecx, msj3
	mov edx, len3
	int 0x80

	
	mov eax, imprimir
	mov ebx, 1 
	mov ecx, r
	mov edx, 1
	int 0x80



	mov eax, salir
	int 0x80
