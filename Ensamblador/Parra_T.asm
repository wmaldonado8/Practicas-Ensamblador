section .data
	ms1 db 'Ingrese numero',0xA,0xD
    ta1 equ $-ms1
    ms4 db ' ',0xA,0xD
    ta4 equ $-ms4

	msj1 db 'primo',0xA,0xD
	len1 equ $-msj1
	msj2 db 'no es primo',0xA,0xD
	len2 equ $-msj2
	
section .bss
    num resb 5

section .text
	global _start

_start:

jmp ingreso

ingreso:
    mov eax,4
    mov ebx,1
    mov ecx, ms1
    mov edx, ta1
    int 80h
    
    mov eax,3
    mov ebx,2
    mov ecx,num
    mov edx,5
    int 80h
    jmp comparacion
    
comparacion:
	mov al,[num]
	sub al,'0'
	cmp al,2
	jz msjuno
	jmp comparacion1
   
comparacion1:
	mov al,[num]
	sub al,'0'
	mov bl, 2
	
	div bl
	sub al,'0'
	add al,'0'
	sub ah,'0'
	add ah,'0'
	cmp ah,0
	jz msjdos
	jmp msjuno
	
msjuno:
	mov eax,4
	mov ebx,1
	mov ecx,msj1
	mov edx,len1
	int 80h
	jmp enter

msjdos:
	mov eax,4
	mov ebx,1
	mov ecx,msj2
	mov edx,len2
	int 80h
	jmp enter

enter:
	mov eax,4
	mov ebx,1
	mov ecx,ms4
	mov edx,ta4
	int 80h
	jmp salir

salir:
	mov eax,1
	int 80
