section .data 
	msjInfo db 10 ,'DETERMINAR SI EL NUMERO INGRESADO ES PRIMO O NO ' ,10
	len_info equ $-msjInfo 
	msjNum1 db 'Ingrese el numero del 1 al 5: '
	len_num1 equ $-msjNum1 
	
	msjPrimo db 'El numero ingresado es primo. '
	len_primo equ $-msjPrimo
	
	msjResultado2 db 'El numero ingresado no es primo. '
	len_resultado2 equ $-msjResultado2
	
 
section .bss
	n1 resb 2
	resul resb 2 
	opcion resb 2
	
section .text 

global _start

_start:

		mov eax, 4
	    mov ebx, 1
	    mov ecx, msjInfo
	    mov edx, len_info
	    int 80h 

;*** Ingreso de los numeros y leido por teclado****

	    mov eax, 4
	    mov ebx, 1
	    mov ecx, msjNum1
	    mov edx, len_num1
	    int 80h 
	    
	    mov eax, 3
	    mov ebx, 2
	    mov ecx, n1
	    mov edx, 2
	    int 80h 
	    
;*****Operacion ****

	    mov eax, 4
	    mov ebx, 1
	    mov ecx, n1
	    mov edx, 2
	    int 80h 

		mov al,[n1]
		mov bl,2
		sub al,'0'
		mov al,1
		
		
			 
		cmp al, 1
		jz  primo
		
		cmp al,2
		jz primo
		jmp salir 
		
		cmp al,3
		jz primo
		
		cmp al ,4
		jz MsjError
		
		cmp al ,5 
		jz primo
		
primo:	
		mov al,[n1] 
		mov bl,2
		sub al,'0' 
		sub bl,'0' 
		div bl 
		add al,'0' 
		
		
	   
		mov eax, 4
	    mov ebx, 1
	    mov ecx, msjPrimo
	    mov edx, len_primo
	    int 80h 
	    
	    mov eax, 4
	    mov ebx, 1
	    mov ecx, resul
	    mov edx, 2
	    int 80h 
	    
	    
MsjError:

		mov eax, 4
	    mov ebx, 1
	    mov ecx, msjResultado2
	    mov edx, msjResultado2
	    int 80h 
	    
	    mov eax, 4
	    mov ebx, 1
	    mov ecx, opcion
	    mov edx, 2
	    int 80h 

salir:
		mov eax,1
		int 80h 	
	

	
