.model small
.stack
.data

n db 12
k db 2
word dw ?

.code
.startup

; want to calculate C(n, k) = n * ... *(n - k +1) / k!

; calculate numerator 
mov ch, 0
mov cl, k
mov ah, 0
mov al, 1 
mov dh, 0
mov dl, n

num:       
    mul dl
    dec dl
    
    loop num  
         
mov word, ax
         
; calcilate denominator  
mov ch, 0
mov cl, k
mov ax, 1

den:
    mul cl        
            
    loop den 
    
mov bx, ax
 
; calculate fraction
mov ax, word
div bl

mov word, ax

.exit
end