
;Title:- Find Even and Odd Elements in Array in Assembly Language
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
STR1 DB "Enter the Number(1-9): $" 
STR2 DB "Enter The Array Elements(1-9): $"
STR3 DB "Even Numbers are: $"
STR4 DB "Odd Numbers are: $"
ARR  DB 10 DUP (?) 


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT STR1
    MOV AH,1
    INT 21H 
    
    XOR AH,AH
    SUB AX,48
    
    MOV CX,AX
    MOV BL,AL
    
    MOV SI,1
    
    Call New_Line
    
    PRINT STR2

    INPUT:
    MOV AH,1
    INT 21H 
    MOV ARR[SI],AL
    INC SI
    LOOP INPUT
    
    CALL NEW_LINE 
    
    PRINT STR3
    
    MOV SI,1
    XOR CX,CX
    MOV CL,0

    CHECK:
    CMP CL,BL
    JE CHECK2  
    
    TEST ARR[SI],1
    JZ EVEN
    INC SI
    INC CL 
    JMP CHECK 
    
    EVEN:
    MOV AH,2
    MOV DL,ARR[SI] 
    INT 21H
    MOV DL," "
    INT 21H
    INC SI
    INC CL
    JMP CHECK
    
    CHECK2:
    CALL NEW_LINE
    
    PRINT STR4
    
    MOV SI,1
    XOR CX,CX
    MOV CL,0
    
    CHECK3:
    CMP CL,BL
    JE END  
    
    TEST ARR[SI],1
    JNZ ODD
    
    INC CL
    INC SI
    JMP CHECK3
    
    
    ODD:
    MOV AH,2
    MOV DL,ARR[SI] 
    INT 21H
    MOV DL," "
    INT 21H
    INC SI
    INC CL
    JMP CHECK3
    
    END:
    MOV AH,4CH
    INT 21H
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

