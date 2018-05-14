.model small
.stack
.data
    
len equ 14    
    
trans dd 2300, 4500, 8500, 2900, 68000, 134000, 275000, 1180235, 3100000, 8800000, 22000000, 112000000, 26000000, 1750000000
area dw 12, 20, 18, 33, 44, 49, 104, 173, 294, 162, 184, 110, 31, 122
 
dens dw len dup(?)

.code
.startup

 
mov cx, len
mov si, 0   ; indice trans
mov di, 0   ; indice area / dens

ciclo:   
         
    mov ax, word ptr trans[si]
    mov dx, word ptr trans[si + 2]
    mov bx, area[di]
    
    ; check rappresentabilita'
    cmp dx, bx
    jae ovf
    
     
    div bx     
    mov dens[di], ax
    jmp next
    
    ovf:
    mov dens[di], 0ffffh       
                    
              
    next:   
    add si, 4
    add di, 2    
    loop ciclo
     
 
.exit
end