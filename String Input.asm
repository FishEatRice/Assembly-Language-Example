.MODEL SMALL
.STACK 100
.DATA
	MSG DB "Enter a fruit: $"
	NL DB 0AH,0DH,"$"
	STR LABEL BYTE
	MAXN DB 20
	ACTN DB ?
	INPURSTR DB 20 DUP("$")
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	MOV AH,09H
	LEA DX,MSG
	INT 21H
	
	;INPUT STRING 
	MOV AH,0AH
	LEA DX,STR
	INT 21H
	
	MOV AH,09H
	LEA DX,NL
	INT 21H
	
	MOV AH,09H
	LEA DX,INPURSTR
	INT 21H
	
	
	
	MOV AX,4c00H
	INT 21H
MAIN ENDP
END MAIN