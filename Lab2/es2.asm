.model small
.stack
.data

intero dw 9999

.code
.startup

mov cx, 0
mov ax, intero 
cwd 
mov bx, 10

scomponi: inc cx
          div bx 
          push dx   
          cwd 
          cmp ax, 0
          jne scomponi 
          

stampa:  pop ax
         mov dl, al
         mov ah, 2
         add dl, 48   
         int 21h  
         loop stampa

.exit
end