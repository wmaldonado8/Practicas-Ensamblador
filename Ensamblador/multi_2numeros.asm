section .data
	    msj1 db "El resulatado en Al: ", 0xA, 0xD
		len1 equ $ - msj1


		msj2 db "El resulatado en Ax: ", 0xA, 0xD
		len2 equ $ - msj2
		
		msj3 db "El resulatado en EAX: ", 0xA, 0xD
		len3 equ $ - msj3
		
		
section .bss
	resultado_Al resb 1 
	resultado_Ax resb 1 
	reultado_EAX resb 1
	
	
section .text	
	global _start
	
	

_start:
	mov al, 2 
	mov bl, 3 
	; multiplica a = al * bl
	mul bl 
	add al,'0'
	
	mov[resultado_Al], al 
	mov[resultado_Ax], ax 
	
	mov[reultado_EAX], eax 
	
	;****************Imprimir el Primer numero *******************
	
	mov eax, 4 
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h 
	
	mov eax, 4 
	mov ebx, 1
	mov ecx, resultado_Al
	mov edx, 1
	int 80h
	
	
	
	;****************Imprimir el segindo numero *******************
	
	mov eax, 4 
	mov ebx, 1
	mov ecx, msj2
	mov edx, len2
	int 80h 
	
	mov eax, 4 
	mov ebx, 1
	mov ecx, resultado_Ax
	mov edx, 1
	int 80h
	
	
	
	;********Imprimir el eax *****************
	mov eax, 4 
	mov ebx, 1
	mov ecx, msj3
	mov edx, len3
	int 80h 
	
	mov eax, 4 
	mov ebx, 1
	mov ecx, reultado_EAX 
	mov edx, 1
	int 80h
	
	mov eax, 1 
	int 80h
