
# Summary of Problems and Solutions


* #### C2200h adresindeki veri ‘K’ ise F2500h adresini sıfırlayan bir program yazınız.

```assembly
MOV BX, C000h ;BX <- C000h 
MOV DS, BX ;DS <- BX 
MOV DL, [2200]  ; DL <- [DS:2200]

CMP DL, 4Bh ;Compare DL, 4Bh
JNZ Son ;ZF==0 -> Son

MOV BX, F000h ;BX <- F000h
MOV DS,BX  ; DS <- BX
MOV[2500], 00h ; [DS:2500] <- 00h

Son:
```

<br>
<br>
<br>

* ####  C2200h adresindeki veri ‘K’ veya ‘k’ ise F2500h adresini sıfırlayan bir program yazınız.

```assembly
MOV BX, C000h ;BX <- C000h 
MOV DS, BX ;DS <- BX 
MOV DL, [2200] ;DL <- [DS:2200]

MOV BX, C000h ;BX <- C000H 
MOV DS, BX ;DS <- BX 
MOV DL, [2200] ;DL <- [DS:2200]
CMP DL, 4Bh ;Compare DL, 4Bh
JZ Devam ;ZF==1 <- Devam
CMP DL, 6Bh ;Compare DL, 6Bh
JZ Devam ;ZF==1 <- Devam


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

