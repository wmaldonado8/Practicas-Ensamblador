section .data
	saludo db 10,'hola',10
	len_saludo equ $-saludo
section .bss
	mostrar resb 1
section .txt
	global _start
_start:
	mov ecx,9
for:

	push ecx
	add ecx,'0'  ;convertir a numero el valor de ecx
	mov [mostrar],ecx
	mov eax,4
	mov ebx,1
	mov ecx,saludo
	mov edx,len_saludo
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,mostrar
	mov edx,1
	
	int 80h
	pop ecx
	loop for
salir:
	mov eax,1
	int 80h
