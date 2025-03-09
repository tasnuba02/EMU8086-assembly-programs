ORG 100H

MOV DX, OFFSET msg   ; Load prompt message
MOV AH, 09H          ; DOS function to print a string
INT 21H              ; Call DOS interrupt

MOV SI, OFFSET buffer ; SI points to input buffer
MOV CX, 20           ; Max input length
MOV AH, 0AH          ; DOS buffered input function
INT 21H              ; Call DOS interrupt

MOV AL, 13           ; Carriage return (ASCII 13)
MOV DL, AL
MOV AH, 02H          ; DOS function to print a character
INT 21H              ; Print carriage return

MOV AL, 10           ; Line feed (ASCII 10)
MOV DL, AL
MOV AH, 02H          ; DOS function to print a character
INT 21H              ; Print newline

MOV SI, OFFSET buffer+2  ; Skip buffer size bytes
PRINT_STRING:

    MOV DL, [SI]     ; Load character from buffer
    CMP DL, 0DH      ; Check for Enter (CR)
    JE END_PROGRAM   ; If Enter is found, end program

    MOV AH, 02H      ; DOS function to print a character
    INT 21H          ; Print character

    INC SI           ; Move to next character
    JMP PRINT_STRING ; Repeat

END_PROGRAM:
    MOV AH, 4CH      ; DOS function to terminate program
    INT 21H          ; Exit

msg DB 'Enter text: $'
buffer DB 20, 0, 20 DUP('$')  ; Input buffer (max 20 chars)

END




