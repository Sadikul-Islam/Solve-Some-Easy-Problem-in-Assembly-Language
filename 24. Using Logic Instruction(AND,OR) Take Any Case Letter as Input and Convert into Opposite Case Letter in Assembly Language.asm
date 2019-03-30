
 ;Title:- Using Logic Instruction(AND/OR) Take Any Case Letter as Input and Convert into Opposite Case Letter in Assembly Language
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
 STR1 DB "Enter Any Letter: $"
 STR2 DB "You Entered Capital Letter!$"
 STR3 DB "You Entered Small Letter!$" 
 STR4 DB "Capital Letter Will be: $" 
 STR5 DB "Small Letter Will be: $"
 .CODE
 MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1
    MOV AH,1
    INT 21H
    MOV BL,AL
    CALL NEW_LINE
    
    CMP BL,65
    
    JGE LEVEL1

    LEVEL1:
    CMP BL,90
    
    JLE CAPITAL
    
    CMP BL,97
    
    JGE SMALL
    
    CAPITAL:
    OR BL,20H
    
    PRINT STR2
    CALL New_Line
    PRINT STR5
    
    MOV AH,2 
    MOV DL,BL
    INT 21H
    JMP END
    
    SMALL:
    AND BL,0DFH
    
    PRINT STR3
    CALL New_Line
    PRINT STR4
    
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
 