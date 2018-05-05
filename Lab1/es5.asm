          .model small
          .stack
          .data
          
          DIM equ 10
                                                                                                  
          vett dw 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 
          
          .code
          .startup    
               
               
          mov si, 0           ; primo
          mov di, 2*DIM - 2   ; ultimo  
          
          mov cx, DIM / 2  
          
   ciclo: mov ax, vett[si]
          mov bx, vett[di]
          mov vett[di], ax
          mov vett[si], bx    ; swap
          
          add si, 2
          sub di, 2           ; aggiorno contatori  
          
          loop ciclo 
          
          
          .exit
          end