section .data
    msjTitulo db 10, '*******Suma de 5 numeros ********',10,0xA
	len_Titulo equ $-msjTitulo
	
	msj1 db 'Ingrese 5 numeros y presione enter',0xA
	len1 equ $-msj1

	arreglo db 0,0,0,0,0
	len_arreglo equ $-arreglo
	
	 msjResul db 'La suma es = ' 
	len_resul equ $-msjResul
	
section .bss
	suma resb 2
	
	
section .text
	global _start

_start:

        mov eax, 4
		mov ebx,1
		mov ecx, msjTitulo
		mov edx,len_Titulo
		int 0x80
;********se define el arreglo en los registros  ********************
		
	mov esi,arreglo		;indice de fuente
	mov edi,0			;indice de destino


	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h
;***********Leer el arreglo*********
leer:
	mov eax,3
	mov ebx,0
	mov ecx,suma
	mov edx,2
	int 80h

	mov al, [suma]
	sub al,'0'			; se convierte cadena a decimal

	mov [esi],al		

	add edi,1			;se incrementa en 1 edi
	add esi,1			;se increemnta en 1 esi

	cmp edi,len_arreglo
	jb leer 			;jb se activa(cuando el carry se activa)



	mov ecx, 0	
	mov al,0
	add al,'0'
	mov [suma],al


imprimir:

	push ecx
	mov al, [arreglo + ecx]
	add al, '0'
	sub al,'0'
	add [suma],al
	
	   
	pop ecx
	inc ecx
	cmp ecx, len_arreglo
	jb imprimir
	
	mov  eax, 4
	mov  ebx,1
	mov ecx, msjResul
	mov edx,len_resul
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 2
	int 80h

salir:
	mov eax,1
	mov ebx,1
	int 80h
