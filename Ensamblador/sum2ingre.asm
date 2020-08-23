section .data 

	msj1 db 'Ingrese # 1 ', 0xA
	len1 equ $-msj1 
	msj2 db 'Ingrese # 2 ', 0xA
	len2 equ $-msj2
	msj3 db 'RESULTADO', 0xA
	len3 equ $-msj3	
	
	salto db '', 0xA
	tam equ $-salto

; definicion de variables constantes de las variables 

	imprimir equ 4
	leer equ 3
	salir equ 1

section .bss

	n1 resb 1
	n2 resb 1
	r  resb 1

section .text 

	global _start
	
_start:

;********** Mostrar mensaje ****

	mov eax, imprimir
	mov ebx, 1
	mov ecx, msj1
	mov ebx, len1  
	int 80h 

; **********Leer numero*************
		mov eax, leer 
		mov ebx,  2
		mov ecx, n1
		mov ebx, 2
		int 80h 
		
;***********Imprimir el mensaje 2*****
	mov eax, imprimir
	mov ebx, 1
	mov ecx, msj2
	mov ebx, len2
	int 80h
;***********Imprimir n2 *****
	mov eax, leer
	mov ebx, 2
	mov ecx, n2
	mov edx, 1
	int 80h
	
	mov eax, [1]
	sub eax, '0'; transforma de una cadena a un entero 
	
	mov ebx,[2]
	sub ebx, '0' ;transforma de cadena a digito 
	
	add eax, ebx 
	add eax, '0' 
	mov [r], eax
	

; *********** imprimir msj 3

		mov eax, imprimir  
		mov ebx, 1 
		mov ecx, msj3
		mov edx, len3 
		int 80h
		
; ************ Imprimir ***********
			mov eax , imprimir
			mov ebx, 1
			mov ecx, r
			mov edx, 1
			int 80h 
			
;****************** salir *******
			mov eax, salir
			
			int 80h
			
	
		
		
	
		
