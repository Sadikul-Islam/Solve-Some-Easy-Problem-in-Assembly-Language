
 ;Title:- Program For Generating Fibonacci Sequence Till 7th Position in Assembly Language

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
 STR1 DB "Fibonacci Sequence Till 7th Position: $"
 CNT DB ?
 A DB ?
 B DB ? 
 C DB ?
 D DB ?

 .CODE
 MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BL,0
    MOV BH, 1
    MOV CX,5
    MOV CNT,1
    
    PRINT STR1
    
    START:
    CMP CNT,1
    JE Print_0
    
    CMP CNT,2
    JE Print_1 
     
    LOOPS:
    ADD BL,BH 
    MOV B,BL
    
    MOV BL,BH
    MOV BH,B
    
    ADD B,48
    
    MOV AH,2 
    MOV DL,B
    INT 21H
    
    CALL SPACE 
    
    LOOP LOOPS
    
    JMP END
    
    Print_0:
    MOV C,BL
    ADD C,48
    
    MOV AH,2 
    MOV DL,C
    INT 21H
     
    INC CNT
    CALL SPACE
    JMP START
    
    Print_1: 
    MOV D,BH
    ADD D,48
    
    MOV AH,2 
    MOV DL,D
    INT 21H
     
    INC CNT  
    CALL SPACE
    JMP START
    
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
