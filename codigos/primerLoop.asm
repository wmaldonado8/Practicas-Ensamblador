section .data
	msj1 db "Hola ", 0xA, 0xD
	len1 equ $ -msj1
section .bss
	num resb 1
section .text
	global _start

_start: 
	mov cx,10
	mov eax ,'1'
	jmp numeros

numeros:
	mov[num],eax
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 80h

	mov eax,[num]
	sub eax,'0'
	inc eax
	add eax,'0'
	;dec ecx

	cmp eax,'9'
	jz salir
	loop numeros
	

salir: 
	mov eax,1
	int 80h