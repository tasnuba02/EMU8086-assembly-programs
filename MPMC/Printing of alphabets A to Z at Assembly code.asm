.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC 
    MOV CL,65
    PRINT:
    
    MOV AH,2
    MOV BL,CL
    MOV DL,BL
    INT 21H
    INC CL
    CMP CL,90
    JLE PRINT 
EXIT:
MAIN ENDP
END MAIN