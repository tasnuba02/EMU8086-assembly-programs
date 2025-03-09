ORG 100H

MOV DX, OFFSET msg   ; Load prompt message
MOV AH, 09H          ; DOS function to print a string
INT 21H              ; Call DOS interrupt

MOV SI, OFFSET buffer ; SI points to input buffer
MOV CX, 20           ; Max input length
MOV AH, 0AH          ; DOS buffered input function
INT 21H              ; Call DOS interrupt

MOV SI, OFFSET buffer+2  ; Skip buffer size bytes
PRINT_STRING_SPACE:

    MOV DL, [SI]     ; Load character from buffer
    CMP DL, 0DH      ; Check for Enter (CR)
    JE ADD_SPACE     ; If Enter is found, add space

    MOV AH, 02H      ; DOS function to print a character
    INT 21H          ; Print character

    INC SI           ; Move to next character
    JMP PRINT_STRING_SPACE ; Repeat

ADD_SPACE:
    MOV DL, ' '      ; Load space character
    MOV AH, 02H      ; DOS function to print a character
    INT 21H          ; Print space

    MOV AH, 4CH      ; DOS function to terminate program
    INT 21H          ; Exit

msg DB 'Enter text: $'
buffer DB 20, 0, 20 DUP('$')  ; Input buffer (max 20 chars)

END
