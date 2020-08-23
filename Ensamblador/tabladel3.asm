%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
section .data
	msj1 db '*'
	len_msj1 equ $-msj1
	
	msj2 db '='
	len_msj2 equ $-msj2
	
	nueva_linea db 10,''
	len_nueva_linea equ $-nueva_linea
section .bss
	a resb 2
	b resb 2
	c resb 2
section .text
	global _start
_start:
	mov al,3
	add al,'0'
	mov [a],al
	mov cx,1
ciclo:
	push cx
	imprimir a,l
	pop cx
	inc cx
	cmp cx,10
	jnz ciclo
	
	mov eax,1
	mov int 80h
