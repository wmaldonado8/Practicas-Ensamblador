section .data
	msj db 'Primer valor mayor', 0xA
	len equ $-msj
	msj1 db 'Segundo valor mayor', 0xD
	len1 equ $-msj1
	msj2 db 'Tercer valor mayor', 0xB
	len2 equ $-msj2
	
	
section .text
		global _start
		
		
_start:
		jmp proceso

proceso:
	mov ax,8
	mov bx, 1
	cmp ax,bx
	jg comparacionAX
	jmp comparacionBX
	
comparacionAX:
	mov cx,2
	cmp ax,cx
	jg mensaje1
	jmp comparacionCX
	
comparacionBX:
	mov cx,2 
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
	mov ecx,msj
	mov edx, len
	int 80h
	jmp salir
	
mensaje2:
	mov eax, 4
	mov ebx, 1
	mov ecx,msj1
	mov edx, len1
	int 80h
	jmp salir
	
mensaje3:
	mov eax, 4
	mov ebx, 1
	mov ecx,msj2
	mov edx, len2
	int 80h
	jmp salir
	
salir: 
	mov eax, 1
	int 80h
