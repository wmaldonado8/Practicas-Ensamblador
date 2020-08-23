%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	a db "Ingrese valor de a: ", 10
	leng_a equ $ -a
	b db "Ingrese valor de b: ", 10
	leng_b equ $ -b
	presentar_suma db 10,"La suma es: ",10
	leng_presentar_suma equ $ -presentar_suma

section .bss
	dato_a resb 10
	dato_b resb 10
	cociente resb 10
	residuo resb 10
	resta resb 10
	suma resb 10
	multiplicacion resb 10

section .text
	global _start
	global _dividir
	global _restar
	global _sumar
	global _multiplicar
	global _salir

_start:
	imprimir a, len_a

	leer a,2

	imprimir b, len_b

	leer b,2
	jmp _sumar

_dividir:
	mov al, [dato_a]
	sub al, '0'
	mov bl, [dato_b]
	sub bl, '0'
	div bl
	add al, '0'
	add ah, '0'

	;mov ebx, aL
	;add ebx,'0';convierte el numero a cadena
	mov [cociente], al
	mov [residuo], ah

	mov[presentar_suma+4], dword 'divi'; 

	imprimir presentar_suma, leng_presentar_suma

	mov eax, 4
	mov ebx, 1
	mov ecx, cociente
	mov edx, 1
	int 80H

	jmp _salir

_restar:
	mov eax, [dato_a]
	sub eax, '0'
	mov ebx, [dato_b]
	sub ebx, '0'
	sub eax, ebx
	add eax,'0';convierte el numero a cadena
	mov [resta], eax

	mov[presentar_suma+4], dword 'rest'; acepta hasta el 4 no sé por qué

	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_suma
	mov edx, leng_presentar_suma
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, resta
	mov edx, 1
	int 80H
	jmp _multiplicar

_sumar:
	mov eax, [dato_a]
	sub eax, '0'
	mov ebx, [dato_b]
	sub ebx, '0'
	add eax, ebx
	add eax,'0';convierte el numero a cadena
	mov [suma], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_suma
	mov edx, leng_presentar_suma
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80H
	jmp _restar

_multiplicar:
	mov eax, [dato_a]
	sub eax, '0'
	mov ebx, [dato_b]
	sub ebx, '0'
	mul ebx
	add eax,'0';convierte el numero a cadena
	mov [multiplicacion], eax

	mov[presentar_suma+4], dword 'Mult'

	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_suma
	mov edx, leng_presentar_suma
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, multiplicacion
	mov edx, 1
	int 80H
	jmp _dividir

_salir:
	mov eax, 1
	mov ebx, 0
