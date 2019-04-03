
;Title:- Using SHIFT/ROTATE Instruction Take 8 Bits (Only 0,1) as Input And Reversely Print Them in Assembly Language
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
STR1 DB "Enter 8 Bits To Reverse (Only 0,1): $"
STR2 DB "Reversed Bits Are: $"
      
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1
    
    MOV CX,8
    MOV AH,1
    LL1:
    INT 21H
    SHR AL,1
    RCR BL,1
    LOOP LL1
    
    MOV CX,8
    LL2:
    
    SHR BL,1
    RCL BH,1
    LOOP LL2 
    
    CALL New_Line
    PRINT STR2

    MOV AH,2
    MOV CX,8
    LL3:
    
    SHR BH,1
    JC ONE
    MOV DL,48
    INT 21H
    JMP SKIP
    
    ONE:
    MOV DL,49
    INT 21H 
    SKIP:
    LOOP LL3
    
    MOV AH,4CH
    INT 21H
 
    MAIN ENDP

New_Line PROC
    MOV AH,2
    MOV DL,0AH
    INT 21H 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H 
    RET
ENDP
