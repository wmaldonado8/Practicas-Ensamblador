section .data 

	msjTitulo db 10,'CALCULADORA BASICA',10 ;el 10 es el decador es un (enter/salto de linea)
	len_titulo equ $-msjTitulo
	
	msgNumero1 db 10,'Ingrese el #1= ' ,10
	len_numero1 equ $-msgNumero1
	
	msgNumero2 db 10,'Ingrese el #2= ' ,10
	len_numero2 equ $-msgNumero2
	
	msgSuma db '1. SUMA ' ,10
	len_suma equ $-msgSuma
	msgResta db '2. RESTA' ,10
	len_resta equ $-msgResta
	msgMultiplicacion db '3. MULTIPLICACION ' ,10
	len_multiplicacion equ $-msgMultiplicacion
	msgDivision db '4. DIVISION ' ,10
	len_division equ $-msgDivision
	
	msgSalir db '5. Salir ' ,10
	len_salir equ $-msgSalir
	
	msgOpcion db ' Seleccione la opcion ' ,10
	len_opcion equ $-msgOpcion
	
	msgResultado db 10,' El resultado es:  ' ,10
	len_resultado equ $-msgResultado
	

section .bss 

	n1 resb 2
	n2 resb 2
	resul resb 1
	opcion resb 1

section .text 

	global _start
_start:
	mov eax,4
	mov ebx,2 
	mov ecx, msjTitulo
	mov edx,len_titulo
	int 80h

;------Ingresar N1 		
	mov eax,4 
	mov ebx,2 
	mov ecx, msgNumero1
	mov edx,len_numero1
	int 80h 

	mov eax,3
	mov ebx,2 
	mov ecx, n1
	mov edx, 2
	int 80h 
;------Ingresar N2 
    mov eax,4 
	mov ebx,2 
	mov ecx, msgNumero2
	mov edx,len_numero2
	int 80h 
	
	mov eax,3
	mov ebx,2 
	mov ecx, n2
	mov edx, 2
	int 80h
;****MENU CALCULADORA 
    mov eax,4
	mov ebx,2 
	mov ecx, msgSuma
	mov edx,len_suma
	int 80h
	
	mov eax,4
	mov ebx,2 
	mov ecx, msgResta
	mov edx,len_resta
	int 80h
	
	mov eax,4
	mov ebx,2 
	mov ecx, msgMultiplicacion
	mov edx,len_multiplicacion
	int 80h
	
	mov eax,4
	mov ebx,2 
	mov ecx, msgDivision
	mov edx,len_division
	int 80h
	
	mov eax,4
	mov ebx,2 
	mov ecx, msgSalir
	mov edx,len_salir
	int 80h
	
	mov eax,4
	mov ebx,2 
	mov ecx, msgOpcion
	mov edx,len_opcion
	int 80h
;***** OPCION *** Para seleccionar la opccion 

	mov eax,3
	mov ebx,2
	mov ecx, opcion
	mov edx, 1
	int 80h

		mov ah,[opcion]
		sub ah, '0' ; transforma de cade a numero 
		
		cmp ah, 1 ;compara si el numero ingresado es 1 
		je suma ; 
		
		cmp ah,2 
		je resta 
		
		cmp ah ,3 
		je multiplicacion
		
		cmp ah ,4
		je division
		
		cmp ah ,5 
		je saliendo
;***** PARA REALIZAR LA OPERACION 

suma:
	   mov al,[n1]
	   mov bl,[n2]
	   sub al,'0';convierte de digito
	   sub bl,'0'
	   add al,bl
	   add al,'0'; convierte a entero 
	   mov [resul], al
	   
	   mov eax, 4 
	   mov ebx,2 
	   mov ecx, msgResultado
	   mov edx, len_resultado
	   int 80h  
	   
	   mov eax, 4 
	   mov ebx,2 
	   mov ecx, resul
	   mov edx, 2
	   int 80h  
	   jmp salir
	   
resta:
	   mov al,[n1]
	   mov bl,[n2]
	   sub al,'0';convierte de digito
	   sub bl,'0'
	   sub al,bl
	   add al,'0'; convierte a entero 
	   mov [resul],al
	   
	   mov eax, 4 
	   mov ebx,2 
	   mov ecx, msgResultado
	   mov edx, len_resultado
	   int 80h  
	   
	   mov eax, 4 
	   mov ebx,2 
	   mov ecx, resul
	   mov edx, 1
	   int 80h  
	   jmp salir
	 
multiplicacion:
	   mov al,[n1]
	   mov bl,[n2]
	   sub al,'0';convierte de digito
	   sub bl,'0'
	   mul bl
	   add al,'0'; convierte a entero 
	   mov [resul] ,al
	   
	   mov eax, 4 
	   mov ebx,2 
	   mov ecx, msgResultado
	   mov edx, len_resultado
	   int 80h  
	   
	   mov eax, 4 
	   mov ebx,2 
	   mov ecx, resul
	   mov edx, 1
	   int 80h  
	   jmp salir	
division:

	mov al,[n1] ;guarda el numero
	mov bl,[n2] ;guarda el numero
	sub al,'0' ;convierte a cadena
	sub bl,'0' ;convierte a cadena
	mov dx, 0 ; limpia el registro
	mov ah, 0 ; limpia el registro
	div bl ;realiza la rmultiplicacion, guarda la respuesta en al
	add al,'0' ; convierte a cadena
	mov [resul],al ; guarda la respuesta en la variable resultado
	   
	   mov eax, 4 
	   mov ebx,2 
	   mov ecx, msgResultado
	   mov edx, len_resultado
	   int 80h  
	   
	   mov eax, 4 
	   mov ebx,2 
	   mov ecx, resul
	   mov edx, 1
	   int 80h  
	   jmp salir
	   
saliendo:
	  mov eax,4 
	  mov ebx, 1
	  mov ecx, msgSalir
	  mov edx, len_salir
	  jmp salir 		

salir:

	mov eax, 1 
	int 80h 
