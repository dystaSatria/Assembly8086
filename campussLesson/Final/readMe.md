
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
JZ Devam ;

JMP Son

Devam: MOV BX, F000h
       MOV DS, BX
       MOV[2500], 00h
Son: 
```
<br>
<br>
<br>



* #### C2200h adresindeki veri ‘K’ ve C2300h adresindeki veri ‘p’ ise F2500h adresini sıfırlayan bir program yazınız.

```
A1000H sayı : A000:1000 (AL) 
AB000H : A000:B000 (Tek)
```
```assembly
MOV BX, C000h ;BX  C000h 
MOV DS, BX ;DS  BX 
MOV DL, [2200] ;DL  [DS:2200]
MOV DH, [2300] ;DH  [DS

CMP DL, 4Bh ;Compare DL , 4Bh
JNZ Son ;ZF==0  Son

CMP DH, 70h ;Compare DH, 70h
JNZ Son ;ZF==0  Devam

MOV BX , F000h ;BX  F000h 
MOV DS, BX ;DS  BX 
MOV [2500], 00h ;[DS:2500]  00h

Son: 
```
<br>
<br>
<br>



