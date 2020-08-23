section .data
	msj1 db 'A es mayor: ', 0xA, 0xD
	len1 equ $-msj1
	msj2 db 'B es mayor: ',0xA, 0xD
	len2 equ $-msj2
section .bss
	
	resultado resb 2

section .text
	global _start
_start:
	
	mov ax,9
	mov bx,8
	cmp ax,bx
	jg aMayor
	jmp bMayor

aMayor:
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h

	jmp salir

bMayor:
	mov eax,4
	mov ebx,1
	mov ecx, msj2
	mov edx, len2
	int 80h

	jmp salir

salir:
	mov eax,1
	int 0x80