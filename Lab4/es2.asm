.model small
.stack
.data

valore db 1, 2, 5, 10, 20, 50, 100, 200
monete db 100, 23, 17, 0, 79, 48, 170, 211 

euro dw ?
cent dw ?

len equ 8

.code
.startup

mov si, 0   ; index  
mov di, 0
mov bx, 0   ; partial sum
mov cx, len

ciclo:                   ; for i 0 -> len
    mov dl, valore[si]
    mov al, monete[di]
    mul dl
    add bx, ax           ; bx += valore[i] * monete[i]  
    inc si
    inc di
    loop ciclo  
    
mov ax, bx 
mov dx, 0

mov cx, 100
div cx    

mov euro, ax            ; euro = bx / 100
mov cent, dx            ; cent = bx % 100

.exit
end