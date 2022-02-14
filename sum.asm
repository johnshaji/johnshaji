READNUM MACRO NUM
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV NUM,AL
        ENDM
        
PRINTMSG MACRO MSG
         LEA DX,MSG
         MOV AH,09H
         INT 21H
         ENDM
         
DATA SEGMENT
           CR EQU 0DH
           LF EQU 0AH
           MSG1 DB 'ENTER THE FIRST NUMBER: $'
           MSG2 DB LF,CR,'ENTER THE NEXT NUMBER: $'
           MSG3 DB LF,CR,'SUM OF THE NUMBER IS: $'
           ARRAY DB 10 DUP(0)
           NUM DB ?
           RESULT DB 5 DUP('$')
           
DATA ENDS

CODE SEGMENT
          ASSUME CS:CODE,DS:DATA
          
START:    MOV AX,DATA
          MOV DS,AX
          
          MOV SI,OFFSET ARRAY
          MOV CH,00
          MOV CL,05H
          
          PRINTMSG MSG1
          READNUM NUM
          
          MOV AL,NUM
          MOV [SI],AL
          INC SI
          DEC CX
          
READNEXT: PRINTMSG MSG2
          READNUM NUM
          
          MOV AL,NUM
          MOV [SI],AL
          INC SI
          LOOP READNEXT
          
          MOV SI,OFFSET ARRAY
          MOV AX,0000H
          MOV CX,0005H
          
ADDNEXT:  MOV BL,[SI]
          MOV BH,00H
          ADD AX,BX
          INC SI
          LOOP ADDNEXT
          
          MOV SI,OFFSET RESULT
          CALL HEX2ASCII
          
          PRINTMSG MSG3
          PRINTMSG RESULT
          
          MOV AL,00H
          MOV AH,4CH
          INT 21H
          
HEX2ASCII PROC NEAR
          MOV BL,0AH
          DIV BL
          ADD AL,30H
          MOV [SI],AL
          INC SI
          ADD AH,30H
          MOV [SI],AH
          INC SI
          MOV AL,'$'
          MOV [SI],AL
          RET
HEX2ASCII ENDP

CODE ENDS
END START


          
