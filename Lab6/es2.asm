.model small
.stack
.data
      
len equ 13     
string db "Hello, World!"

.code

proc print
    mov cx, bx
    mov si, ax
    mov ah, 2
    
    ciclo:        
        mov dl, [si]
        int 21h
        inc si
    
        loop ciclo
        
    ret
print endp    

.startup

lea ax, string
mov bx, len
call print

.exit
end