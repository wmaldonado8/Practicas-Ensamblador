section .data
 	mensaje db 'Ingrese un numero', 0xA,0xD ; decorador para entere 
	tamano equ $ -mensaje 
	mostrar db 'El numero ingresado es: ', 0xA,0xD
	tamano_mostrar equ $-mostrar
	

section .bss
	numero resb 5 

section .txt 
	global _start 


_start: 
	;********** Escritura ********
	mov eax, 4 
	mov ebx, 1
	mov ecx, mensaje 
	mov edx, tamano 
	int 80h 
	
	;********** Lectura ********
	mov eax, 3  ; invoca a la subrutina de lectura 
	mov ebx, 2
	mov ecx, numero 
	mov edx, 5  
	int 80h 

	
	;********** Escritura ********
	mov eax, 4 
	mov ebx, 1
	mov ecx, mostrar 
	mov edx, tamano_mostrar 
	int 80h
 
	;********** Escritura ********
	mov eax, 4 
	mov ebx, 1
	mov ecx, numero
	mov edx, 5
	int 80h 


	;**********Salida******
	mov eax,1 
	int 80h 



