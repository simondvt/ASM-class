.model small
.stack
.data
  
giorni db 200
ore    db  8
minuti db 45   

risultato dw ?

.code
.startup

; totale ore
mov al, giorni
cbw
mov dx, 24
mul dx
cmp dx, 0
jne err 
mov bx, 0
mov bl, ore
add ax, bx 
jc err
; totale minuti 
mov dx, 60
mul dx 
cmp dx, 0
jne err     
mov bx, 0
mov bl, minuti
add ax, bx 
jc err

mov risultato, ax


err: mov risultato, 0FFFFh

.exit
end