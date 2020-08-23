section .data
	msj1 db 'Horas normales trabajadas',0xA,0xD
	len1 equ $-msj1
	msj2 db 'Horas extra',0xA,0xD
	len2 equ $-msj2
	msj3 db 'Salario Final',0xA,0xD
	len3 equ $-msj3
	
		
section .bss
	HorasExtra resb 1
	HorasNormales resb 1


section .text
	global _start
_start:

	mov HorasExtra, 8
	mov HorasNormales, 4

	mov eax,4
	mov ebx,2
	mov ecx,HorasExtra
	mov edx,1
	int80h