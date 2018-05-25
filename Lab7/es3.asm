.model small
.stack
.data
          
DIM equ 2
          
address   dd 82C028D1h, 81C0276Ah 
mask      dd FFFC0000h
reference dd 82C0B685h

.code

proc filter
    push bp
    mov bp, sp
    ; stack              
    
    ; bp-2  ==> temp (local)
    
    ; bp+0  ==> old bp
    
    ; bp+2  ==> return address 
    ; bp+4  ==> return value
    ; bp+6  ==> offset mask
    ; bp+8  ==> offset address
    ; bp+10 ==> low reference
    ; bp+12 ==> high reference
    
    sub sp, 2  ; allocate space for temp 
    
    
    mov WORD PTR [bp+4], 0  ; init count 
    
    mov cx, DIM
    mov si, 0
    ciclo:        
        push cx
        
        ; check high 16 bits
        mov cx, 16                 
        b16: 
            ; ref bit in ax                               
            mov ax, 0
            shr WORD PTR [bp+12], 1
            adc ax, 0 
            
            ; mask bit in bx 
            mov di, [bp+6]
            add di, 2
            mov bx, [di]
            mov [bp-2], bx
            
            mov bx, 0
            
            shr [bp-2], 1
            
            push cx
            mov cx, [bp-2]
            mov [di], cx
            pop cx
            
            adc bx, 0
            
            ; addr bit in dx
            mov di, [bp+8]
            add di, si
            add di, 2 
            mov dx, [di]
            mov [bp-2], dx
            
            
            mov dx, 0
            shr [bp-2], 1 
            
            push cx
            mov cx, [bp-2]
            mov [di], cx
            pop cx
            
            adc dx, 0 
            
            test bx, bx  ; check mask bit 
            jz next16
            
            cmp ax, dx   ; check ref and addr
            jnz next
            
            next16:
            loop b16
        
        ; check low 16 bits
        mov cx, 16                     
        b32:
            ; ref bit in ax                             
            mov ax, 0
            shr WORD PTR [bp+10], 1
            adc ax, 0 
            
            ; mask bit in bx 
            mov di, [bp+6]
            mov bx, [di]
            mov [bp-2], bx
            
            mov bx, 0
            
            shr [bp-2], 1
            
            push cx
            mov cx, [bp-2]
            mov [di], cx
            pop cx
            
            adc bx, 0
            
            ; addr bit in dx
            mov di, [bp+8]
            add di, si
            mov dx, [di]
            mov [bp-2], dx
            
            
            mov dx, 0
            shr [bp-2], 1 
            
            push cx
            mov cx, [bp-2]
            mov [di], cx
            pop cx
            
            adc dx, 0
            
            test bx, bx  ; check mask bit 
            jz next32
            
            cmp ax, dx   ; check ref and addr
            jnz next
            
             
            next32: 
            loop b32      
        
        
        inc WORD PTR [bp+4]
        next:      
        pop cx 
        add si, 4
        loop ciclo   
    
    add sp, 2          
    pop bp   
    ret
filter endp   

.startup
   
   ; intel is LITTLE ENDIAN
   push WORD PTR [reference+2]  ; high
   push WORD PTR [reference]    ; low 
   
   push offset address
   push offset mask  
   
   sub sp, 2    ; space for return value
   call filter
   pop ax       ; return value
   
   add sp, 8    ; clean parameters

.exit
end