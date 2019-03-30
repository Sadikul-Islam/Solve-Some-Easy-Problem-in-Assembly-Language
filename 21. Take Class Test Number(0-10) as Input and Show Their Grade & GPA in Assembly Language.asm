
;Title:- Take Class Test Number(0-10) as Input and Show Their Grade & GPA in Assembly Language

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

;I am Just Assume This Values, You Can Edit as Your Wish

STR1 DB "Grade: A/A+  & GPA: 4.00$"  ;If Class Test Number 9 or 10
STR2 DB "Grade: B  & GPA: 3.00$"  ;If Class Test Number 8
STR3 DB "Grade: C  & GPA: 2.00$"  ;If Class Test Number 7
STR4 DB "Grade: D  & GPA: 1.00$"  ;If Class Test Number 6
STR5 DB "Grade: F  & GPA: 0.00$"  ;If Class Test Number 5 or below
STR6 DB "Give Class Test Number: $"
ARR DB 10 DUP (?)

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    
    MOV SI,0
    
    INPUT: 
    MOV AH,1
    INT 21H 
    
    MOV ARR[SI],AL
    INC SI
    
    MOV BL,AL 
    CMP BL,0DH
    JE START
    
    JMP INPUT
    
    START: 
    CMP SI,2
    JG A
    
    MOV CL,ARR[0]
    SUB CL,48
     
    CMP CL,9
    JGE A 
    
    CMP CL,8
    JE B 
    
    CMP CL,7
    JE C
    
    CMP CL,6
    JE D 
    
    CMP CL,5
    JLE F
    
    A:
    CALL New_Line
    PRINT STR1
    JMP END
    
    B: 
    CALL New_Line
    PRINT STR2
    JMP END 
    
    C:   
    CALL New_Line
    PRINT STR3
    JMP END 
    
    D:
    CALL New_Line
    PRINT STR4
    JMP END 
    
    F: 
    CALL New_Line
    PRINT STR5
    JMP END
    
    END:
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
