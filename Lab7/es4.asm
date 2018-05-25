.model small
.stack
.data
 
count db 26 dup(0) 
 
msg db "sasso rosso"
len equ $-msg

.code
.startup
       
mov bx, 0       
mov cx, len 
lea si, msg

; get counts
conta:        
    mov bl, [si] ; current char
    
    ; check 'a' <= char <= 'z' 
    cmp bl, 61h
    jb nextc
    cmp bl, 7bh
    ja nextc 
    
    ; map char to [0, 25]
    sub bl, 61h 
    
    ; update count
    inc count[bx]
     
    nextc: 
    inc si
    loop conta
    

; print histogram
mov cx, 26
mov si, 0 
mov ah, 2
histo: 
    push cx 
    mov cx, 0
   
    mov cl, count[si]  
    test cl, cl   ; test if there are 0 occurences 
    jz nexth
    
    mov dx, si
    add dl, 61h   ; current char
    int 21h       ; print char
    
    mov dl, 20h   ; space char
    int 21h 
    
    star: 
        mov dl, 2Ah   ; '*' char
        int 21h
        loop star  
    
    ; print "\r\n"    
    mov dl, 13 
    int 21h   
    mov dl, 0Ah 
    int 21h
     
     
    nexth:
    inc si
    pop cx
    loop histo


.exit
end