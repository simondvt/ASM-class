.model small
.stack
.data

prompt db "Inserisci un numero: $"
pari db 13, 0ah, "Il numero e' pari$"
dispari db 13, 0ah, "Il numero e' dispari$"
wrong db 13, 0ah, "Non e' un numero$"

.code
.startup
        
lea dx, prompt        
mov ah, 9h
int 21h  

; input in cx
mov cx, 0
        
leggi:  mov ah, 1
        int 21h 
        cbw 
        cmp ax, 13  ; ENTER
        je letto 
        cmp ax, 48
        jb err
        cmp ax, 57
        ja err      
        sub ax, 48 
        mov bx, ax
        mov ax, cx 
        mov dx, 10
        mul dx
        mov cx, ax 
        add cx, bx
        jmp leggi 
        
letto:
    shr cx, 1
    jc odd
    jmp even
    jmp fine
    
even: 
    lea dx, pari        
    mov ah, 0x9
    int 21h 
    jmp fine 
    
odd: 
    lea dx, dispari        
    mov ah, 0x9
    int 21h 
    jmp fine
    
err:
    lea dx, wrong        
    mov ah, 0x9
    int 21h            
      
fine:        
.exit
end