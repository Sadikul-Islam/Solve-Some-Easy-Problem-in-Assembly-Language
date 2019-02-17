
;Title:- Hello World Print in Assembly Language

;Purpose: Solve Some Easy Problem in Assembly Language
;@author Md. Sadikul Islam Shuvo


PRINT MACRO P
    MOV AH,9
    LEA DX,P		;PRINT string
    INT 21H
    ENDM

.MODEL SMALL
.STACK 100H

.DATA
str DB "Hello World, Welcome to Some Easy Assembly Code By Sadikul Islam$"


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT str
 
    
MOV AH,4CH
INT 21H
        
ENDP


END MAIN
