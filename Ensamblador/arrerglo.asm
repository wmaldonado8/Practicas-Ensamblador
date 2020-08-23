section .data
	msg1 db 'Ingrese 5 numeros y precione enter',0xA
	len equ $-msg1
	
	arreglo db 0,0,0,0,0
	len_arreglo equ $-arreglo

section .bss 
	dato resb 2 
	

section .text  
	
global _start 
_start:
		;se define el arreglo en lo
		mov esi, arreglo; indice fuente 
		mov edi, 0 ; indice destino
		
		mov eax, 4
		mov ebx,1
		mov ecx, msg1
		mov edx,len 
		int 0x80
		
		
leer:
		mov eax, 3
		mov ebx,0
		mov ecx, dato
		mov edx,2
		int 0x80
		
		mov al,[dato]
		sub al,'0' 	;se convierte  a decinal
		 
		mov [esi], al 
		
		add edi, 1 ; inc edi 
		add esi, 1
		
		cmp edi, len_arreglo
		jb leer 
		
		mov ecx, 0
		
	
imprimir:
		push ecx 
		mov al,[arreglo + ecx]
		add al,'0'
		mov [dato], al 	
		sub al,0
		
		mov eax, 4		
		mov ebx, 1
		mov ecx, dato
		mov edx, 2
		int 0x80
		
		pop ecx
		inc ecx
		cmp ecx, len_arreglo
		jb imprimir
				
salir:

	mov eax,1
	int 80h 
		 
		
