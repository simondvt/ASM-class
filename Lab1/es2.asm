.model small
.stack
.data

n1 db 10   ; 10
n2 db 10h  ; 16
n3 db 10b  ;  2   

res db ?

.code
.startup

mov al, n1
add al, n2
sub al, n3

mov res, al

.exit
end                     