
;Title:- Take Three Input Numbers and Find The Largest Number among them in Assembly Language

;Purpose: Solve Some Easy Problem in Assembly Language
;@author Md. Sadikul Islam Shuvo


PRINT1 MACRO P
    MOV AH,9
    LEA DX,P		;PRINT str
    INT 21H
ENDM 

PRINT2 MACRO P
    MOV AH,2
    MOV DL,P
    INT 21H
ENDM


.MODEL SMALL
.STACK 100H

.DATA
str1 DB "Please Enter First Number: $"
str2 DB "Please Enter Second Number: $"
str3 DB "Please Enter Third Number: $"
str4 DB "Maximum Number is: $"


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT1 Str1
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CALL New_Line
    
    PRINT1 Str2
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    CALL New_Line
    
    PRINT1 Str3
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    CALL New_Line
    
    CMP BL,BH
    JG MAX1
    
    
    ;CMP BL,CL
     
    
    
    CMP BH,CL
    JG MAX3
    
    PRINT1 str4
    PRINT2 CL
    MOV AH,4CH
INT 21H
    
    
    
    MAX1:
    CMP BL,CL
    JG MAX2
    
    PRINT1 str4
    PRINT2 CL
    MOV AH,4CH
INT 21H
    
    
    
    MAX2:
    PRINT1 str4
    PRINT2 BL
    MOV AH,4CH
INT 21H
    
    
    MAX3:
    PRINT1 str4
    PRINT2 BH
    MOV AH,4CH
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
    ENDP



END MAIN
