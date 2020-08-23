section .data 
msjNumero db 10,"Ingrese un numero del 1 al 5",10
tamNumero equ $-msjNumero

msjFueraRango db 10,"El numero esta fuera de rango",10
tamFueraRango equ $-msjFueraRango

msjPrimo db 10,"El numero es primo",10
tamPrimo equ $-msjPrimo

msjNoPrimo db 10,"El numero no es primo",10
tamNoPrimo equ $-msjNoPrimo

msjGracias db 10,"Gracias",10
tamGracias equ $-msjGracias

section .bss
	numero resb 2
	cociente resb 2
	residuo resb 2

section .text
	global _start
_start:
		;presenta en pantalla
mov eax ,4
mov ebx ,1
mov ecx ,msjNumero
mov edx ,tamNumero
int 80h

		;lee lo ingresado
mov eax ,3
mov ebx ,2
mov ecx ,numero
mov edx ,1
int 80h

	mov al,[numero] ;guarda el numero
	sub al,'0' ;convierte a cadena
	cmp al,5
	jg FueraRango
	jmp Comp2

	Comp2:
	cmp al,1
	jl FueraRango
	jmp CompPrimo

	mov al,[numero] ;guarda el numero
	mov bl,2 ;guarda el numero
	sub al,'0' ;convierte a cadena
	sub bl,'0' ;convierte a cadena
	mov dx, 0 ; limpia el registro
	mov ah, 0 ; limpia el registro
	div bl ;realiza la division, guarda la respuesta en al
	add al,'0' ; convierte a cadena
	mov [cociente],al
	mov [residuo],ah

	

	CompPrimo:
	cmp al ,4
	jz NoEsPrimo
	jmp EsPrimo

	FueraRango:
		mov eax ,4
		mov ebx ,1
		mov ecx ,msjFueraRango
		mov edx ,tamFueraRango
		int 80h

		jmp Salir

	NoEsPrimo:
		mov eax ,4
		mov ebx ,1
		mov ecx ,msjNoPrimo
		mov edx ,tamNoPrimo
		int 80h

		jmp Salir

	EsPrimo:
		mov eax ,4
		mov ebx ,1
		mov ecx ,msjPrimo
		mov edx ,tamPrimo
		int 80h

		mov eax ,4
		mov ebx ,1
		mov ecx ,cociente
		mov edx ,2
		int 80h

		mov eax ,4
		mov ebx ,1
		mov ecx ,residuo
		mov edx ,2
		int 80h

		jmp Salir

	Salir:
		;************ presenta en pantalla el mensaje ***********
	mov eax, 4
	mov ebx, 1
	mov ecx, msjGracias
	mov edx, tamGracias
	int 80h	

	mov eax, 1
	int 80h
	
	

section .data
	msj_asterisco db '*'
	len_asterisco equ $-msj_asterisco
	nueva_linea db 10,''
	len_nueva_linea equ $-nueva_linea
section .bss
	num resb 1

section .text
	global _start

_start:
	
	mov ecx,20
	mov ebx,1

	

;------------------------------
etiqueta1:
	
	push ecx
	mov ecx, ebx
	push ecx

	;pop ebx
	;pop ecx

	;push ecx		; se envia la referencia de ecx a pila

	;push ebx
	call imprimir_enter
	
	;pop ebx
	pop ecx
	mov ebx,ecx
	push ebx
etiqueta2:

	push ecx
	call imprimir_asterisco
	pop ecx
;-------------------------
	;mov eax,[num] 
	;inc eax
	;push eax
	;mov ecx,ebx
	loop etiqueta2
	pop ebx
	pop ecx
	inc ebx
	loop etiqueta1

	mov eax,1
	int 80h

imprimir_asterisco:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_asterisco
	mov edx, len_asterisco
	int 80h
	ret


imprimir_enter:
	mov eax, 4
	mov ebx, 1
	mov ecx, nueva_linea
	mov edx, len_nueva_linea
	int 80h
	ret
