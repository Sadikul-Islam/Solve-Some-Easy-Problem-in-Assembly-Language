 
 ;Title:- Using Logic Instruction(OR)Take a Upper Case Letter as Input and Convert into Lower Case Letter in Assembly Language
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
 STR1 DB "Enter a Capital Letter: $" 
 STR2 DB "Small Letter is: $"
 
 .CODE
 MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    CALL NEW_LINE
    
    OR BL,20H
    
    PRINT STR2
    MOV AH,2 
    MOV DL,BL
    INT 21H
    
    END:
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
 