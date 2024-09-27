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
	MOV CX,4
	L1:
		MOV AH,02H
		MOV DL,LIST[SI]
		ADD DL,30H
		INT 21H
		INC SI
	LOOP L1
	
	;Indirect-offset
	MOV SI,OFFSET LIST ;LEA SI,LIST
	MOV CX,4
	L2:
		MOV AH,02H
		MOV DL,[SI]
		ADD DL,30H
		INT 21H
		INC SI
	LOOP L2

	MOV AX,4c00H
	INT 21H
MAIN ENDP
END MAIN