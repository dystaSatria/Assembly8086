org 100h

mov ax, 06000h;60000H
mov dx, ax   

; 64KB hafiza modul 1

mov bx, ax   
mov di, bx   
add ax, 0FFFFh
mov bx, ax   
sub bx, dx   
mov dx, 06FFFh;6FFFFH  


; 64KB hafiza modul 2
mov ax, dx  
add ax, 07000h;70000H 
mov bx, ax  
mov es, bx   
mov bx, ax  
mov di, bx   
add ax, 0FFFFh 
mov bx, ax   
sub bx, dx  
mov cx, 07FFFh;7FFFFH  


; 128KB hafiza modul 1
mov ax, dx   
add ax, 08000h;80000H  
mov bx, ax   
mov es, bx  
mov bx, ax  
mov di, bx  
add ax, 01FFFh;1FFFFH 
mov bx, ax   
sub bx, dx  
mov bx, 09FFFh;9FFFFH   


; 128KB hafiza modülü 2
mov ax, dx   
add ax, 0A000h;A0000H   
mov bx, ax   
mov es, bx   
mov bx, ax   
mov di, bx  
add ax, 01FFFh;1FFFFH   
mov bx, ax  
sub bx, dx   
mov ax, 0BFFFh;BFFFFH   


ret