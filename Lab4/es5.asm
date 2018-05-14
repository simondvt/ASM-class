.model small
.stack
.data

num dw 81   ; positive integer

.code
.startup

mov ax, 0  ; sqrt accumulator
mov bx, 1  ; odd accumulator

dec num
       
cmp num, 0
jb fine   

ciclo:  inc ax
        add bx, 2
        sub num, bx
        cmp num, 0
        jge ciclo
 
fine:
.exit
end