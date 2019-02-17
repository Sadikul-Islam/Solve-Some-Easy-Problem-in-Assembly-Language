
;Title:- Print 0 to 9 Digit in Assembly Language

;Purpose: Solve Some Easy Problem in Assembly Language
;@author Md. Sadikul Islam Shuvo


Print MACRO P
    MOV AH,9
    LEA DX,P
    INT 21H
ENDM

.MODEL SMALL
.STACK 100H

.DATA
STR1 DB "Printing 0-9: $"

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV CX,10 
    MOV BL,48
    Print STR1
    
    L1:
    MOV AH,2
    MOV DL,BL
    INT 21H
    INC BL
    CALL Space
    
    LOOP L1
    
    MOV AH,4CH
    INT 21H
ENDM

Space PROC
    MOV AH,2
    MOV DL,20H
    INT 21H
    RET
ENDP

    
    

    