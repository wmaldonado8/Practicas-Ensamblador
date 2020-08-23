sectio .data
	msj-positivo db 'Es positivo'
	len-positivo equ$-msj-positivo
	msj-negativo db 'Es negativo'
	len-negativo equ$-msj-negativo
section .text
	global _start

_start:
	mov ax,20
	sub ax,10 ;SF=1 (NG)
	js negativo
	jmp positivo


negativo:
	mov eax,4
	mov ebx,1
	mov ecx,msj-negativo
	mov edx,len-negativo
	int 80h





