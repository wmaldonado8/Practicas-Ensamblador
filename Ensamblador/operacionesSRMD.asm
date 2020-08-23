section .data
	msj1 db 'Ingrese #1', 0xA, 0xD
	len1 equ $-msj1
	msj2 db 'Ingrese # 2', 0xA, 0xD
	len2 equ $-msj2
	msum db 0xA, 0xD,'La suma es: '
	tmsum equ $-msum
	mres db 0xA, 0xD,'La resta es: '
	tmres equ $-mres
	mmul db 0xA, 0xD,'La multiplicacion es: '
	tmmul equ $-mmul
	mdiv db 0xA, 0xD,'La division es: '
	tmdiv equ $-mdiv
	mostrar equ 4
	leer equ 3
	salir equ 1

section .bss
	n1 resb 1
	n2 resb 1
	r resb 2

section .text
	global _start

_start :
	mov eax, mostrar ;funcion
	mov ebx, 1	 ;parametro
	mov ecx, msj1    ;dato
	mov edx, len1	 ;tamaño
	int 80h
			; leer numero 1
	mov eax, leer
	mov ebx, 2
	mov ecx, n1
	mov edx, 2
	int 80h
			; mostrar segundo mensaje
	mov eax, mostrar
	mov ebx, 1
	mov ecx, msj2
	mov edx, len2
	int 80h
			; leer numero 2
	mov eax, leer
	mov ebx, 2
	mov ecx, n2
	mov edx, 2
	int 80h
	jmp mostrarSuma

mostrarSuma :
	call converToDigit
	add eax, ebx
	add eax, '0' ; transforma de digito a cadena
	mov [r], eax
			; mostrar tercer mensaje
	mov eax, mostrar
	mov ebx, 1
	mov ecx, msum
	mov edx, tmsum
	int 80h
			; mostrar tercer mensaje
	mov eax, mostrar
	mov ebx, 1
	mov ecx, r
	mov edx, 1
	int 80h
	jmp mostrarResta
mostrarResta :
	call converToDigit
	sub eax, ebx
	add eax, '0' ; transforma de digito a cadena
	mov [r], eax
			; mostrar tercer mensaje
	mov eax, mostrar
	mov ebx, 1
	mov ecx, mres
	mov edx, tmres
	int 80h
			; mostrar tercer mensaje
	mov eax, mostrar
	mov ebx, 1
	mov ecx, r
	mov edx, 2
	int 80h
	jmp mostrarMulti
mostrarMulti :
	call converToDigit2
	mul bl
	add al, '0' ; transforma de digito a cadena
	mov [r], al
			; mostrar tercer mensaje
	mov eax, mostrar
	mov ebx, 1
	mov ecx, mmul
	mov edx, tmmul
	int 80h
			; mostrar tercer mensaje
	mov eax, mostrar
	mov ebx, 1
	mov ecx, r
	mov edx, 2
	int 80h
	jmp mostrarDivi
mostrarDivi :
	call converToDigit2
	div bl
	add al, '0' ; transforma de digito a cadena
	mov [r], al
			; mostrar tercer mensaje
	mov eax, mostrar
	mov ebx, 1
	mov ecx, mdiv
	mov edx, tmdiv
	int 80h
			; mostrar tercer mensaje
	mov eax, mostrar
	mov ebx, 1
	mov ecx, r
	mov edx, 2
	int 80h
	jmp salida

converToDigit :
	mov eax, [n1]
	sub eax, '0' ; transforma la cadena a digito entero
	mov ebx, [n2]
	sub ebx, '0'
	ret
converToDigit2 :
	mov al, [n1]
	sub ax, '0' ; transforma la cadena a digito entero
	mov bl, [n2]
	sub bx, '0'
	ret
salida :
	mov eax, salir
	int 80h
