
;Title:- Take Three Input Numbers and Find The Largest and Smallest Number among them in Assembly Language

;Purpose: Solve Some Easy Problem in Assembly Language
;@author Md. Sadikul Islam Shuvo

PRINT1 MACRO P
    MOV AH,9
    LEA DX,P		
    INT 21H
ENDM




PRINT2 MACRO P
    MOV AH,2
    MOV DL,P
    INT 21H
ENDM




MAX MACRO BL,BH,CL
    
    CMP BL,BH
    JG MAX1
     
    CMP BH,CL
    JG MAX3
    
    PRINT1 str4
    PRINT2 CL
    
    JMP level2
    

    MAX1:
    CMP BL,CL
    JG MAX2
    
    PRINT1 str4
    PRINT2 CL
    
    JMP level2
    
    
    
    MAX2:
    PRINT1 str4
    PRINT2 BL
    
    JMP level2
    
    
    MAX3:
    PRINT1 str4
    PRINT2 BH
    
    JMP level2
    
ENDM




MIN MACRO BL,BH,CH
    CMP BL,BH
    JL MIN1

    CMP BH,CL
    JL MIN3
    
    PRINT1 str5
    PRINT2 CL
    MOV AH,4CH
INT 21H
  
    MIN1:
    CMP BL,CL
    JL MIN2
    
    PRINT1 str5
    PRINT2 CL
    MOV AH,4CH
INT 21H
 
    MIN2:
    PRINT1 str5
    PRINT2 BL
    MOV AH,4CH
INT 21H

    MIN3:
    PRINT1 str5
    PRINT2 BH
    MOV AH,4CH
INT 21H
    
    ENDM



.MODEL SMALL
.STACK 100H

.DATA
str1 DB "Please Enter First Number: $"
str2 DB "Please Enter Second Number: $"
str3 DB "Please Enter Third Number: $"
str4 DB "Maximum Number is: $"
str5 DB "Minimum Number is: $"


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
    
    level1:
    MAX BL,BH,CL
    
    
    level2:
    CALL New_Line
    MIN BL,BH,CL
    
  
MOV AH,4CH
INT 21H
        
ENDP


New_Line PROC
    MOV AH,2
    MOV DX,10
    INT 21H       
    MOV AH,2		 
    MOV DX,13
    INT 21H
    RET 
    ENDP


END MAIN
