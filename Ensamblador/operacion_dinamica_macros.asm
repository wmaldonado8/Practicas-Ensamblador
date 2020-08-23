;Walter Manuel Maldonado Armijos
; 22/06/2020

%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro
%macro ingresar 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro
section .data
    
    m1 db "Ingrese el primer número: "
    lengnum1 equ $ - m1

    m2 db "Ingrese el segundo número: "
    lengnum2 equ $ - m2

    msuma db 'resultado Suma :',10
    len_s EQU $ -msuma

    mresta db 10,'resultado Resta:',10,13
    len_r EQU $ - mresta

    multi db 'resultado Multiplicacion:',10
    len_m EQU $ - multi

    mcociente db 'resultado cociente:',10
    len_c EQU $ - mcociente
    mresiduo db 'resultado residuo:',10
    len_re EQU $ - mresiduo

    
section .bss
    section .bss
    n1 resb 1
    n2 resb 1

    resultado resb 1
    residuo resb 1

section .text
    global _start
_start:
   
    imprimir m, leng
   
    imprimir m1, lengnum1
    ingresar n1, 2

    
    imprimir m2, lengnum2
    ingresar n2, 2
    jmp _sumar
    


_sumar:
    mov ax,[n1]
    mov bx,[n2]
    sub ax, '0'
    sub bx, '0'
    add ax, bx
    add ax, '0'
    mov [resultado], ax 
    
    imprimir msuma, len_s
    imprimir resultado, 1
    jmp _restar
    



_restar:
    mov ax,[n1]
    mov bx,[n2]
    sub ax, '0'
    sub bx, '0'
    sub ax, bx
    add ax, '0'
    mov [resultado], ax 
   
    imprimir mresta, len_r
    imprimir resultado, 1
    jmp _multiplicar
    

_multiplicar:
    mov al,[n1]
    mov bl,[n2]
    sub al, '0'
    sub bl, '0'
    mul bl
    add al, '0'
    mov [resultado], al 
    imprimir multi, len_m
    imprimir resultado, 1
    jmp _dividir
    


_dividir:
    mov al, [n1]
    mov bl, [n2]
    sub al, '0'
    sub bl, '0'
    div bl
    add al, '0'
    mov [resultado], al
    add ah, '0'
    mov [residuo], ah
    
    ;cociente
    imprimir mcociente, len_c
    imprimir resultado, 1
    
    ;residuo
    imprimir mresiduo, len_re
    imprimir residuo, 1
    mov eax, 1
    int 80h
    jmp _salir
    
_salir:

    mov eax, 1
    int 80h
