section .data

msj1 db "Ingrese numero1:	",
len1 equ $ -msj1

msj2 db  10,"Ingrese numero2:	",
len2 equ $ -msj2


resultado db 10,"La suma es:	",
len_p equ $ - resultado 

section .bss       ;bss para variables
a resb 1
b resb 1
suma resb 1 ; se reserva un espacion en la variable sin valor inicial 

section .text 
	global _start

_start:
; lectura y escritura de variables
	mov eax,4
	mov ebx,1
	mov ecx,msj1
	mov edx,len1
	int 80H

	mov eax,3
	mov ebx,2
	mov ecx,a
	mov edx,2
	int 80H

	mov eax,4
	mov ebx,1
	mov ecx,msj2
	mov edx,len2
	int 80H

	mov eax,3
	mov ebx,2
	mov ecx,b
	mov edx,2
	int 80H
;------------------------------------------

	mov eax, [dato_a]
	sub eax, '0'
	mov ebx, [dato_b]
	sub ebx, '0'
	mul ebx
	add eax,'0';convierte el numero a cadena
	mov [multiplicacion], eax

	mov[presentar_suma+4], dword 'Mult'
;--------------------------------------------

	;imprimir
	mov eax,4
	mov ebx,1
	mov ecx,resultado
	mov edx,len_p
	int 80H

	mov eax,4
	mov ebx,1
	mov ecx,suma
	mov ebx,1
	int 80H

	mov eax,1
	int 80H


	mov eax,1
	int 80H
