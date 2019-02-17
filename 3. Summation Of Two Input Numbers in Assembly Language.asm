
;Title:- Summation Of Two Input Numbers in Assembly Language

;Purpose: Solve Some Easy Problem in Assembly Language
;@author Md. Sadikul Islam Shuvo


PRINT MACRO P
    MOV AH,9
    LEA DX,P		;PRINT str
    INT 21H
    ENDM

.MODEL SMALL
.STACK 100H

.DATA
str1 DB "Please Enter First Number: $" 
str2 DB "Please Enter Second Number: $"
str3 DB "The Summation is: $"


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT str1
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CALL New_Line
    
    PRINT str2
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    CALL New_Line
    
    PRINT str3
    ADD BL,CL
    SUB BL,48
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
MOV AH,4CH
INT 21H
        
ENDP


New_Line PROC
    MOV AH,2
    MOV DX,10
    INT 21H       
    MOV AH,2		;CALL New_Line 
    MOV DX,13
    INT 21H
    RET
    New_Line ENDP


END MAIN
