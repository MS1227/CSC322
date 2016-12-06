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
time           DWORD           500
keyPress       WORD          4D00h
.code


main PROC

   call drawSnake
TOP:
   call Readkey
   jnz pressEvent
	jmp L1

pressEvent:
	call processKey
	
L1:	cmp keyPress, 4D00h
	jne L2
	call moveSnakeRight
	mov eax, time
	call delay
	jmp Top
L2: cmp keyPress, 4B00h
	jne L3
	call moveSnakeLeft
	mov eax, time
	call delay
	jmp TOP
L3: cmp keyPress, 5000h
	jne L4
	call moveSnakeDown
	mov eax, time
	call delay
	jmp TOP
L4: cmp keyPress, 4800h
	jne L5
	call moveSnakeUp
	mov eax, time
	call delay
	jmp TOP
L5: cmp keyPress, 4E2Bh
	jne L6
	cmp time, 0
	je NOLESS
	sub time, 100
NOLESS:
	mov keypress, bx
	jmp TOP
L6: cmp keyPress, 4A2Dh
	jne L7
	cmp time, 1000
	je NOMORE
	add time, 100
NOMORE:
	mov keypress, bx
	jmp TOP
L7: cmp keyPress, 372Ah
	jne L8
	cmp currSize, 205
	je Top
	call growSnake
	mov keypress, bx
	jmp Top
L8: cmp keyPress, 1051h
	je QUIT
L9: cmp keyPress, 1071h
	jne TOP
	
QUIT:
	
     exit
main ENDP
growSnake PROC
pushad
	 mov al, currSize
     mov dl, sizeOF RCC
     mul dl
     sub ax, sizeOF RCC
     movzx esi, ax
	 mov bl, snake[esi].col
	 mov bh, snake[esi].row
	 mov dl, snake[esi].char
	 mov snake[esi].char, '*'
	 add esi, sizeOF RCC
	 mov snake[esi].col,bl
	 mov snake[esi].row,bh
	 mov snake[esi].char, dl
	 inc currSize
	 call drawSnake 
popad
 ret
growSnake ENDP
processKey PROC
	mov bx, keypress
	mov keypress, ax
	
     RET
ProcessKey ENDP
moveSnakeUp PROC
     pushad
     call clrscr
	 mov keyPress, 4800h
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
	 mov keyPress, 4B00h
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
     call moveSnakeUp
NOTURN:
 call drawSnake
     popad
     RET
moveSnakeLeft ENDP
moveSnakeDown PROC
     pushad
     call clrscr
	 mov keyPress, 5000h
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