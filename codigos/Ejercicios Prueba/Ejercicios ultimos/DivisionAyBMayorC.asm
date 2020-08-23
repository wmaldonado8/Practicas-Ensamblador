section .data
	msj1 db ' 2+3 es igual a: ', 0xA, 0xD
	len1 equ $-msj1
	msj2 db '2*2 es igual a: ',0xA, 0xD
	len2 equ $-msj2
section .bss
	
	resultado resb 2
	resultado_AL resb 2


section .text
	global _start
_start:
	
	mov ax,8
	mov bx,5
	mov cx,2
	
	div bl
	add al,'0'
	add ah,'0'
	mov [resultado_AL],al
	jmp CompararC

CompararC:
	
	

igualC:
	mov cx,2
	mov dx,2
	mul dx
	add dx,'0'
	mov [resultado],dx
	jmp ResultadoIgual
	
NoigualC:
	mov cx,2
	mov dx,3
	add dx,cx
	add dx,'0'
	mov [resultado],dx
	jmp ResultadoNoIgual
	

ResultadoIgual:
	mov eax,4
	mov ebx,1
	mov ecx, msj2
	mov edx, len2
	int 80h

	mov eax, 4
	mov ebx, 1 
	mov ecx, resultado
	mov edx, 1
	int 0x80

	jmp salir

ResultadoNoIgual:
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