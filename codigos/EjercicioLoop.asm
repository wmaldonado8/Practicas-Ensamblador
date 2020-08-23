section	.bss		 ; Aqui se declaran las variables
num resb 1 			 ;La variable declarada num

section	.text		 ;La seccion que contiene los codigos que se van a ejecutar
global _start 

_start:		   		 ;aqui inicia el codigo de las instrucciones
mov ecx,10			 ;Se guarda en ecx la cantidad de repeticiones que deseamos hacer
mov eax, '1'		 ;Se guarda en Eax el valor de 1

l1:					 ;Es la seccion para ir presentando los valores
mov [num], eax 		 ;Guardamos en la variable num lo que contiene eax
mov eax, 4			 ; se prepara para presentar en pantalla
mov ebx, 1	
push ecx			 ;Se manda a la pila el valor de ecx

mov ecx, num 		 ; Se guarda en ecx el numero que vamos a presentar en pantalla
mov edx, 1 			 ; Se guarda el tamaño del caracter
int 0x80			 ; Se manda a ejecutar la instruccion de presentar en pantalla

mov eax, [num]		 ; Se va a transformar en numero el valor de num
sub eax, '0' 		 
inc eax 		 	 ;se incrementa el numero
add eax, '0'		 ;se lo transforma a caracter al numero
pop ecx 			 ;Se recupera el valor de la pila en ecx
loop l1 			 ;Se ejecuta el loop y se decrementa ecx y se va a la etiqueta l1

mov eax,1 
int 0x80