section .data
	msj1 db 'Ingresa un valor', 0xA ;se pone , y otro 'valor'
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
	; imprimir msj1
	mov eax,imprimir 
	mov ebx, 1
	mov ecx, msj1
	mov edx, lenM
	int 80h 

	;leer n1
	mov eax, leer 
	mov ebx, 2
	mov ecx, n1	
	mov edx, 1
	int 80h

	mov eax, [n1]
	and eax,1
	jz mensaje_par 
	mov eax, 4
	mov ebx, 1
	mov ecx, impar 
	mov edx, len2
	int 80h 
	
	mov eax, 1 
	int 80h 
		
	mensaje_par:
	mov eax, 4
	mov ebx, 1
	mov ecx, par 
	mov edx, len1
	int 80h 
	
	mov eax, 1 
	int 80h 
	
