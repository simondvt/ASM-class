.model small
.stack
.data

opa dw 2043
opb dw 5    
res dw ?

tab dw som, sot, mol, divi
 
.code
.startup

; input
mov ah, 1
int 21h
; al = {'1', '2', '3', '4'}
dec al
; al = {'0', '1', '2', '3'}
sub al, '0'
; al = {'0', '1', '2', '3'}
mov ah, 0 
; ax = {0, 1, 2, 3}
shl ax, 1
mov si, ax
jmp tab[si]  

som: 
    mov res, 0
    mov ax, opa
    add ax, opb 
    mov res, ax
    jmp fine
    
sot:
    mov res, 0
    mov ax, opa
    sub ax, opb 
    mov res, ax
    jmp fine
    
mol:  
    mov ax, opa
    mov bx, opb
    mul bx
    mov res, ax
    jmp fine 
    
divi:
    mov ax, opa
    mov bx, opb  
    mov dx, 0
    div bx
    mov res, ax
    jmp fine
    
fine: 
.exit
end