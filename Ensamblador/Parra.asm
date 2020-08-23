section .data 
	msj1 db 'La suma es:', 0xA, 0xD
	len1 equ $-msj1
	
	msj2 db 'La resta es:', 0xA, 0xD
	len2 equ $-msj2
	
	msj3 db 'No realiza ninguna operacion', 0xA, 0xD
	len3 equ $-msj2
	
section .bss 
 respuesta resb 2

section .text

global _start

_start:
	 mov ax, 2
	 mov bx, 5
	 jmp Comparasuma
	 	 
Comparasuma:	
     cmp ax,bx
	 jg realisaSuma 
	 jmp Compararesta 
	 
Compararesta:
     cmp ax,bx
	 jl realisaResta 
	 jmp NumeroIgual
	 
	 
NumeroIgual:
     cmp ax,bx
	 jz PresentaSalir 
	 jmp salir 
	 	 
;--------------------------------------
realisaResta:	   
	    sub ax,bx
		add ax, '0'
		mov [respuesta],ax	
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
	 add ax,bx
	 add ax, '0' 
	 mov [respuesta], ax 
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
		mov ebx,1 
		mov ecx, msj3
		mov edx,len3
		int 80h
		jmp salir
	 
salir:
		mov eax,1 
		int 80h 
	 
