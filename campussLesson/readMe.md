# The Question's Cheatsheet
.............................

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

<br>
<br>
<br>

* #### 1-14 e kadar olan sayıların toplamını 0000AH adresine kaydeden programı yazınız.

```
0000AH : 0000:000A
Sayaç : CL
```

```assembly
MOV CX, 0000h 
MOV DS, CX 
MOV CL, 00h 
MOV DL, 00h
Tekrar : INC CL
ADD DL,CL
CMP CL, 0Eh 
JNZ Tekrar 
MOV [000A], DL

```

<br>
<br>
<br>

* #### Hafızada 10005h adresinde bulunan 8 bitlik sayının (D7 – D0 || D7-0 ) 4. biti (D3) 1 ise sayıyı A0006h adresine transfer eden bir program yazınız.

```
10005H : 1000:0005 
A0006H : A000:0006
```

```assembly
MOV CX, 1000H 
MOV DS, CX 
MOV BL, [0005] 
MOV DL, BL
AND DL, 08H 
CMP DL, 00H 
JZ Son
MOV CX, A000H 
MOV DS, CX 
MOV [0006], BL
Son :
```
<br>
<br>
<br>


* #### E1200h adresinden başlayan toplam 100H Byte uzunluğundaki 8 bitlik pozitif sayılardan oluşan veri içinde kaç adet tek sayı olduğunu hesaplayan bir program yazınız.

```
E1200H  İlk sayı : E000:1200
E12FFH  Son sayı : E000:12FF
```

```assembly
MOV BX, E000h 
MOV DS, BX 
MOV DI, 1200h 
MOV CX, 0000h 
Tekrar : MOV AL, [DI] 
SHR AL,1
JNC Git
INC CX
Git : INC DI
CMP DI, 1300h 
JNZ Tekrar

```
<br>
<br>
<br>

* #### Hafızada 52000h adresinden başlayan 56 bitlik bir veriyi E3000h adresinden itibaren transfer eden bir program
yazınız.

```assembly

MOV CX, 5000h 
MOV DS, CX 
MOV SI, 2000 
MOV DI, 3000
Tekrar : MOV AL, [SI] 
MOV CX, E000h 
MOV DS, CX 
MOV [DI], AL
INC DI
INC SI
CMP DI, 3007h 
JZ Tekrar

```

