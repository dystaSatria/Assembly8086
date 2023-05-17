ORG 100h

MOV BX, 0A000h
MOV BX, 1234h 
 
MOV AL, [BX] 


JMP KontrolA1000h 
JMP KontrolB2000h
 
JNE Cikis 

KontrolA1000h: 
MOV SI, OFFSET A1000h
MOV AL, BYTE PTR [SI] 
CMP AL, 45h  ; 'E'   
JMP SifirlaD3000h 
CMP AL, 65h    ; 'e'
JMP SifirlaD3000h 
JNE Cikis


KontrolB2000h:
MOV SI, OFFSET B2000h
MOV AL, BYTE PTR [SI] 
MOV AL, [BX]
CMP AL, 32h  ; 2
JMP SifirlaD3000h
JNE Cikis 

SifirlaD3000h:
MOV SI, D3000h 
MOV BYTE PTR [SI], 0 

Cikis:
ret
 

A1000h EQU 0A100h
B2000h EQU 0B200h
D3000h EQU 0D300h

