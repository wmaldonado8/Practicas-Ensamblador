%macro imprimir
section .data
	msj db '*'
	new_line db 10,''
section .text
	global _start
_start:
	mov ebx,9  ;filas
	mov ecx,9  ;columnas
principal:
	push ebx
	cmp ebx,0
	jz salir   ;FILAS
	jmp asterisco
asterisco:
	dec ecx
	push ecx
	imprimir msj  ;el valor de ecx se reemplaza con ms='*'
	pop ecx
	cmp ecx,9
	jg asterisco ;el primer operando sea mayor q el segundo
	imprimir new_line
	pop ebx
	dec ebx
	jmp principal
salir:
	mov eax,1
	int 80h

