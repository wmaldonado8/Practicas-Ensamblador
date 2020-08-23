section .data

	msj_asterisco db ' * '
	len_asterisco equ $-msj_asterisco	
	
	msj_salto db 10,' '
	len_salto equ $-msj_salto
	
	
section .bss 
	
section .text
	global _start
	
_start:

	mov ecx, 20
	mov ebx, 1
	
	
	
for_1:
		push ecx 
		mov ecx, ebx ; se envia la referencia de ecx a pila 	
		push ecx
			
		call imprimir_enter	; llama al mesaje imprimir 
		
		pop ecx
		mov ebx, ecx
		push ebx
		
for_2:
		push ecx 
		call imprimir_asterisco	
		pop ecx
		loop for_2 ; va repetir mientras el registro ecx sea igual a 0 
	    ;-----Fin l1------
		
		pop ebx
		pop ecx
		inc ebx
		loop for_1 ;se decrementa ecx en 1 
	
		mov eax,1
		int 80h

;************ presenta en pantalla el mensaje(*) ***********	

imprimir_asterisco:
		mov eax, 4
		mov ebx, 1
		mov ecx, msj_asterisco
		mov edx, len_asterisco
		int 80h
		ret
	
;************ presenta en pantalla el mensaje(del espacio) ***********
	
imprimir_enter:
		mov eax, 4
		mov ebx, 1
		mov ecx, msj_salto
		mov edx, len_salto
		int 80h
		ret
		
	
