

org 100h

MOV DX, 5000h 
MOV DS, DX 
MOV AL, [1000] 
CMP AL, 64h
JC Kucuk
JZ Esit
MOV [4000], AL 
JMP Son
Kucuk : MOV [2000], AL ;kucuk
JMP Son 
Esit : MOV [3000], AL ;esit

son:
    ret




