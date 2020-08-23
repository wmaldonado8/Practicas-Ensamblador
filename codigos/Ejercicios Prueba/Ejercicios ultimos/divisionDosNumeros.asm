section .data
	msj1 db 'La cociente es: ', 0xA, 0xD
	len1 equ $-msj1
	msj2 db 'La residuo es: ', 0xA, 0xD
	len2 equ $-msj2
	
section .bss
	
	resultado_al resb 2
	resultado_ah resb 2


section .text
	global _start
_start:
	
	mov ax,7
	mov bx,3
	div bl
	add al,'0'
	add ah,'0'
	mov [resultado_ah],ah
	mov [resultado_al],al
	jmp ResultadoDivision


ResultadoDivision:
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h

	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado_al
	mov edx, 1
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx, msj2
	mov edx, len2
	int 80h

	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado_ah
	mov edx, 1
	int 0x80

	jmp salir

salir:
	mov eax,1
	int 0x80