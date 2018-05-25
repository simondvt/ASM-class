.model small
.stack
.data

string db "hello world", 0
upper_string db 12 dup(?)

.code

proc to_upper 
    ; check for alpha 
    cmp al, 97
    jl finep
    cmp al, 123
    jge finep
    
    sub al, 32
    
    finep:
    ret
to_upper endp

.startup

mov si, 0  

ciclo:

    mov al, string[si]
    cmp al, 0
    jz fine
    call to_upper
    mov upper_string[si], al
    
    inc si 
    jmp ciclo
    

fine:
.exit
end                    