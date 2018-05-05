.model small
.stack
.data
      
DIM equ 20      
      
fib dw DIM dup(?)

.code
.startup

mov fib[0], 1
mov fib[2], 1

mov si, 4 
mov cx, DIM - 2  

ciclo:  mov ax, fib[si - 4];
        add ax, fib[si - 2]; 
        mov fib[si], ax
        add si, 2 
        loop ciclo

.exit
end