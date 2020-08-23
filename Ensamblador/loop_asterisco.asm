section	.data
   msg db '*'
   new_line db 10,''
  
section .txt
   global _start        
	
_start:	  
   mov ecx,9
   mov ebx,9
   jmp principal

principal:
   push ecx,0
   cmp ebx,0
   
   jz salida
   jmp imprimir   

imprimir:
   dec ecx
   push ecx
   imprimir msj
   pop ecx
   cmp ecx,0
   jg asterisco
   mov eax,4
   mov ebx,1
   mov ecx,msg
   mov edx,1
   int 80H

   pop ecx
   jmp principal
salida:
   mov eax,1
   int 80H
