.model small
.stack
.data

m2 dw ?, ?
   dw ?, ?  
         
m3 dw 1, -2, 6
   dw 3, 5, 0
   dw 4, 8, 2

.code  
  
; finds determinant of m2 
; result in ax 
proc det2
                    
    push bx                
                    
    mov ax, [m2+2]  ; b
    mov dx, [m2+4]  ; c
    mul dx          
    mov bx, ax      ; bc
    
    mov ax, [m2]    ; a
    mov dx, [m2+6]  ; d
    mul dx          ; ad    
    
    sub ax, bx
     
    pop bx 
    ret
det2 endp

.startup

   mov bx, 0    ; det accumulator
   
   ; det2 respect to m(0, 0)
   mov cx, [m3+8]
   mov [m2], cx
   mov cx, [m3+10]
   mov [m2+2], cx
   mov cx, [m3+14]
   mov [m2+4], cx  
   mov cx, [m3+16]
   mov [m2+6], cx 
   call det2
   mul [m3]
   add bx, ax  
   
   ; det2 respect to m(0, 1)
   mov cx, [m3+6]
   mov [m2], cx
   mov cx, [m3+10]
   mov [m2+2], cx
   mov cx, [m3+12]
   mov [m2+4], cx  
   mov cx, [m3+16]
   mov [m2+6], cx 
   call det2  
   mul [m3+2]
   sub bx, ax  
   
   ; det2 respect to m(0, 2)
   mov cx, [m3+6]
   mov [m2], cx
   mov cx, [m3+8]
   mov [m2+2], cx
   mov cx, [m3+12]
   mov [m2+4], cx  
   mov cx, [m3+14]
   mov [m2+6], cx 
   call det2  
   mul [m3+4]
   add bx, ax

.exit
end        