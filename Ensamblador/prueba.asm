section .data

		iguales db 'iguales',0xA,0xD
		len_iguales equ $-iguales
		msj_mayor db 'mayor',0xA,0xD
		len_mayor equ $-msj_mayor
		msj_menor db 'menor',0xA,0xD
		len_menor equ $-msj_menor
		ingresar db 'Ingresar Opcion',0xA,0xD
		len_imp equ $-ingresar
		menu_com1 db '1. Numero Mayor',0xA,0xD
		leng_com1 equ $-menu_com1
		menu_com2 db '2. Numero menor',0xA,0xD
		leng_com2 equ $-menu_com2
		menu_com3 db '3. valores iguales',0xA,0xD
		leng_com3 equ $-menu_com3
		
section .bss
		opcion resb 5
		numero1 resb 5
		numero2 resb 5
		numero3 resb 5
		numero4 resb 5
		numero5 resb 5
		aux resb 5
		
section .text
		global _start
		
_start:
		jmp menu

menu:
	
	mov eax, 4
	mov ebx, 1
	mov ecx, menu_com1
	mov edx, leng_com1
	int 80h
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, menu_com2
	mov edx, leng_com2
	int 80h
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, menu_com3
	mov edx, leng_com3
	int 80h
	jmp Opcion
	
Opcion:
	mov eax, 4
	mov ebx, 1
	mov ecx, ingresar
	mov edx, len_imp
	int 80h
	
	mov eax, 3
	mov ebx, 2
	mov ecx, opcion
	mov edx, 5
	int 80h
	jmp comparacion_opcion
	
comparacion_opcion:
	mov ah, [opcion]
	sub ah, '0'
	
	cmp ah, 1
	jz comparacion1
	
	cmp ah, 2
	jz comparacion2
	
	cmp ah, 3
	jz comparacion3
	
	jmp mensaje

mensaje:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, len_msj
	int 80h
	jmp salir

comparacion1:
	mov eax, 4
	mov ebx, 1
	mov ecx, menu_com1
	mov edx, leng_com1
	int 80h
	
	mov al,4
	sub al, '0'
	mov ah, 6
	sub ah, '0'
	mov bl, 1
	sub bl, '0'
	mov bh, 8
	sub bh, '0'
	mov cl, 6
	sub cl, '0'
	cmp al, ah
	jg mayor
	
mayor:
	cmp al, bl
	jg mayor1
	

mayor1:
	cmp al, bh
	jg mayor2

mayor2:
	cmp al, cl
	jg imprimir

imprimir:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_mayor
	mov edx, len_mayor
	int 80h
	
	;sub al,'0'
	add al,'0'
	mov [numero1], al
	mov eax, 4
	mov ebx, 1
	mov ecx, numero1
	mov edx, 1
	int 80h
	jmp salir

comparacion2:
	mov eax, 4
	mov ebx, 1
	mov ecx, menu_com2
	mov edx, leng_com2
	int 80h
	


comparacion3:
	mov eax, 4
	mov ebx, 1
	mov ecx, menu_com3
	mov edx, leng_com3
	int 80h

salir:
	mov eax, 1
	int 0x80
