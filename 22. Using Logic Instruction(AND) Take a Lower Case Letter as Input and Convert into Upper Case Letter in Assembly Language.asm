
;Title:- Using Logic Instruction(AND)Take a Lower Case Letter as Input and Convert into Upper Case Letter in Assembly Language

;Purpose: Solve Some Easy Problem in Assembly Language
;@author Md. Sadikul Islam Shuvo 
 
 PRINT MACRO P
    MOV AH,9
    LEA DX,P		
    INT 21H
    ENDM
 
 .MODEL SMALL
 .STACK 100H
 .DATA
 STR1 DB "Enter a Small Letter: $" 
 STR2 DB "Capital Letter is: $"

 .CODE
 MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    CALL NEW_LINE
    
    AND BL,0DFH
    
    PRINT STR2
    MOV AH,2 
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
 ENDP  
 
 New_Line PROC
    MOV AH,2
    MOV DX,10
    INT 21H       
    MOV AH,2		 
    MOV DX,13
    INT 21H
    RET 
    ENDP
 