.model small
.stack
.data
  
len equ 10  
  
vett1 dw 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
vett2 dw 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
res dw len dup(?)


.code 

; ops in ax, bx
; result in ax
proc avg
    add ax, bx
    shr ax, 1
    
    ret
avg endp

.startup

mov cx, len
mov si, 0

ciclo:
    
    mov ax, vett1[si]
    mov bx, vett2[si]
    
    call avg 
    
    mov res[si], ax              
                
    add si, 2                
    loop ciclo

.exit
end