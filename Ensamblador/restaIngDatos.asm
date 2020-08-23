section .data 
	msjInfo db 10 ,'RESTA DE DOS NUMEROS' ,10
	len_info equ $-msjInfo 
	msjNum1 db 'Ingrese el primer numero a restar: '
	len_num1 equ $-msjNum1 
	msjNum2 db 'Ingrese el segundo numero a restar: '
	len_num2 equ $-msjNum2
	msjResultado db 'La resta es: '
	len_resultado equ $-msjResultado
	msjError db 'los numeros ingresados No se puede restar(nos se puede restar un numero menor al mayor) '
	len_error equ $-msjError
 
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
;***** Para realizar la operacion y comparacion si el primer numero es mair al segundo ******
		;realiza la comparacion 
	   mov al, [n1]	
	   mov bl, [n2]
	   sub al, '0'
	   sub bl ,'0'
	   cmp al,bl
	   jg RealizaResta
	   jmp EsMenor 
	   
RealizaResta:	   
	   sub al,bl 
	   add al,'0'
	   mov [resul], al 
	   
	   mov eax, 4
	   mov ebx, 1
	   mov ecx, msjResultado
	   mov edx, len_resultado
	   int 80h 
	   
	   mov eax, 4
	   mov ebx, 1
	   mov ecx, resul
	   mov edx, 2
	   int 80h
	   jmp salir
	   
EsMenor:
	   mov eax, 4
	   mov ebx, 1
	   mov ecx, msjError
	   mov edx, len_error
	   int 80h 
	   
	   mov eax, 4
	   mov ebx, 1
	   mov ecx, resul
	   mov edx, 2
	   int 80h
 
 salir: 
	mov eax, 1
	int 80h 
	
	   
		
