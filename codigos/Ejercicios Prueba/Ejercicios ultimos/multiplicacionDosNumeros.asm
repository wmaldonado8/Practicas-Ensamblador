section .data
	msj1 db 'La multiplicacion es: ', 0xA, 0xD
	len1 equ $-msj1
	
section .bss
	
	resultado resb 2

section .text
	global _start
_start:
	
	mov ax,2
	mov bx,3
	mul bx
	add ax,'0'
	mov [resultado],ax
	jmp ResultadoMultiplicacion


ResultadoMultiplicacion:
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h

	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado
	mov edx, 1
	int 0x80

	jmp salir

salir:
	mov eax,1
	int 0x80