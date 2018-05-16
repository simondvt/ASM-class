.model small
.stack
.data

len equ 5
vett1 db 0, 1, 2, 3, 4
vett2 db 5, 6, 7, 8, 9
res db len dup(?)
parity db 0 

.code
.startup
 
mov cx, len  
mov si, 0
ciclo:
    
    mov al, vett1[si]
    and al, vett2[si] 
    jnp nopa 
    inc parity
    
    nopa:
    mov res[si], al 
                  
    inc si          
    loop ciclo 

.exit
end