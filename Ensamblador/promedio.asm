section .data
	ms1 db 'Ingrese primera nota',0xA,0xD
    ta1 equ $-ms1
    ms2 db 'Ingrese segunda nota',0xA,0xD
    ta2 equ $-ms2
    ms3 db 'Ingrese tercera nota',0xA,0xD
    ta3 equ $-ms3
    ms4 db ' ',0xA,0xD
    ta4 equ $-ms4

	msj1 db 'Calificacion Excelente',0xA,0xD
	len1 equ $-msj1
	msj2 db 'Calificacion Regular',0xA,0xD
	len2 equ $-msj2
	msj3 db 'Calificacion Insuficiente',0xA,0xD
	len3 equ $-msj3
	
section .bss
    num1 resb 5
    num2 resb 5
    num3 resb 5
    res resb 5

section .text
	global _start

_start:

jmp ingreso1
	 
ingreso1:
    mov eax,4
    mov ebx,1
    mov ecx, ms1
    mov edx, ta1
    int 80h
    mov eax,3
    mov ebx,2
    mov ecx,num1
    mov edx,5
    int 80h
    jmp ingreso2

ingreso2:
    mov eax,4
    mov ebx,1
    mov ecx, ms2
    mov edx, ta2
    int 80h
	mov eax,3
    mov ebx,2
    mov ecx,num2
    mov edx,5
    int 80h
    jmp ingreso3
    
ingreso3:
    mov eax,4
    mov ebx,1
    mov ecx, ms3
    mov edx, ta3
    int 80h
    mov eax,3
    mov ebx,2
    mov ecx,num3
    mov edx,5
    int 80h
    jmp	inicio
    
inicio:
	add al,[num1]
	add al,[num2]
	add al,[num3]
	mov bl,3
	
	div bl
	sub al,'0'
	add al,'0'
	mov bl,9
	add bl,'0'
	mov cl,7
	add cl,'0'
	mov [res],al
	jmp comparacion1
	
comparacion1:
	cmp al,bl
	jge msjuno
	jmp comparacion2

comparacion2:
	cmp al,cl
	jge msjdos
	jmp msjtres

msjuno:
	mov eax,4
	mov ebx,1
	mov ecx,msj1
	mov edx,len1
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,res
	mov edx,5
	int 80h
	jmp enter

msjdos:
	mov eax,4
	mov ebx,1
	mov ecx,msj2
	mov edx,len2
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,res
	mov edx,5
	int 80h
	jmp enter

msjtres:
	mov eax,4
	mov ebx,1
	mov ecx,msj3
	mov edx,len3
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,res
	mov edx,5
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
	int 80h
