section .data
	msj1 db 'Ingrese un numero ', 0xA
	leng equ $-msj
	par db 'Numero par'
	len1 equ $- par
	impar db 'Numero impar'
	len2 equ $-impar
	
	
section .bss
	n1 resb 5
section .text

		global _start

_start:
	; imprimir el mesaje 1 
	mov eax, 4 
	mov ebx, 1 
	mov ecx, msj1
	mov edx, len
	; **********Leer numero*************
		mov eax, 3 
		mov ebx,  2
		mov ecx, n1f
		mov ebx, 2
		int 80h 

	
	
	mov eax, [n1]
	and ax,1 
	jz mensaje_par
	mov eax, 4 
	mov ebx, 1
	mov ecx, imprimir
	mov edx, len2
	int 80h
	call salir 
	
	
mensaje_par:
	mov eax, 4 
	mov ebx,1 
	mov ecx, par 
	mov edx, len1
	int 80h 
	call salir 
	
salir:
		mov eax,1 
		int 0x80
