;Analizar y comentar cada instrucción del ejercicio propuesto

 section .bss ; Seccion donde se define la variable 
   num resb 1 ; declaracion de una variable resb

	section .text ; contiene los codigos ejecutable 
global _start ; 

_start:
	mov ecx,10 ; Asiga 10 a ecx 
	mov eax, '1' ; le asigna 1 a eax 

l1: ; creacion de un proceso loop
	mov [num], eax	;Asigna el valor eax a num (Donde es el desplazamiento indirecto) 
	mov eax, 4		;imprime
	mov ebx, 1			
	push ecx	;Guarda el valor de ecx en la pila 

	mov ecx, num ; Mueve num a eax(Donde esta el mensaje a imprimir) 
	mov edx, 1 ;Es el mensaje que se imprimi 
	int 0x80  

	mov eax, [num] ; Asigna el valor de num a eax 
	sub eax, '0' ; se convierte la variable num a entero 
	inc eax ;incrementa eax 
	add eax, '0' ; Convierte a caracter 
	pop ecx ; Extrae en ecx el valor que hay en la pila  
	loop l1 ; Decrementa el ecx y manda a la etiqueta l1

		mov eax,1 ; Interrupcion 
		int 0x80
