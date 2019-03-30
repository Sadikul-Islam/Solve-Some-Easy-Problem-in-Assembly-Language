
;Title:- Take Two Inputs of Three Digit Number and Find the Summation(0-999) in Assembly Language 
;Purpose: Solve Some Easy Problem in Assembly Language
;@author Md. Sadikul Islam Shuvo

 
PRINT MACRO P
    MOV AH,9
    LEA DX,P
    INT 21H
ENDM

PRINT2 MACRO P
    ADD P,48
    MOV AH,2
    MOV DX,P
    INT 21H
ENDM


.MODEL SMALL
.STACK 100H

.DATA
STR1 DB "Please Enter First Three Digit number: $" 
STR2 DB "Please Enter Second Three Digit number: $"
STR3 DB "Summation is(0-999): $" 
A DW  ?
B DW  ?
C DW  ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
     
    ;For First Input
    PRINT STR1
    
    MOV AH,1
    INT 21H
    SUB AL,48 
    
    XOR AH,AH
    MOV A,100
    MUL A
    MOV B,AX
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    XOR AH,AH
    MOV A,10
    MUL A
    ADD B,AX
    
    MOV AH,1
    INT 21H
    SUB AL,48

    XOR AH,AH
    ADD B,AX

    ;For Second Input
    CALL New_Line
    
    PRINT STR2
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    XOR AH,AH
    MOV A,100
    MUL A
    MOV C,AX
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    XOR AH,AH
    MOV A,10
    MUL A
    ADD C,AX
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    XOR AH,AH
    ADD C,AX

    ;SUMMATION
    MOV BX,B
    MOV CX,C
    ADD BX,CX
    MOV B,BX
    
    CALL New_Line
    
    PRINT STR3
    
    MOV AX,0
    MOV A,100
    MOV AX,B
    XOR DX,DX
    DIV A
    MOV B,AX
    MOV C,DX
    
    MOV BX,B
    PRINT2 BX
    
    MOV AX,0
    MOV A,10
    MOV AX,C
    XOR DX,DX
    DIV A
    MOV B,AX
    MOV C,DX
    
    MOV BX,B
    PRINT2 BX
    
    MOV CX,C
    PRINT2 CX

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