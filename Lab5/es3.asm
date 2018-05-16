.model small
.stack
.data

byte db 01101011b

.code
.startup

mov cx, 8 
mov al, 0   ; count
conta:        
    
    mov bl, 1   ; mask
    and bl, byte
    shr byte, 1 
    add al, bl
    
    loop conta  

; result in al

.exit
end