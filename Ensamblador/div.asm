section .data
	;enter db ';',0xA,0xD
	;lene equ $-enter
    msj db 'Cociente : '
    len equ $-msj
	msj1 db 'Residuo : '
    len1 equ $-msj1
	
section .bss
    r_AL resb 5
    r_AX resb 5

section .text
global _start

_start:
	
	mov al,27
	mov bl,3
	
	div bl
	add al,'0'
	add ah,'0'
	
	mov[r_AL],al
	mov[r_AX],ah

    ;escritura
    mov eax,4
    mov ebx,1
    mov ecx, msj
    mov edx, len
    int 80h
    
    ;escritura
    mov eax,4
    mov ebx,1
    mov ecx,r_AL
    mov edx,5
    int 80h
    
    ;escritura
    ;mov eax,4
    ;mov ebx,1
    ;mov ecx, enter
    ;mov edx, lene
    ;int 80h

    ;escritura
    mov eax,4
    mov ebx,1
    mov ecx,msj1
    mov edx,len1
    int 80h
    
    ;escritura
    mov eax,4
    mov ebx,1
    mov ecx,r_AX
    mov edx,5
    int 80h

    ;salida
    mov eax, 1
    int 80h
