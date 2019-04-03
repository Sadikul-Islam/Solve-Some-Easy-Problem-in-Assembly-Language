
;Title:- Take Two Inputs and Find How Many Bits Need to Exchange to Convert Each Other in Assembly Language
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
STR1 DB "Enter The First Number: $"  
STR2 DB "Enter The Second Number: $" 
STR3 DB "Counted Bit Number is: $"
VAR1 DB ?
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV BL,AL
    
    CALL New_Line
    
    PRINT STR2
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV BH,AL
    
    XOR BL,BH 
    
    MOV VAR1,0
    
    MOV CX,8
    
    CALL New_Line
    
    PRINT STR3
    
    LL:
    
    TEST BL,1
    JZ SR
    INC VAR1
    SR:
    SHR BL,1
    LOOP LL
    
    ADD VAR1,48       
    MOV AH,2
    MOV DL,VAR1
    INT 21H
    
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
    