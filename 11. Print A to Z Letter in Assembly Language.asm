
;Title:- Print A to Z Letter in Assembly Language

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
STR1 DB "Printing A-Z: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BL,41H
    MOV CX,26
    
    PRINT STR1
    
    L1:
    MOV AH,2
    MOV DL,BL
    INT 21H
    CALL SPACE
    INC BL
    
    LOOP L1
    
    MOV AH,4CH
    INT 21H
ENDM

SPACE PROC
    MOV AH,2
    MOV DL,20H
    INT 21H
    RET
ENDP
