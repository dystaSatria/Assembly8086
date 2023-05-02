# The Questions cheatsheet (Hft 7 + 6)

* #### Hafızada 11000H adresinde bulunan 8 bitlik birinci sayı 12000H adresinde yeralan ikinci sayıdan büyük veya eşit ise birinci sayıyı 13000H adresine kaydeden programı yazınız.

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

<br>
<br>
<br>

* #### Hafızada 51000H adresinde bulunan 8 bitlik sayı 100 sayısından küçük ise sayıyı 52000H adresine, eşit ise 53000H adresine ve büyük ise 54000H adresine kaydeden programı yazınız.

```
51000H  : 5000:1000
52000H : 5000:2000 
53000H  : 5000:3000 
54000H : 5000:4000
  
```
```assembly
MOV DX, 5000h 
MOV DS, DX 
MOV AL, [1000] 
CMP AL, 64h
JC Kucuk
JZ Esit
MOV [4000], AL 
JMP Son
MOV [2000], AL ;kucuk
JMP Son 
MOV [3000], AL ;esit

son:
```
<br>
<br>
<br>



* #### Hafızada A1000H adresinde bulunan 8 bitlik sayı tek ise sayıyı AB000H adresine kaydeden programı yazınız.

```
A1000H sayı : A000:1000 (AL) 
AB000H : A000:B000 (Tek)
```
```assembly
MOV CX, A000h 
MOV DS, CX 
MOV AL, [1000] 
MOV BL,AL 
AND AL, 01h 
CMP AL, 00h
JZ Son
MOV [B000], BL
Son :
```
<br>
<br>
<br>


* #### Hafızada A1000H adresinde bulunan 8 bitlik sayı tek ise, sayıyı AB000H adresine çift ise AC000H adresine kaydeden programı yazınız.

```
A1000H sayı : A000:1000 (AL) 
AB000H : A000:B000 (Tek)
AC000H : : A000:C000
```
```assembly
MOV CX, A000h 
MOV DS, CX 
MOV AL, [1000] 
MOV BL,AL 
AND AL, 01h CMP AL, 00h
JZ Çift
MOV [B000], BL
JMP Son
MOV [C000], BL ;Cift:
Son:
```



