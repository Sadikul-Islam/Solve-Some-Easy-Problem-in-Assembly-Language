
;Title:- Print * Till Nth Position in Assembly Language

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
STR1 DB "Enter The Number of Star(1-9): $"
STR2 DB "* $"
NUM1  DB ?
NUM2 DB ? 
VAR1 DB ?
VAR2 DB ?
VAR3 DW ?


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV AH,0
    
    
    MOV NUM1,AL
    
    MOV NUM2,AL
    INC NUM2
    
    MOV VAR3,AX
    SUB VAR3,3
    
    MOV BL,2
    DIV BL 
    
    MOV VAR2,AL
    
    MOV VAR1,AL
    INC VAR1 
    
    CALL New_Line
    
    MOV BL,0
    
    Loops:
    INC BL 
    CMP BL,NUM2     ;NUM2=NUM1+1
    JE END
    
    IF: 
    MOV BH,0
    CMP BL,1
    JE Display_Star
    
    CMP BL,VAR1     ;VAR1=NUM1/2+1
    JE Display_Star 
    
    CMP BL, NUM1    ;NUM1
    JE Display_Star 
    
    
    ELSE:
    PRINT STR2 
    MOV BH,0 
    MOV CX,VAR3     ;VAR3=NUM1-3
    
    Display_Star2:
    INC BH
    CMP BH,VAR2     ;VAR2=NUM1/2
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
    CMP BH,NUM1
    
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