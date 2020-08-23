section .data
    msjTitulo db 10, '*******Presentar el numero el Mayor********',10,0xA
	len_Titulo equ $-msjTitulo
	
	msj1 db 'Ingrese 5 numeros y precione enter',0xA
	len equ $-msj1
	
	arreglo db 0,0,0,0,0
	len_arreglo equ $-arreglo
	
	msjResul db 'El Mayor es: ',0xA
	len_resul equ $-msjResul

	msjResul1 db 'El Mayor es: ',0xA
	len_resul1 equ $-msjResul1

section .bss 
	dato resb 2 
	dato1 resb 2
	

section .text  
	
global _start 
_start:

        mov eax, 4
		mov ebx,1
		mov ecx, msjTitulo
		mov edx,len_Titulo
		int 0x80
		
		;se define el arreglo en lo
		mov esi, arreglo; indice fuente 
		mov edi, 0 ; indice destino
		
		mov eax, 4
		mov ebx,1
		mov ecx, msj1
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
		mov bl, 0 ; se registra el numero mayor 		
	
comparacion:
		mov al, [arreglo + ecx ]
		cmp al, bl 
		jb contador
		mov bl, al 
contador:	
		inc ecx 
		cmp ecx, len_arreglo
		jb comparacion
		
		mov ecx, 0
		mov bl, [arreglo + ecx ] ; se registra el numero menor	
		
		
		
		mov ecx, 0
		mov dl, [arreglo + ecx ] ; se registra el numero menor	
	
comparacion:
		mov al, [arreglo + ecx ]
		cmp dl, al
		jb contador
		mov dl, al 
		
contador:	
		inc ecx 
		cmp ecx, len_arreglo
		jb comparacion
		
		
		
imprimir:

		add bl , '0'
		mov [dato],bl
		add dl , '0'
		mov [dato1],dl
		
		mov  eax, 4
		mov  ebx,1
		mov ecx, msjResul
		mov edx,len_resul
		int 80h
			
		mov eax, 4
		mov ebx,1
		mov ecx, dato 
		mov edx,2
		int 80h	
		
		
		mov  eax, 4
		mov  ebx,1
		mov ecx, msjResul1
		mov edx,len_resul1
		int 80h
			
		mov eax, 4
		mov ebx,1
		mov ecx, dato1 
		mov edx,2
		int 80h	
			
				
salir:

	mov eax,1
	int 80h 
		 
		
