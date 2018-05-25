.model small
.stack
.data
  
len equ 10  
  
vett1 dw 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
vett2 dw 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
res dw len dup(?)

op1 dw ?
op2 dw ?
op_res dw ?

.code 

proc avg
    mov ax, op1
    add ax, op2
    shr ax, 1
    mov op_res, ax
    
    ret
avg endp

.startup

mov cx, len
mov si, 0

ciclo:
    
    mov ax, vett1[si]
    mov op1, ax
    mov ax, vett2[si]
    mov op2, ax
    
    call avg 
    
    mov ax, op_res
    mov res[si], ax              
                
    add si, 2                
    loop ciclo

.exit
end