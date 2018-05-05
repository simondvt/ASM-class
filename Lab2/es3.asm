.model small
.stack
.data
               
var dw 0
vett dw 0, 0, 0, 0, 0   
msg db "ERRORE$"

.code
.startup

mov si, 0

leggi:  mov ah, 1
        int 21h 
        cbw      
        cmp ax, 13  ; ENTER
        je next  
        sub ax, 48 
        mov bx, ax
        mov ax, var 
        mov dx, 10
        mul dx
        cmp dx, 0
        jne err 
        mov var, ax 
        add var, bx
        jc err
        jmp leggi 
          
 
err: lea dx, msg  
     mov ah, 9
     int 21h 
     
next: mov ax, var
      mov vett[si], ax
      add si, 2
      mov var, 0 
      cmp si, 10
      je esci
      jmp leggi
esci:     
.exit
end