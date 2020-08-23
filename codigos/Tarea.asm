section .data
	msj1 db 'Ingresa un valor', 0xA,0xD ;Este mensaje se va repetir cuando 
	lenM equ $-msj1
	par db 'Numero par'
	len1 equ $ - par
	impar db 'NUmero Impar'
	len2 equ $ - impar
	leer equ  3
	imprimir equ 4

section .bss
	n1 resb 1
section .text

global _start
_start:
	jmp imprimir_msj1
	
	
	Proceso:
	mov eax, [n1]
	and eax,1
	jz mensaje_par 
	jmp mensaje_impar
	

		
	mensaje_par:
	jmp imprimir_msj1
	 
	salir:	
	mov eax, 1 
	int 80h 
	
	mensaje_impar: 
	jmp salir

	imprimir_msj1:
	mov eax,imprimir 
	mov ebx, 1
	mov ecx, msj1
	mov edx, lenM
	int 80h 
	jmp leer_n1
		
	leer_n1:
	mov eax, leer 
	mov ebx, 2
	mov ecx, n1	
	mov edx, 1
	int 80h
	jmp Proceso