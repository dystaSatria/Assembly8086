# The Questions cheatsheet

* #### 1.  Hafızada 11000H adresinde bulunan 8 bitlik birinci sayı 12000H adresinde yeralan ikinci sayıdan büyük veya eşit ise birinci sayıyı 13000H adresine kaydeden programı yazınız.

```
11000H sayı1 : 1000:1000 (AL) 
12000H sayı2 : 1000:2000 (DL) 
13000H Hedef : 1000:3000
```

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
