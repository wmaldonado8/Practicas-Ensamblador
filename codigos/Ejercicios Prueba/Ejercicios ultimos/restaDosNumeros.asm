section .data
	msj1 db 'La resta es: ', 0xA, 0xD
	len1 equ $-msj1
	msj2 db 'El segundo numero no puede al primero ', 0xA, 0xD
	len2 equ $-msj2
section .bss
	
	resultado resb 2

section .text
	global _start
_start:
	
	mov ax,5
	mov bx,3
	cmp ax,bx
	jg resta
	jmp error

resta:
	sub ax,bx
	add ax,'0'
	mov [resultado],ax
	jmp ResultadoResta


error:
	mov eax,4
	mov ebx,1
	mov ecx, msj2
	mov edx, len2
	int 80h

	jmp salir
ResultadoResta:
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h

	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado
	mov edx, 1
	int 80h

	jmp salir

salir:
	mov eax,1
	int 80h