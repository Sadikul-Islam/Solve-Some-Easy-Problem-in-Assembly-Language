
;Title:- Input a Character and check Capital or Small or Number or Special Character in Assembly Language

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
str1 DB "Please Enter a Chracter: $"
str2 DB "It is a Capital Letter $"
str3 DB "It is a Small Letter $"
str4 DB "It is Number$"
str5 DB "It is a special Chracter$"


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT str1
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CALL New_Line
    
    CMP BL,48
    
    JGE Level1
    
    Print str5
    
    MOV AH,4CH
    INT 21H
    
    Level1:
    CMP BL,57
    
    JGE Level2
    
    PRINT str4
    MOV AH,4CH
    INT 21H
    
    Level2:
    CMP BL,65
    JGE LEVEL3
    
    print str5
    MOV AH,4CH
INT 21H
    
    
    Level3:
    CMP BL,90
    JGE Level4
    
    PRINT str2
    MOV AH,4CH
    INT 21H
    
    Level4:
    CMP BL,122
    JGE LEVEL5
    PRINT str3
    MOV AH,4CH
    INT 21H
    
    LEVEL5:
    PRINT str5
    MOV AH,4CH
INT 21H
    
    
    
 
    
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


Blank_Space PROC
    MOV AH,2
    MOV DX,32		   
    INT 21H
    RET 
    ENDP


END MAIN
