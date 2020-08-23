section .data
    msj_asterisco db '*',10
    len equ $-msj_asterisco
    
    nueva_linea db 10,''
	len_linea equ $-nueva_linea
	
section .bss
 
section .text
	global _start

_start:
		
		mov ecx,20 
		mov ebx,20

l1: 
		push ecx   ;se envia la referencia de ecx a pila 	
		mov ebx,ecx 
		push ebx	
		call imprimir_enter
		
		
		pop ebx 
		mov ecx, ebx 
		push ebx
		
l2:


		push ecx 
		call imprimir_asterisco
		pop ecx 
		loop l2
		;***************************l1 
		pop ecx 
		pop ebx 
		;mov ecx,ebx 
		
		loop l1		; se decrementa ecx en 1 
		
		mov eax, 1
		int 80h
		
imprimir_asterisco:
		
		mov eax,4
		mov ebx,1
		mov ecx,  msj_asterisco  
		mov edx, 1
		int 80h 
		ret 
		
imprimir_enter:
		
		mov eax,4
		mov ebx,1
		mov ecx, nueva_linea
		mov edx, len_linea
		int 80h 
		ret 

