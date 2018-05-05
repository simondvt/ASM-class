.model small
.stack
.data
   
DIM equ 4
   
v1  dw -1, 2, -3, 4
v2  dw 5, 6, 7, 8
res dw DIM*DIM dup(?)

.code
.startup

mov cx, DIM 
mov bx, 0

outer:        
    mov si, 0 
    push cx
    mov cx, DIM
    
    inner:                      
        mov ax, v1[bx]
        mov dx, v2[si]
        imul dx  
         
        ; tutto questo bordello per poter scrivere [bx][si] con bx = bx * DIM      
        push ax
        mov ax, bx
        mov dx, DIM
        imul dx
        mov dx, ax
        pop ax 
        push bx
        mov bx, dx
        ; --
        
        mov res[bx][si], ax 
        
        pop bx
          
        add si, 2
        loop inner
     
    pop cx
    add bx, 2
    loop outer


.exit
end                