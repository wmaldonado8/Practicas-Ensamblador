section .data

section .bss
   num resb 1
section .text
   global _start        ;must be declared for using gcc

_start:                 ;tell linker entry point
   mov cx,10
   ;mov eax, '1'

l1:
   mov [num], eax
   mov eax, 4
   mov ebx, 1
   ;push cx

   mov ecx, num        
   mov edx, 1        
   int 80h

   mov eax, [num]
   sub eax, '0'
   inc eax
   add eax, '0'
   ;pop cx
   loop l1

   mov eax,1             ;system call number (sys_exit)
   int 80h              ;call kernel
   
   

	
