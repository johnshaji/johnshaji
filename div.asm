DATA SEGMENT
         MSG1 DB 'ENTER THE FIRST NUMBER (DIVIDEND): $'
         MSG2 DB 0AH,0DH,'ENTER THE SECOND NUMBER (DIVISOR): $'
         MSG3 DB 0AH,0DH,'THE QUOTIENT IS= $'
         MSG4 DB 0AH.0DH,'THE REMAINDER IS= $'
         NUM1 DB ?
         NUM2 DB ?
         QNT DB ?
         REM DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:    MOV AX,DATA
          MOV DS,AX
          
          LEA DX,MSG1      ;Print MSG1
          MOV AH,09H
          INT 21H
          
          MOV AH,01H
          INT 21H          ;Read the first number
          SUB AL,30H       ;Convert the ASCII value to binary
          MOV NUM1,AL      ;Store the first number in NUM1
          
          LEA DX,MSG2      ;Print MSG2
          MOV AH,09H
          INT 21H
          
          MOV AH,01H       
          INT 21H          ;Read the first number
          SUB AL,30H       ;Convert the ASCII value to binary
          MOV NUM2,AL      ;Store the first number in NUM2
    
          MOV AL,NUM1
          MOV AH,00H
          MOV BL,NUM2
          DIV BL
          
          ADD AL,30H
          MOV QNT,AL
          ADD AH,30H
          MOV REM,AH
          
          LEA DX,MSG3
          MOV AH,09H
          INT 21H
          
          MOV DL,QNT
          MOV AH,02H
          INT 21H
          
          LEA DX,MSG4
          MOV AH,09H
          INT 21H
          
          MOV DL,REM
          MOV AH,02H
          INT 21H
         
          MOV AH,4CH
          INT 21H
CODE ENDS
END START
