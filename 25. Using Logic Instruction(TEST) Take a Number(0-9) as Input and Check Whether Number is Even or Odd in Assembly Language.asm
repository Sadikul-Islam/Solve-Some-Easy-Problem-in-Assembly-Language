
;Title:- Using Logic Instruction(TEST) Take a Number(0-9) as Input and Check Whether Number is Even or Odd in Assembly Language

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
 STR1 DB "Number is Even$" 
 STR2 DB "Number is Odd$"
 STR3 DB "Enter a Number(0-9): $"
 .CODE
 MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR3
    
    MOV AH,1
    INT 21H
    
    TEST AL,1
    JZ EVEN
    JMP ODD

    EVEN: 
    CALL NEW_LINE
    PRINT STR1
    JMP END  
    
    ODD: 
    CALL NEW_LINE
    PRINT STR2
    
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
 