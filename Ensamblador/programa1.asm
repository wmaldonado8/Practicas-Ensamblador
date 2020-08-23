global _start 

section .text  

_start:

    mov eax, 4; se indica al sisteme que es una operacion de salida 
    mov ebx, 1; salida por pantalla 
    mov ecx, saludo 
    mov edx, tamano
    int 80h
    
   
     mov eax, 1
     mov ebx, 0 
     int 80h 
    



section .data 

        saludo: db "Hola clase Ensamblador"
        tamano: equ $-saludo  
