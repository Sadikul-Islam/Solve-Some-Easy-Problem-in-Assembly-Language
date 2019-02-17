
;Title:- Exit The Program When Input will be Capital 'X' or Small 'x' in Assembly Language

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
STR1 DB "Please Enter Inputs: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1
    
    INPUT:
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    CALL SPACE
    JMP Capital_X
    
    
    Capital_X:
    
    CMP BL,58H
    JNE Small_x
    JMP Exit 
    
    
    Small_x:
    
    CMP BL,78H
    JNE INPUT
    JMP Exit
 
    
    Exit:
    MOV AH,4CH
    INT 21H 
    
    
ENDM

SPACE PROC
    MOV AH,2
    MOV DL,20H
    INT 21H
    RET
ENDP


    
    
    