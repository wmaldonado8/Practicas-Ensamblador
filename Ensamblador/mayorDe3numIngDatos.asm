section .data
	msjInfo db 10 ,'COMPARACION DE 3 NUMEROS INGRESADOS, CUAL ES EL MAYOR' ,10
	len_info equ $-msjInfo 
	msjNum1 db 'Ingrese el primer numero: '
	len_num1 equ $-msjNum1 
	msjNum2 db 'Ingrese el segundo numero: '
	len_num2 equ $-msjNum2
	msjNum3 db 'Ingrese el segundo numero: '
	len_num3 equ $-msjNum3

	msjRes1 db 'Primer valor mayor', 0xA
	len_res1 equ $-msjRes1
	msjRes2 db 'Segundo valor mayor', 0xD
	len_res2 equ $-msjRes2
	msjRes3 db 'Tercer valor mayor', 0xD
	len_res3 equ $-msjRes3
	
section .bss 

	n1 resb 2
	n2 resb 2
	n3 resb 2
	resul resb 2 
	
section .text
		global _start
		
	
_start:
		mov eax, 4
		mov ebx, 2
		mov ecx, msjInfo
		mov edx,len_info
		int 80h

;*** Ingreso de los numeros y leido por teclado****
		mov eax, 4
		mov ebx, 2
		mov ecx, msjNum1
		mov edx,len_num1
		int 80h
		
		mov eax, 3
		mov ebx, 2
		mov ecx, n1 
		mov edx,2
		int 80h
		
		mov eax, 4
		mov ebx, 2
		mov ecx, msjNum2
		mov edx,len_num2
		int 80h
		
		mov eax, 3
		mov ebx, 2
		mov ecx, n2
		mov edx,2
		int 80h
		
		mov eax, 4
		mov ebx, 2
		mov ecx, msjNum3
		mov edx,len_num3
		int 80h
		
		mov eax, 3
		mov ebx, 2
		mov ecx, n3 
		mov edx,2
		int 80h	
;*******Procedimiento y comparacion *******
		mov al,[n1]
		mov bl,[n2]
		mov cl,[n3]	
		
		cmp al,bl
		jg comparacionAX
		comparacionBX
		jmp proceso
;------primera comparacion		

proceso:
	cmp ax,bx
	jg comparacionAX
	jmp comparacionBX
	
comparacionAX:
	cmp ax,cx
	jg mensaje1
	jmp comparacionCX
	
comparacionBX:
	cmp bx,cx
	jg mensaje2
	jmp comparacionCX
	
comparacionCX:
		cmp cx,bx
		jg mensaje3
		jmp comparacionBX
	
mensaje1:
	mov eax, 4
	mov ebx, 1
	mov ecx,msjRes1
	mov edx, len_res1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx,resul
	mov edx, 2
	int 80h
	jmp salir
	
mensaje2:
	mov eax, 4
	mov ebx, 1
	mov ecx,msjRes2
	mov edx, len_res2
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx,resul
	mov edx, 2
	int 80h
	jmp salir
	
mensaje3:
	mov eax, 4
	mov ebx, 1
	mov ecx,msjRes3
	mov edx, len_res3
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx,resul
	mov edx, 2
	int 80h
	jmp salir
	
salir: 
	mov eax, 1
	int 80h

