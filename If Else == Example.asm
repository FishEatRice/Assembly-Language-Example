.MODEL SMALL
.STACK 100
.DATA
	FEMALE DB "FEMALE$"
	MALE DB "MALE$"
	DISPLAY DB "Enter gender (m/f): $"
	INPUT DB ?
	NL DB 0AH,0DH,"$"
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	MOV AH,09H
	LEA DX,DISPLAY
	INT 21H
	
	MOV AH,01H
	INT 21H
	MOV INPUT, AL
	
	MOV AH,09H
	LEA DX,NL
	INT 21H
	
	CMP INPUT,"m"
	JE SAME
	JNE XSAME
	
	SAME:
		MOV AH,09H
		LEA DX,MALE
		INT 21H
	JMP FIN
	
	XSAME:
		MOV AH,09H
		LEA DX,FEMALE
		INT 21H
	
	FIN:
	
	MOV AX,4c00H
	INT 21H
MAIN ENDP
END MAIN