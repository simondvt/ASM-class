.model small
.stack
.data

ROWS equ 3
COLS equ 5   

sum dw 0

mat dw 154, 123, 109, 86, 4, ?
    dw 412, -23, -231, 9, 50, ?
    dw 123, -24, 12, 55, -45, ?
    dw ?, ?, ?, ?, ?, ? 

.code
.startup
         
; somma colonne 
mov si, 0
mov cx, COLS     
                                 ; for i 0 -> cols
outer:
    mov sum, 0 
    mov bx, 0                      ; sum = 0
    push cx
    mov cx, ROWS    
       
    inner:                       ; for j 0 -> rows        
        mov ax, bx
        mov dx, COLS 
        inc dx
        mul dx  
        
        push bx
        mov bx, ax  
        mov dx, mat[bx][si]
        add sum, dx             ; sum += mat[j][i]
        pop bx
        
             
        add bx, 2
        loop inner
        
    mov ax, bx     
    mov dx, COLS  
    inc dx
    mul dx 
    mov bx, ax 
    mov dx, sum
    mov mat[bx][si], dx         ; mat[j][i] = sum
          
    add si, 2
    pop cx
    loop outer




; --somma colonne   


; somma righe 
mov si, 0
mov cx, ROWS
inc cx     
                                 ; for i 0 -> rows + 1
outer_:
    mov sum, 0 
    mov bx, 0                    ; sum = 0
    push cx
    mov cx, COLS    
       
    inner_:                       ; for j 0 -> cols                 
        mov dx, mat[bx][si]
        add sum, dx              ; sum += mat[j][i]
            
        add bx, 2
        loop inner_
         
    mov dx, sum
    mov mat[bx][si], dx         ; mat[i][j] = sum
          
    mov ax, COLS 
    inc ax
    mov dx, 2
    mul dx
    add si, ax
    
    pop cx
    loop outer_




; --somma righe

.exit
end