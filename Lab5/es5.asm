.model small
.stack
.data

DIM equ 5 
          
numeri db 41, 7, 169, 5, 11         
risultato db DIM dup(?)

.code  

; parameter in bl
proc isPrime
     
    mov bh, 0
    mov al, 2
    
    find:     
        mov ah, 0
        push ax
        mul al 
        cmp al, bl
        ja true
        
        pop ax
        
        ; ax = i; bx = num
        xchg ax, bx       
        ; bx = i; ax = num
        push ax 
        div bl
        cmp ah, 0
        jz false 
        pop ax
        xchg ax, bx
        
        inc ax 
        jmp find 
        
   true:
   pop ax
   mov bl, 1 
   ret 
    
   false:
   pop ax
   mov bl, 0 
 
   ret 
   
isPrime endp
            
.startup

mov cx, DIM  
mov si, 0

ciclo:  

    mov bl, numeri[si]
    call isPrime
    mov risultato[si], bl
     
    inc si 
    loop ciclo

.exit
end