
;Title:- Input Numbers & PUSH to Stack & POP From Stack in Assembly Language

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
STR1 DB "Enter Numbers to Push Stack: $"
STR2 DB "Numbers Are Poping From Stack: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1 
    MOV BL,1
    
    
    LOOPS:
    MOV AH,1
    INT 21H

    CMP AL,0DH
    JE New_Line
    
    PUSH AX
    INC BL
    JMP LOOPS
    
    DISPLAY:
    POP AX
    MOV AH,2
    MOV DX,AX
    INT 21H
    
    CALL SPACE
    
    DEC BL
    CMP BL,1
    JE END
    JMP DISPLAY 
    
    New_Line: 
    MOV AH,2
    MOV DL,0AH
    INT 21H 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H 
    
    PRINT STR2
    
    JMP DISPLAY
    
    
    END:
    MOV AH,4CH
    INT 21H
ENDP 


SPACE PROC
    MOV AH,2
    MOV DL,20H
    INT 21H  
    RET
ENDP

