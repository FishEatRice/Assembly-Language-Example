.MODEL SMALL
.STACK 100
.DATA
	
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	
	
	MOV AX,4c00H
	INT 21H
MAIN ENDP
END MAIN