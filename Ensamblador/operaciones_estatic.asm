%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	resultado_suma db 10, "El resultado de la suma es:",10
	len_suma equ $-resultado_suma
	
	resultado_resta db 10, "El resultado de la resta es:",10
	len_resta equ $-resultado_resta
	
	resultado_multi db 10, "El resultado de la multiplicacion es:",10
	len_multi equ $-resultado_multi
	
	resultado_cociente db 10, "El resultado del cociente es:",10
	len_cociente equ $-resultado_cociente
	
	resultado_residuo db 10, "El resultado del residuo es:",10
	len_residuo equ $-resultado_residuo
	
section .bss
	suma resb 1
	resta resb 1
	multiplicacion resb 1
	cociente resb 1
	residuo resb 1
section .text
	global _start
_start:
	imprimir resultado_suma, len_suma
	
	mov al,4
	mov bl,2
	add al,bl
	add al,'0'
	
	mov [suma],al
	
	
	imprimir suma,2
	
	
	imprimir resultado_resta, len_resta
	
	
	mov al,4
	mov bl,2
	sub al,bl
	add al,'0'
	
	mov [resta],al
	
	imprimir resta,2
	
	imprimir resultado_multi, len_multi
	
	
	mov al,4
	mov bl,2
	;add bl
	add al,'0'
	
	mov [multiplicacion],al
	
	
	imprimir multiplicacion,2
	
	imprimir resultado_cociente, len_cociente
	
	mov al,5
	mov bl,2
	div bl
	add al,'0'
	add ah,'0'
	
	mov [cociente],al
	mov [residuo],ah
	
	imprimir cociente,2
	
	imprimir resultado_residuo, len_residuo
	
	imprimir residuo,2
	
	mov eax,1
	int 80h
	
