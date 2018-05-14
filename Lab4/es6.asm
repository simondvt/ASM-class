.model small
.stack
.data

dim equ 8

mat db 0, 4, 0, 0, 0, 0, 0, 60
    db 0, 5, 0, 0, 11, 0, 0, 0
    db 0, 5, 7, 0, 0, 10, 0, 0
    db 0, 0, 0, 9, 0, 0, 49, 0
    db 0, 0, 10, 0, 0, 0, 0, 0
    db 0, 10, 3, 9, 0, 0, 12, 0
    db 0, 0, 58, 0, 0, 17, 0, 0
    db 0, 1, 0, 0, 3, 0, 0, 0, 0 

max dw 0 
row_coord dw ?
col_coord dw ?

.code
.startup

mov si, 0
mov cx, dim

row:        
    push cx
    mov cx, dim   
    mov bx, 0
    
    col:
        mov ax, 0   ; sum accumulator   
        
        cmp bx, 0
        jbe next1 
        ; j > 0
        push bx
        dec bx
        mov dx, 0
        mov dl, mat[si][bx]
        add ax, dx
        pop bx
        
        next1:
        mov dx, dim
        dec dx 
        ; j < dim - 1
        cmp bx, dx
        jae next2 
        push bx
        inc bx 
        mov dx, 0
        mov dl, mat[si][bx]
        add ax, dx
        pop bx
        
        next2:
        push ax
        mov ax, si
        mov dl, dim
        div dl 
        ; i > 0
        cmp ax, 0
        jbe next3
        pop ax
        push si
        sub si, dim
        mov dx, 0
        mov dl, mat[si][bx]
        add ax, dx
        pop si

        push ax 
        next3:
        pop ax
        push ax
        mov ax, si
        mov dl, dim
        div dl
        ; i < dim - 1
        mov dx, dim
        dec dx  
        cmp ax, dx
        jae next4
        pop ax 
        push si
        add si, dim
        mov dx, 0
        mov dl, mat[si][bx]
        add ax, dx
        pop si
         
        push ax
        next4:
        pop ax 
        
        ; check for max 
        
        cmp ax, max
        jbe next 
        mov max, ax
        mov row_coord, si
        mov col_coord, bx
        
        next:
        inc bx 
        loop col
    
    add si, dim            
    pop cx
    loop row 
    
    
; fix row coord
mov ax, row_coord
mov dl, dim
div dl
mov row_coord, ax

.exit
end