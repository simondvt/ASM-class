.model small
.stack
.data

DIM equ 10

mat db DIM*DIM dup(?)

.code
.startup
     
mov cx, DIM 
mov bx, 0    
     
outer: 
    mov si, 0
    push cx 
    
    mov cx, DIM
    
    inner:; mat[bx * DIM][si] = (bx + 1) * (si + 1)
          
          
          inc bx
          mov ax, bx
          dec bx
          inc si
          mul si
          dec si 
          mov dx, ax  ; dx = (bx + 1) * (si + 1)
          push dx
          
          
          push bx
          mov ax, bx
          mov bx, DIM
          mul bx  
          mov bx, ax  ; bx = bx * DIM  
          
          pop ax    ; ax = bx
          pop dx    
          mov mat[bx][si], dl     
          mov bx, ax
             
          inc si
          loop inner
     
    pop cx  
    inc bx
    loop outer
            


.exit
end