section .data
	msj1 db 'Par ', 0xA, 0xD
	len1 equ $-msj1
	msj2 db 'impar ',0xA, 0xD
	len2 equ $-msj2
section .bss
	
	resultado resb 2

section .text
	global _start
_start:
	
	mov ax,4
	and ax,1
	jz Par
	jmp Impar
	

Par:
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h

	jmp salir

Impar:
	mov eax,4
	mov ebx,1
	mov ecx, msj2
	mov edx, len2
	int 80h

	jmp salir

salir:
	mov eax,1
	int 0x80