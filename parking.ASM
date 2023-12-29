
.model small
.stack 100h
.data
menu db '*****************MENU*********************$'
menu1 db 'Press 1 for motorcycle$'
menu2 db 'Press 2 for cars$'
menu3 db 'Press 3 for bus$'
menu4 db 'Press 4 to show the record$'
menu5 db 'Press 5 to delete the record$'
menu6 db 'Press 6 to exit$'
msg1 db 'Parking Is Full$'
msg2 db 'Wrong input$'
msg3 db 'car$'
msg4 db 'bus$'
msg5 db 'record$'
msg6 db 'there is more space$'
msg7 db 'the total amount is=$'
msg8 db 'the total numbers of vehicles parked=$'
msg9 db 'the total number of motorcycle parked=$'
msg10 db 'the total number of cars parked=$'
msg11 db 'the total number of buses parked=$'
msg12 db '***Record deleted successfully***$'
amount dw 0
count dw  '0'


r dw '0'
c db '0'
b db '0'
.code
main proc far

.startup

;menu

while_:   
             
mov dx,10
mov ah,2
int 21h


lea dx,menu
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h

lea dx,menu1
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h


lea dx,menu2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h



lea dx,menu3
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h



lea dx,menu4
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h




lea dx,menu5
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h



lea dx,menu6
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h



;userinput

mov ah,1
int 21h

mov bl,al

mov dx,10
mov ah,2
int 21h


;compare
mov al,bl
cmp al,'1'
je motorcycle
cmp al,'2'
je car
cmp al,'3'
je bus
cmp al,'4'
je rec
cmp al,'5'
je del
cmp al,'6'
je end_


lea dx,msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h


jmp while_

motorcycle:
call motorcyclee


car:
call caar


rec:
call recrd


del:
call delt


bus:
call buss



end_:
.exit

main endp





motorcyclee proc near
cmp count,'8'
jle motorcycle1
lea dx,msg1
mov ah,9
int 21h

jmp while_

motorcycle1:
mov ax,200
add amount, ax
mov dx,0 
mov bx,10 
mov cx,0
l2:
        div bx
        push dx
        mov dx,0  
        inc cx
        cmp ax,0
        jne l2
   
l3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
        loop l3

inc count
inc r

jmp while_


caar proc near
cmp count,'8'
jle car1
lea dx,msg1
mov ah,9
int 21h
jmp while_


car1:
mov ax,300
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l22:
        div bx
        push dx
        mov dx,0
        inc cx
        cmp ax,0
       jne l22
   
l33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
        loop l33


inc count
inc c

jmp while_




buss proc near
cmp count,'8'
jle bus1
lea dx,msg1
mov ah,9
int 21h

jmp while_


bus1:
mov ax,400
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l222:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l222
   
l333:
        pop dx
        add dx,48
        mov ah,2
        int 21h
        loop l333


inc count
inc b

jmp while_


recrd proc near
lea dx,msg7
mov ah,9
int 21h


mov ax, amount

mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
        loop totalprint




mov dx,10
mov ah,2
int 21h








lea dx,msg8
mov ah,9
int 21h

mov dx,count
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h



lea dx,msg9
mov ah,9
int 21h

mov dx,r
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h




lea dx,msg10
mov ah,9
int 21h


mov dl,c
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h




lea dx,msg11
mov ah,9
int 21h

mov dl,b
mov ah,2
int 21h

jmp while_


delt proc
mov r,'0'
mov c,'0'
mov b,'0'
mov amount,0
mov count,'0'

lea dx,msg12
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h





jmp while_










end main
