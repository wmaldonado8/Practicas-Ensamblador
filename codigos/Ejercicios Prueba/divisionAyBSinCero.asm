section .data
	msj1 db 'resultado',0xA,0xD
	len1 equ $-msj1
	msj2 db 'la division no puede ser para cero',0xA,0xD
	len2 equ $-msj2
	msj3 db 'La division entre 9/2 es: ',0xA,0xD
	len3 equ $-msj3
	
section .bss
	resultado_AL resb 1
	resultado_AH resb 1

section .text
	global _start
_start:
	
	mov al, 9
	mov bl, 2
	mov cx,0
	cmp ax,bx
	jg mayor
	jmp menor

mayor:
	cmp cx,bx
	jz cero
	jmp dividir

dividir:
	div bl
	;add eax, '0'
	add al,'0'
	add ah,'0'
	mov [resultado_AL],al
	mov [resultado_AH],ah
	
	jmp resultado

cero:
	mov eax,4
	mov ebx,1
	mov ecx, msj2
	mov edx, len2
	int 80h
	jmp salir

resultado:
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, resultado_AL
	mov edx, 1
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, resultado_AH
	mov edx, 1
	int 80h
	jmp salir
	
menor:

	mov eax,4
	mov ebx,1
	mov ecx, msj3
	mov edx, len3
	int 80h
	jmp salir
	



salir:
	mov eax,1
	int 80h