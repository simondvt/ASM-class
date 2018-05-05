.model small
.stack
.data

DIM equ 10

vett db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
risultato db ?

.code
.startup
      
mov ax, 0
mov si, 0
mov cx, DIM

sum: add al, vett[si]
     inc si
     loop sum
     
cbw    
mov dl, DIM
idiv dl
mov risultato, al

.exit
end


