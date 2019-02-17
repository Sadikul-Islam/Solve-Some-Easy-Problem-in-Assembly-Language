
;Title:- Take two input in two digit numbers and find sum in Assembly Language

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
STR1 DB "Please Enter First Number: $"
STR2 DB "Please Enter Second Number: $"
STR3 DB "Summation is: $" 

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    MOV BL,10
    MUL BL
    MOV BH,AL
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    ADD BH,AL
    
    CALL New_Line
    
    PRINT STR2
    MOV AH,1
    INT 21H
    SUB AL,48
    
    MUL BL
    MOV CL,AL
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    ADD CL,AL
    
    ADD CL,BH 
    
    CALL New_Line
    
    PRINT STR3
    
    MOV BL,10
    MOV AX,0 
    MOV AL,CL
    DIV BL
    MOV BL,AL
    MOV BH,AH
    
    ADD BL,48
    ADD BH,48
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,4CH
    INT 21H
ENDM

New_Line PROC
    MOV AH,2
    MOV DL,10
    INT 21H
    
    MOV AH,2
    MOV DL,13
    INT 21H
    RET
ENDP

