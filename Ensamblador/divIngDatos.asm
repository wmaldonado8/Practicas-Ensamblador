section .data 
	msjInfo db 10 ,'DIVICION' ,10
	len_info equ $-msjInfo 
	msjNum1 db 'Ingrese el primer numero para dividir: '
	len_num1 equ $-msjNum1 
	msjNum2 db 'Ingrese el segundo numero para dividir: '
	len_num2 equ $-msjNum2
	msjResultado db 'La resta es: ',0xA
	len_resultado equ $-msjResultado
 
section .bss
	n1 resb 2
	n2 resb 2
	resul resb 2 
	
section .text 

global _start

_start:

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
	   ;ingresar numero 2 
	    mov eax, 4
	    mov ebx, 1
	    mov ecx, msjNum2
	    mov edx, len_num2
	    int 80h 
	    
	    mov eax, 3
	    mov ebx, 2
	    mov ecx, n2
	    mov edx, 2
	    int 80h 
;***** Para realizar la operacion ******

		mov al,[n1]
		mov bl,[n2]
		sub al,'0'
		sub bl,'0'
		div bl 
		add al,'0'
		mov [resul],al 
		
		mov eax, 4
		mov ebx,1
		mov ecx, msjResultado
		mov edx,len_resultado
		int 80h
		
		mov eax, 4
		mov ebx,1
		mov ecx, resul
		mov edx,2
		int 80h
		
salir: 
		mov eax, 1
		int 80h 
		
