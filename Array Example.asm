.MODEL SMALL
.STACK 100
.DATA
	LIST DB 7,9,4,6
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX

	;Direct-offset
	MOV SI,3
	MOV AH,02H
	MOV DL,LIST[SI]
	ADD DL,30H
	INT 21H
	
	;Indirect-offset
	MOV SI,OFFSET LIST ;LEA SI,LIST
	MOV AH,02H
	MOV DL,[SI+3]
	ADD DL,30H
	INT 21H

	MOV AX,4c00H
	INT 21H
MAIN ENDP
END MAIN