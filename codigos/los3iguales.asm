section .data
	msj1 db 'Son iguales',0xA,0xD
	len1 equ $-msj1
	msj2 db 'No son iguales',0xA,0xD
	len2 equ $-msj2
section .text
	global _start
_start:
	mov ax,7
	mov bx,7
	mov cx,7
	jmp proceso

proceso: 
	cmp ax,bx
	jz comparacionAx
	jmp mensaje2

comparacionAx:
	cmp ax,cx
	jz mensaje1
	jmp mensaje2


mensaje1:
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h
	jmp salir

mensaje2:
	mov eax,4
	mov ebx,1
	mov ecx, msj2
	mov edx, len2
	int 80h
	jmp salir

salir:
	mov eax,1
	int 0x80