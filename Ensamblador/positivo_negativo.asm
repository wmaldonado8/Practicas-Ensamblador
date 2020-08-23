section .data 

msj_positivo db 'Es postivo'
len_positivo equ $-msj_positivo
msj_negativo db 'Es negativo'
len_negativo equ $ -msj_negativo

section .text 
	
		global _start
		
_start:

		mov ax, 10 
		sub ax, 20 
		js negativo
		jmp positivo 
		
negativo:
			mov eax,4 
			mov ebx,1 
			mov ecx,msj_negativo 
			mov edx,len_negativo 
			int 80h 
			jmp salir 
			
positivo:
			mov eax,4 
			mov ebx,2 
			mov ecx, msj_positivo
			mov edx, len_positivo
			int 80h
			jmp salir
			
salir:
			mov eax,1 
			int 80h 
