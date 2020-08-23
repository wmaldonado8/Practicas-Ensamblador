; Programa que cambia color de fondo y letras 
section .data ;La sección utilizada para declarar constantes,

	msj db 'Presione enter',10
	len equ $ - msj

	msj1 db '!Cambia de Color de letras y fondo!',10 ; 
	len_msj1 equ $ - msj1

   ponerColor1 db 1Bh, '[31;43m', 0  ; Establecer el modelo de atributo, [31 color de la letras;43 cp;pr del fondo  
   .lenColor1 equ $ - ponerColor1 ;Establecer la longuitud 
   
   ponerColor2 db 1Bh, '[35;44;7;1;4m', 0  ;Establecer el modelo de atributo, [35 color de la letra;44 color del fondo;7 invertir los colores; 1 brillante; 4 sun=brayado 
   .lenColor2 equ $ - ponerColor2 ;;Establecer la longuitud 
   
   Borrar db 1Bh, '[0;0m', 0  ; Restablece todos los atributos 
   .len_borrar equ $ - Borrar ; Establecer la lomguitud

   
section .bss

section .text

global _start


_start:
;***Presentacion de primer mensaje y cambio de color 
    ;presentar 
    mov eax, 4
    mov ebx, 1
    mov ecx, ponerColor1
    mov edx, ponerColor1.lenColor1
    int 80h

	mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx, len
    int 80h
   ;leer por teclado 
    mov eax, 3
    mov ebx, 2
    int 80h
    ;Borrar todos los atributos 
    mov eax, 4
    mov ebx, 1
    mov ecx, Borrar
    mov edx, Borrar.len_borrar
    int 80h
    
;Presentacion de segundo fondo     
    mov eax, 4
    mov ebx, 1
    mov ecx, ponerColor2
    mov edx, ponerColor2.lenColor2
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx, len_msj1
    int 80h
    
    ;borrar todos los atributos
    mov eax, 4
    mov ebx, 1
    mov ecx, Borrar
    mov edx, Borrar.len_borrar
    int 80h
    

    mov eax, 1
    xor ebx, ebx
    int 80h
    
    

