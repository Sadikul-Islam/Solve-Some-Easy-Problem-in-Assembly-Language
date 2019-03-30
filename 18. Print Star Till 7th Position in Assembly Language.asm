
;Title:- Print * Till 7th Position in Assembly Language

;Purpose: Solve Some Easy Problem in Assembly Language
;@author Md. Sadikul Islam Shuvo

PRINT MACRO P
    MOV AH,9
    MOV DX, OFFSET P
    INT 21H
ENDM

.MODEL SMALL
.STACK 100H
.DATA
STR2 DB "* $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BL,0
    
    Loops:
    INC BL 
    CMP BL,8
    JE END
    
    IF: 
    MOV BH,0
    CMP BL,1
    JE Display_Star
    
    CMP BL,4
    JE Display_Star 
    
    CMP BL, 7
    JE Display_Star 
    
    
    ELSE:
    PRINT STR2 
    MOV BH,0 
    MOV CX,4
    Display_Star2:
    INC BH
    CMP BH,3
    JE LEVEL
    
    MOV AH,2
    MOV DL,20H
    INT 21H  
    MOV AH,2
    MOV DL,20H
    INT 21H
    LOOP Display_Star2 
    PRINT STR2
    
    JMP NewLine
    

    Display_Star:
    PRINT STR2
    INC BH
    CMP BH,7
    
    JNE Display_Star
    
    JMP NewLine 
  
    LEVEL:
    PRINT STR2
    JMP Display_Star2
 
    END:
    MOV AH,4CH
    INT 21H 
    
    NewLine:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H 
    JMP LOOPS
    
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






