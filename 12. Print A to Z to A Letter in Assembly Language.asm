
;Title:- Print A to Z to A Letter in Assembly Language

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
STR1 DB "Printing A-Z-A: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,51
    
    MOV BL,41H
    MOV BH,1 
    
    PRINT STR1
    
    L1:
    CMP BH,25
    JLE L2
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    DEC BL
    JMP L3
    
    
    L2:
    MOV AH,2
    MOV DL,BL
    INT 21H
    INC BL
    JMP L3
    
    L3:
    CALL SPACE
    INC BH
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

