

org 100h


MOV CX,A000h 
MOV DS,CX 
MOV AL,[1000] 
MOV BL,AL 
AND AL,01h 
CMP AL,00h
JZ Son
MOV [B000],BL

Son :  
    ret