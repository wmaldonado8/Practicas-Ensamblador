section .data
	a db "Ingrese valor de a: ", 10
	leng_a equ $ -a
	b db "Ingrese valor de b: ", 10
	leng_b equ $ -b
	presentar_resta db 10,"La resta es: ",10
	leng_presentar_resta equ $ -presentar_resta

section .bss
	dato_a resb 10
	dato_b resb 10
	resta resb 10
	

section .text
	global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, a
	mov edx, leng_a
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, dato_a
	mov edx, 2;da la siguiente linea a leeer
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, b
	mov edx, leng_b
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, dato_b
	mov edx, 2
	int 80H
	;----------------------------------------------------------
	mov al, [dato_a]
	sub al, '0'
	mov bl, [dato_b]
	sub bl, '0'
	div bl
	add al, '0'
	add ah, '0'

	;mov ebx, aL
	;add ebx,'0';convierte el numero a cadena
	mov [cociente], al
	mov [residuo], ah

	mov[presentar_suma+4], dword 'divi'; 
	
	;-----------------------------------------------------------
	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_resta
	mov edx, leng_presentar_resta
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, resta
	mov edx, 1
	int 80H
	
	mov eax,1
	int 80H

