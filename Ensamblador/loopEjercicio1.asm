section .data
    msj db '*******',10
    len equ $-msj
	
section .bss
 
section .text
	global _start

_start:
		
		mov ecx,20 

l1: 
		mov eax,4
		mov ebx,1
		push ecx   ;se envia la referencia de ecx a pila 
		mov ecx, msj
		mov edx, len
		int 80h 
		
		pop ecx 
		loop l1		; se decrementa ecx en 1 
		
		mov eax, 1
		int 80h

