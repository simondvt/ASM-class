.model small
.stack
.data

opa db 0
opb db 0
ris db ?   

.code
.startup


mov cx, 8
read1:
    mov ah, 1  
    int 21h
    sub al, '0' 
    shl opa, 1
    add opa, al   
    
    loop read1 
    
mov cx, 8
read2:
    mov ah, 1
    int 21h  
    sub al, '0'
    shl opb, 1
    add opb, al   
       
    loop read2 
    
xor bl, bl
mov al, opa
mov ah, opb 

not ah
mov bl, al
and al, ah
not al 
; al = NOT(a AND (NOT b)  
mov ah, opa
mov bl, opb
xor ah, bl
; ah = a XOR b

or al, ah  
; al = NOT(a AND (NOT b) OR (a XOR b)
mov ris, al

.exit
end