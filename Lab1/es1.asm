.MODEL SMALL
.STACK
.DATA

 var1 DB 'a'
 var2 DB 's'
 var3 DB 'm'  
 
 OFFST EQU ' '  ; lo spazio separa 'A' da 'a'
      
.CODE
.STARTUP 

MOV AH, 2   ; preparo output
    
; stampo var1          
MOV CL, var1
SUB CL, OFFST
MOV DL, CL  
INT 21H
            
; stampo var2                    
MOV CL, var2
SUB CL, OFFST
MOV DL, CL  
INT 21H 

; stampo var3                   
MOV CL, var3
SUB CL, OFFST
MOV DL, CL   
INT 21H

.EXIT
END