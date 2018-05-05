.model small
.stack
.data

btarray db -5, -45, -96, -128
addendo dd 69000
risultato dd ?

.code
.startup

mov cx, 4 
mov bx, 0 
mov dx, 0 

ciclo:  
    mov al, btarray[bx] 
    cbw
    add dx, ax
    inc bx
    loop ciclo 

mov ax, dx  
cwd
add ax, word ptr addendo
adc dx, word ptr addendo + 2

mov word ptr risultato, ax
mov word ptr risultato + 2, dx

.exit
end