;;Snake.asm
;;Matt Schnider
;;Fall 2016
;;Dr. Allen

INCLUDE Irvine32.inc

RCC Struct                    						;; Struct for keeping track of a BYTE, Row Col Char
     Row       BYTE          0
     Col       BYTE          0
     Char      BYTE          'X'
RCC ENDS
.data
snake     RCC       <0,37,'+'>,<0,38,'*'>,<0,39,'*'>,<0,40,1>, 202 DUP(<0,0,0>)
currSize       BYTE            04h
time           DWORD            500
keyPress       DWORD           4D00h
.code


main PROC
   call drawSnake
TOP:
     call ReadKey
     jnz PRESS
     jmp NEXT
PRESS:
     call processKey
NEXT:
     cmp keyPress, 4D00h
     je RIGHT
        
     RIGHT:
       
       jnz QUIT 
       call moveSnakeRight
       mov eax, time
       call delay
       jmp RIGHT
jmp TOP
QUIT:
     exit
main ENDP

processKey PROC
     cmp al,0
     je L1
L1:
     

     RET
ProcessKey ENDP
moveSnakeUp PROC
     pushad
     call clrscr
     mov al, currSize
     mov dl, sizeOF RCC
     mul dl
     sub ax, sizeOF RCC
     movzx esi, ax 
     cmp snake[esi].row, 0
     je TURN
     mov bl, snake[esi].col
     mov bh, snake[esi].row
     dec snake[esi].row
     sub esi, sizeOf RCC
     sub ecx,ecx
     mov cl, currSize
     dec cl
TOP:
     XCHG bl,snake[esi].col
     XCHG bh,snake[esi].row
     sub esi, sizeOF RCC

     loop Top
     jmp NOTURN
TURN:
     call moveSnakeRight
NOTURN:
 call drawSnake
     popad
     RET
moveSnakeUp ENDP
moveSnakeLeft PROC
     pushad
     call clrscr
     mov al, currSize
     mov dl, sizeOF RCC
     mul dl
     sub ax, sizeOF RCC
     movzx esi, ax 
     cmp snake[esi].col, 0
     je TURN
     mov bl, snake[esi].col
     mov bh, snake[esi].row
     dec snake[esi].col
     sub esi, sizeOf RCC
     sub ecx,ecx
     mov cl, currSize
     dec cl
TOP:
     XCHG bl,snake[esi].col
     XCHG bh,snake[esi].row
     sub esi, sizeOF RCC

     loop Top
     jmp NOTURN
TURN:
     call moveSnakeLeft
NOTURN:
 call drawSnake
     popad
     RET
moveSnakeLeft ENDP
moveSnakeDown PROC
     pushad
     call clrscr
     mov al, currSize
     mov dl, sizeOF RCC
     mul dl
     sub ax, sizeOF RCC
     movzx esi, ax 
     cmp snake[esi].row, 24
     je TURN
     mov bl, snake[esi].col
     mov bh, snake[esi].row
     inc snake[esi].row
     sub esi, sizeOf RCC
     sub ecx,ecx
     mov cl, currSize
     dec cl
TOP:
     XCHG bl,snake[esi].col
     XCHG bh,snake[esi].row
     sub esi, sizeOF RCC

     loop Top
     jmp NOTURN
TURN:
     call moveSnakeLeft
NOTURN:
 call drawSnake
     popad
     RET
moveSnakeDown ENDP
moveSnakeRight PROC
     pushad
     call clrscr
     mov al, currSize
     mov dl, sizeOF RCC
     mul dl
     sub ax, sizeOF RCC
     movzx esi, ax 
     cmp snake[esi].col, 79
     je TURN
     mov bl, snake[esi].col
     mov bh, snake[esi].row
     inc snake[esi].col
     sub esi, sizeOf RCC
     sub ecx,ecx
     mov cl, currSize
     dec cl
TOP:
     XCHG bl,snake[esi].col
     XCHG bh,snake[esi].row
     sub esi, sizeOF RCC

     loop Top
     jmp NOTURN
TURN:
     call moveSnakeDown
NOTURN:
 call drawSnake
     popad
     RET
moveSnakeRight ENDP
drawSnake PROC
   pushad
   mov esi, 0
   movzx ecx, currSize
TOP:
          mov dh, snake[esi].row
          mov dl, snake[esi].col
          call gotoxy
          mov al, snake[esi].char
          call writeChar
          add esi,sizeOf rcc
          loop TOP
     popad
   Ret
drawSnake ENDP

end main