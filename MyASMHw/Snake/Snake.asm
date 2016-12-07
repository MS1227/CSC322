;;Snake.asm - a program that creates a moveable, growable happy snake! :) 
;;Matt Schnider
;;Fall 2016
;;Dr. Allen

INCLUDE Irvine32.inc

RCC Struct                    								;; Struct that has 3 elements, each 1 byte in size. The Elements are Row, Column, Char
     Row       BYTE          0
     Col       BYTE          0
     Char      BYTE          'X'
RCC ENDS
.data
snake     RCC       <0,37,'+'>,<0,38,'*'>,<0,39,'*'>,<0,40,1>, 202 DUP(<0,0,0>)  	;; An array of structs to hold the snake in memory. Array initially holds a small snake
currSize       BYTE            04h							;; but is big enough to have a snake that is 202 more characters big. The currSize var
time           DWORD           500							;; is set to 4 to reflect the current amount of characters in the snake. This will be used
keyPress       WORD          4D00h							;; to index the array when printing the snake out. The var keyPress is initialized to hold 
.code											;; the ASCII code of a right arrow key.


main PROC

   call drawSnake									;; drawSnake procedure is called to display the snake in the middle of the screen
TOP:											;; Label to mark the top of the program
   call Readkey										;; ReadKey proc called to check for any key presses. If a key has been pressed, the zero flag
   jnz pressEvent									;; will be cleared and the pressed key will be processed at the pressEvent label. Else, the program
	jmp L1										;; jumps to L1.

pressEvent:
	call processKey									;; processKey called to process a key press.
	
L1:	cmp keyPress, 4D00h								;; keyPress is compared to the ascii for a right arrow
	jne L2										;; if not equal, jump to L2
	call moveSnakeRight								;; Proc to move the snake right.
	mov eax, time									;; current time value is moved into the eax reg.
	call delay									;; delay proc is called to pause the program the specified amount of milliseconds in eax.
	jmp Top										;; jump back to the top to check for another key press.
L2: cmp keyPress, 4B00h									;; Same as above, but left arrow key.
	jne L3
	call moveSnakeLeft
	mov eax, time
	call delay
	jmp TOP
L3: cmp keyPress, 5000h									;; Same as above, but down arrow key.
	jne L4
	call moveSnakeDown
	mov eax, time
	call delay
	jmp TOP
L4: cmp keyPress, 4800h									;; Same as above, but up arrow key.
	jne L5
	call moveSnakeUp
	mov eax, time
	call delay
	jmp TOP
L5: cmp keyPress, 4E2Bh									;; Checks keyPress for a '+' key press which speeds up the snake. If the current time is not equal to 0
	jne L6										;; 100 is subracted from time. This decreases the amount of time the program pauses for the delay instruction.
	cmp time, 0
	je NOLESS
	sub time, 100
NOLESS:										
	mov keypress, bx								;; To return the snake back to moving after the speed change, the last direction is moved from the bx to 	
	jmp TOP										;; the keyPress var.
L6: cmp keyPress, 4A2Dh									;; Same as above, but time is added in 100ms increments until 1000ms to slow the snake movement down.
	jne L7
	cmp time, 1000
	je NOMORE
	add time, 100
NOMORE:		
	mov keypress, bx
	jmp TOP
L7: cmp keyPress, 372Ah									;; Check keyPress for a *. If found, call the growSnake proc to add one to the snake's body.
	jne L8
	cmp currSize, 205
	je Top
	call growSnake
	mov keypress, bx
	jmp Top
L8: cmp keyPress, 1051h									;; Check keyPress for a 'q' or 'Q' to trigger the program to exit.
	je QUIT
L9: cmp keyPress, 1071h
	jne TOP
	
QUIT:
	
     exit
main ENDP
growSnake PROC										;; Proc to grow the snake.
pushad											;; All 32bit regs are pushed onto the stack
	 mov al, currSize								;; the currSize if moved into the al reg
     mov dl, sizeOF RCC									;; the sizeof the RCC struct is then moved into the dl reg
     mul dl										;; the value in the dl is multiplied by the al
     sub ax, sizeOF RCC									;; the sizeof the RCC struct is then subtracted from the product to obtain the offset into memory
     movzx esi, ax									;; where the head currently is. The values there are then stored inthe bl, bh, and dl and a * overwrites
	 mov bl, snake[esi].col								;; the head. The size of the rcc struct is then added to the esi to point to the new location for th
	 mov bh, snake[esi].row								;; head. The values stored in the bl, bh, and dl reg are then moved into the new head struct.
	 mov dl, snake[esi].char							;; currSize is incremented so that the new head and * will be displayed on the next redraw of the snake.
	 mov snake[esi].char, '*'
	 add esi, sizeOF RCC
	 mov snake[esi].col,bl
	 mov snake[esi].row,bh
	 mov snake[esi].char, dl
	 inc currSize
	 call drawSnake 
popad											;; All 32bit regs on the stack are popped off.
 ret
growSnake ENDP
processKey PROC										;; processKey proc stores the current keyPress val in the bx reg and then moves the val in ax into keyPress
	mov bx, keypress
	mov keypress, ax
	
     RET
ProcessKey ENDP
moveSnakeUp PROC									;; Proc to move the snake up the screen.
     pushad										;; all 32bit regs are pushed.
     call clrscr									;; clear screen is called.
	 mov keyPress, 4800h								;; ascii code for up arrow moved into keyPress, this keeps the snake moving up.
     mov al, currSize									;; the currSize is moved into the al reg
     mov dl, sizeOF RCC									;; the sizeof the RCC struct is moved into the dl
     mul dl										;; val in the dl is multiplied by the al
     sub ax, sizeOF RCC									;; the size of the RCC is then subtracted from the product
     movzx esi, ax 									;; the val in ax is moved into the esi to act as an offset to where the head of the snake is in the array.
     cmp snake[esi].row, 0								;; the row value is compared to 0, if 0, the snake is at the top of the screen and needs to turn
     je TURN										;;
     mov bl, snake[esi].col								;; the current col and row value is stored in the bl reg
     mov bh, snake[esi].row									
     dec snake[esi].row									;; the row value is then decremented, to move the snake up the screen.
     sub esi, sizeOf RCC								;; the size of the RCC struct is then subtracted from the esi to adjust the offset to the char before the head.
     sub ecx,ecx									;; the ecx is cleared.
     mov cl, currSize									;; currSize-1 is moved into the cl to set up a loop
     dec cl
TOP:											;; Label for top of the loop.
     XCHG bl,snake[esi].col								;; The old row col val stored in the bl and bh is exchanged with the current row col, where the esi is pointing.
     XCHG bh,snake[esi].row
     sub esi, sizeOF RCC								;; This has the effect of moving the characters to follow everywere the snake's head has been.

     loop Top
     jmp NOTURN
TURN:
     call moveSnakeRight
NOTURN:
 call drawSnake
     popad
     RET
moveSnakeUp ENDP
moveSnakeLeft PROC									;; Same as above.
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
moveSnakeDown PROC									;; Same as above.
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
moveSnakeRight PROC									;; Same as above.
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
moveSnakeRight ENDP									;; Same as above.
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
