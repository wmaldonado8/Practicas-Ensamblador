section .data
	msj1 db 'Cuadrado',0xA,0xD
	len1 equ $-msj1
	msj2 db 'Rectangulo',0xA,0xD
	len2 equ $-msj2
	msj3 db 'Area',0xA,0xD
	len3 equ $-msj3
	msj4 db 'Perimetro',0xA,0xD
	len4 equ $-msj4
		
section .bss
	perimetro resb 1
	area resb 1


section .text
	global _start
_start:

	mov al, 1
	mov bl, 2

	cmp al,bl
	jz Cuadrado
	jmp Rectangulo

Cuadrado:
	;vamos a presentar mensjae cuadrado
	mov cl,2
	mul cl
	add al,'0'
	mov [area],al
	sub al,'0'
	mul bl
	add al,'0'
	mov [perimetro],al ;el resultado se guarda en la parte baja
	int 80h

	mov eax, 4
	mov ebx,2
	mov ecx,msj1
	mov edx,len1
	int 80h

	mov eax, 4
	mov ebx,2
	mov ecx,msj3
	mov edx,len3
	int 80h	

	mov eax, 4
	mov ebx,2
	mov ecx, area
	mov edx,1
	int 80h

	mov eax, 4
	mov ebx,2
	mov ecx,msj4
	mov edx,len4
	int 80h

	mov eax,4 
	mov ebx,2
	mov ecx,perimetro
	mov edx,1
	int 80h

	
	jmp salir


Rectangulo:
;vamos a presentar mensjae RECTANGULO
	mov dl,4
	mul dl
	add al,'0'
	mov [perimetro],al ;el resultado se guarda en la parte baja
	int 80h
	jmp Area

Area:

	mov al,bl
	mul bl
	mov al,'0'
	mov [area],al
	int 80h


	mov eax, 4
	mov ebx,2
	mov ecx,msj2
	mov edx,len2
	int 80h

	mov eax, 4
	mov ebx,2
	mov ecx,msj3
	mov edx,len3
	int 80h	

	mov eax, 4
	mov ebx,2
	mov ecx, area
	mov edx,1
	int 80h

	mov eax, 4
	mov ebx,2
	mov ecx,msj4
	mov edx,len4
	int 80h

	mov eax,4 
	mov ebx,2
	mov ecx,perimetro
	mov edx,1
	int 80h

	
	jmp salir

salir:
	mov eax,1
	int 80h