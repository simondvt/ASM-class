.model small
.stack
.data

a dw 1
b dw -1
c dw 0

.code
.startup
          
; need to check whether b^2 - 4ac is >= 0
         
mov ax, b 
mul ax
; ax = b^2
push ax
   
mov ax, a
mov dx, c
mul dx
mov dx, 4
mul dx
; ax = 4ac

pop dx

cmp dx, ax
jge has_sol
mov ax, 0   ; flag NO SOLUTIONS
jmp fine

has_sol:
mov ax, 1   ; flag FOUND SOLUTIONS

fine:
.exit
end