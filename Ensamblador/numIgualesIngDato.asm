section .data 
	msjInfo db 10 ,'COMPARACION SI SON IGUALES' ,10
	len_info equ $-msjInfo 
	msjNum1 db 'Ingrese el primer numero: '
	len_num1 equ $-msjNum1 
	msjNum2 db 'Ingrese el segundo numero: '
	len_num2 equ $-msjNum2
	msjNum3 db 'Ingrese el segundo numero: '
	len_num3 equ $-msjNum3
	
	msjResultado db 'Los numeros ingresados son iguale',0xA
	len_resultado equ $-msjResultado
	msjResultado1 db 'Los numeros ingresados NO son iguale ;)',0xA
	len_resultado1 equ $-msjResultado1
 
section .bss
	n1 resb 2
	n2 resb 2
	n3 resb 2
	resul resb 2 
	
section .text 

global _start

_start:
		mov eax, 4
		mov ebx, 2
		mov ecx, msjInfo
		mov edx,len_info
		int 80h

;*** Ingreso de los numeros y leido por teclado****
		mov eax, 4
		mov ebx, 2
		mov ecx, msjNum1
		mov edx,len_num1
		int 80h
		
		mov eax, 3
		mov ebx, 2
		mov ecx, n1 
		mov edx,2
		int 80h
		
		mov eax, 4
		mov ebx, 2
		mov ecx, msjNum2
		mov edx,len_num2
		int 80h
		
		mov eax, 3
		mov ebx, 2
		mov ecx, n2
		mov edx,2
		int 80h
		
		mov eax, 4
		mov ebx, 2
		mov ecx, msjNum3
		mov edx,len_num3
		int 80h
		
		mov eax, 3
		mov ebx, 2
		mov ecx, n3 
		mov edx,2
		int 80h	
;*******Procedimiento y comparacion *******
	mov ax,[n1]
	mov bx,[n2]
	mov cx,[n3]		
	sub al				
	jmp compara
	
compara:
		cmp ax,bx
		jz compara2
		jmp error

compara2:
		cmp ax,cx
		jz mensaje
		jmp error
		
mensaje:
			mov eax, 4
		    mov ebx, 2
		    mov ecx, msjResultado
		    mov edx,len_resultado
		    int 80h	
		    
		    mov eax, 4
		    mov ebx, 2
		    mov ecx, resul
		    mov edx,2
		    int 80h	
		    jmp salir 
		    
error:
		    mov eax, 4
		    mov ebx, 2
		    mov ecx, msjResultado1
		    mov edx,len_resultado1
		    int 80h	
		    
		    mov eax, 4
		    mov ebx, 2
		    mov ecx, resul
		    mov edx,2
		    int 80h	
		    jmp salir 
			
					
salir: 
			mov eax, 1
			int 80h 
