section .data 
msjInfo db 10 ,'OPERACIONES DE SUMA Y RESTA' ,10
	len_info equ $-msjInfo 
	msjNum1 db 'Ingrese el primer numero: '
	len_num1 equ $-msjNum1 
	msjNum2 db 'Ingrese el segundo numero: '
	len_num2 equ $-msjNum2
	
	msj1 db 'La suma es:', 0xA, 0xD
	len1 equ $-msj1
	msj2 db 'La resta es:', 0xA, 0xD
	len2 equ $-msj2
	msj3 db 'No realiza ninguna operacion', 0xA, 0xD
	len3 equ $-msj3
	
section .bss 
    n1 resb 2
	n2 resb 2
 respuesta resb 2

section .text

global _start

_start:

		mov eax, 4
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
		
;desarrollo 		
		
	 mov al, [n1]
	 mov bl, [n2]
	 sub al,'0'
	 sub bl,'0'
	 jmp Comparasuma
	 	 
Comparasuma:	
     cmp al,bl
	 jg realisaSuma 
	 jmp Compararesta 
	 
Compararesta:
     cmp al,bl
	 jl realisaResta 
	 jmp NumeroIgual
	 
	 
NumeroIgual:
     cmp al,bl
	 jz PresentaSalir 
	 jmp salir 
	 	 
;--------------------------------------
realisaResta:	   
	    sub al,bl
	    sub al,'0'
	    sub al,'0'
		add al, '0'
		mov [respuesta],al	
		jmp PresentaarResta
		 
	 
PresentaarResta:
        mov eax,4
		mov ebx,1
		mov ecx, msj2
		mov edx, len2
		int 80h
		
		mov eax,4 
		mov ebx,1
		mov ecx, respuesta
		mov edx, 2
		int 80h
		jmp salir 	 
;-------------------------------- 
realisaSuma:	   
	 add al,bl
	 add al, '0' 
	 mov [respuesta], al 
	 jmp MensajeSuma 
	
	 
MensajeSuma:
        mov eax,4
		mov ebx,1
		mov ecx, msj1
		mov edx, len1
		int 80h
		
		mov eax,4 
		mov ebx,1
		mov ecx, respuesta
		mov edx, 2
		int 80h
		
		jmp salir 	
;-----------------------------------------		
PresentaSalir:

		mov eax,4 
		mov ebx,2 
		mov ecx, msj3
		mov edx,len3
		int 80h
		
	 
salir:
		mov eax,1 
		int 80h 
	 
