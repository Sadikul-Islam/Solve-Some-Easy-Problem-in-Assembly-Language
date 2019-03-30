
;Title:- Input Numbers in Array and Display Them in Assembly Language
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
STR1 DB "Enter The Number(1-9): $" 
STR2 DB "Enter The Elements(1-9): $"
STR3 DB "Elements are: $"
ARR  DB 10 DUP (?)

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1
    MOV AH,1
    INT 21H
    MOV AH,0
     
    SUB AX,48
    MOV BX,AX
    MOV CX,BX
    
    CALL New_Line
    
    PRINT STR2
    
    MOV SI,1
    
    Input:
    MOV AH,1
    INT 21H
    MOV ARR[SI],AL
    INC SI
    LOOP Input
    
    MOV SI,1
    MOV CX,BX
    
    CALL New_Line
    PRINT STR3
    
    Output:
    MOV AH,2
    MOV DL,ARR[SI]
    INT 21H
    INC SI
    CALL SPACE
    LOOP Output
    
    MOV AH,4CH
    INT 21H
    
ENDP

New_Line PROC
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV AH,2
    MOV DL,0DH
    INT 21H
    RET
ENDP  

SPACE PROC
    MOV AH,2
    MOV DL,20H
    INT 21H
    RET
ENDP


    