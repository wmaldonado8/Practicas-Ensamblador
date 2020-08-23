section .data
	msj1 db 'Primer valor mayor', 0xA, 0xD
	len1 equ $-msj1
	msj2 db 'Segundo mayor',0xA, 0xD
	len2 equ $-msj2
	

section .text
	global _start
_start:
	mov ax,7
	mov bx,6
	jmp proceso

proceso: 
	cmp ax,bx
	jg mensaje1
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
	int 80h