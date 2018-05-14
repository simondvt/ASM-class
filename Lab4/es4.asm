.model small
.stack
.data

dim equ 5

mat db 1, 4, 5, 6, 7
    db 4, 2, 8, 6, 4
    db 5, 8, 3, 2, 9
    db 6, 6, 2, 4, 4
    db 7, 4, 9, 4, 5
    

.code 
   
; check if matrix is diagonal   
diag proc  
     
    mov si, 0    
    mov cx, dim
    
    rows:                ; for every row
        mov bx, 0 
        push cx
        
        mov cx, dim
        cols:            ; for every col
            
            mov ax, si
            mov dl, dim
            div dl       ; ax = row
            
            cmp ax, bx   ; row == col ?
            je next
            
            cmp mat[si][bx], 0   ; mat[row][col] == 0 ?
            je next
             
            pop cx 
            ret                ; if so, return
            
            
            next:
            inc bx
            loop cols
                       
        pop cx
        add si, dim
        loop rows
                  
    mov ah, 2
    mov dl, '2'
    int 21h
     
    ret
diag endp
 
; check if matrix is symmetric
sim proc   
    
    mov si, 0    
    mov cx, dim
    
    rows_:                ; for every row
        mov bx, 0 
        push cx
        
        mov cx, dim
        cols_:            ; for every col
        
            mov al, mat[si][bx]     
            push ax      ; push mat[row][col]  
              
            mov ax, si
            mov dl, dim
            div dl              ; ax = row 
            mov di, ax
            
            mov ax, bx
            mov dl, dim
            mul dl  
            push bx
            mov bx, ax          ; bx *= dim                             
                             
            mov al, mat[bx][di]   ; mat[col][row] 
            pop bx
            pop dx
            
            cmp dl, al      ; mat[col][row] == mar[row][col] ?
            je next_  
            
            ; mat[col][row] != mar[row][col]
            pop cx
            mov ah, 2
            mov dl, '0'
            int 21h     
            ret
             
            next_: 
            inc bx
            loop cols_
                       
        pop cx
        add si, dim
        loop rows_
                  
    mov ah, 2
    mov dl, '1'
    int 21h
    
    ret
sim endp

.startup
  
  
call sim
call diag 


.exit
end