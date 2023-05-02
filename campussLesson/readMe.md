# The Questions cheatsheet

## 1.  Hafızada 11000H adresinde bulunan 8 bitlik birinci sayı 12000H adresinde yeralan ikinci sayıdan büyük veya eşit ise birinci sayıyı 13000H adresine kaydeden programı yazınız.

if u use JNC :
```assembly
MOV CX, 1000h 
MOV DS, CX 
MOV AL, [1000] 
MOV DL, [2000] 
CMP AL, DL 
JNC DgrAta 
JMP Son
DgrAta : MOV [3000], AL 
Son :

```

Without JNC :

```assembly
MOV CX, 1000h 
MOV DS, CX 
MOV AL, [1000] 
MOV DL, [2000] 
CMP AL, DL
JC Son
MOV [3000], AL

```
