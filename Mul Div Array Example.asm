.MODEL SMALL
.STACK 100
.DATA
	NUM DB 2,5,6,8,1,7
	NL DB 0AH,0DH,"$"
	TEN DB 10
	SPACE DB " $"
	TWO DB 2
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	MOV SI,0
	MOV CX,0
	MOV CL,6
	SHOW:
		MOV AH,0
		MOV AL,NUM[SI]
		MUL TWO
		DIV TEN
		MOV BX,AX
		
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
		
		MOV AH,02H
		MOV DL,BH
		ADD DL,30H
		INT 21H
		
		MOV AH,09H
		LEA DX,SPACE
		INT 21H
		
		MOV AH,09H
		LEA DX,SPACE
		INT 21H
		
		INC SI
		
	LOOP SHOW
	
	MOV AX,4c00H
	INT 21H
MAIN ENDP
END MAIN