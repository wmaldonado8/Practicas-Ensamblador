;Programa que presenta el nombre y el fondo
section .data;

	msj db 'SISA',10
	len equ $ - msj

	s db 'S '
	len_s equ $ - s
	
	s2 db 'S '
	len_s2 equ $ - s2
	
	i db 'I '
	len_i equ $ - i
	
	a db 'A '
	len_a equ $ - a

   ponerColor_I db 1Bh, '[35;40;7;1;4m', 0  ; Establecer el modelo de atributo, [35 color de la letra;40 color del fondo;7 invertir los colores; 1 brillante; 4 subrayado 
   .lenColorI equ $ - ponerColor_I
   
   ponerColor_A db 1Bh, '[33;40;7;1;4m', 0  ; Establecer el modelo de atributo, [33 color de la letra;40 color del fondo;7 invertir los colores; 1 brillante; 4 sun=brayado 
   .lenColorA equ $ - ponerColor_A
   
   ponerColor_S db 1Bh, '[30;47;7;1;4m', 0  ; Establecer el modelo de atributo, [30 color de la letra;47 color del fondo;7 invertir los colores; 1 brillante; 4 sun=brayado 
   .lenColorS equ $ - ponerColor_S
   
   ponerColor_S2 db 1Bh, '[31;46;7;1;4m', 0  ; Establecer el modelo de atributo, [31 color de la letra;46 color del fondo;7 invertir los colores; 1 brillante; 4 sun=brayado 
   .lenColorS2 equ $ - ponerColor_S2
   
   Borrar db 1Bh, '[0;0m', 0  ; Restablece todos los atributos
   .len_borrar equ $ - Borrar
   
section .bss

section .text

global _start


_start:

	mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx, len
    int 80h
    
    mov eax, 3
    mov ebx, 2
    int 80h
    
;Presentar primira letra    
    mov eax, 4
    mov ebx, 1
    mov ecx, ponerColor_S
    mov edx, ponerColor_S.lenColorS
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, s
    mov edx, len_s
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, Borrar
    mov edx, Borrar.len_borrar
    int 80h
;Presentar segundo letra    
    mov eax, 4
    mov ebx, 1
    mov ecx, ponerColor_I
    mov edx, ponerColor_I.lenColorI
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, i
    mov edx, len_i
    int 80h
    ;borrar todos los atributos
    mov eax, 4
    mov ebx, 1
    mov ecx, Borrar
    mov edx, Borrar.len_borrar
    int 80h
    
;Presentar tercera letra   
    mov eax, 4
    mov ebx, 1
    mov ecx, ponerColor_S2
    mov edx, ponerColor_S2.lenColorS2
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, s2
    mov edx, len_s2
    int 80h
    ;borrar todos los atributos
    mov eax, 4
    mov ebx, 1
    mov ecx, Borrar
    mov edx, Borrar.len_borrar
    int 80h
    ;Presentar cuarta letra    
    mov eax, 4
    mov ebx, 1
    mov ecx, ponerColor_A
    mov edx, ponerColor_A.lenColorA
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, a
    mov edx, len_a
    int 80h
    
    ;;borrar todos los atributos
    mov eax, 4
    mov ebx, 1
    mov ecx, Borrar
    mov edx, Borrar.len_borrar
    int 80h

   
           
    mov eax, 1
    xor ebx, ebx
    int 80h
    
    
