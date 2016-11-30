; Happy.asm
; By: Matt Schnider
; A program for generating a moveable smiley face that can be used to draw simple graphics.
; Bob Allen
; CSC322
; Fall 2016

INCLUDE Irvine32.inc

RCC Struct                    						;; Struct for keeping track of a BYTE, Row Col Char
     Row       BYTE          0
     Col       BYTE          0
     Char      BYTE          'X'
RCC ENDS

.data

Happy         RCC  <12,39, 1>						;;Variable named Happy that uses the previously declared struct to organize the data.
backC          BYTE      green*16					;;Variable for holding the background color
foreC          BYTE      blue						;;Variable for holding the foreground color
.code	
main PROC
	movsx ax, foreC 						;;moves the background color, sign-bit extended, into the eax reg
     add  eax, DWORD PTR backC						;;adds the foreground color to the eax reg
	call	SetTextColor						;;proc setTextColor is called to change the colors to the val in the eax
	call 	Clrscr  						;;clear screen is called to display the new colors.
     mov esi,0
     
	call setHappy							;;Procedure call to draw the smiley face at the middle of the screen.
L1:
     call readChar							;;User prompted to input a char to move Happy around.

     cmp eax,4800h							;;Result of readChar in the eax is compared to the possible key presses, if one is found, the 
       jne L2								;;appropriate action is performed via a procedure call. After a proc call, the program returns to
       call moveForward							;;L1 prompting the user to press another key. This continues until the user presses either 'q' or 'Q'.
       jmp L1								;;The program then terminates.
L2:									;;Possible key presses:
     cmp eax, 5000h							;;			left arrow	- happy moves left
       jne L3								;;			right arrow	- happy moves right
       call moveBack							;;			down arrow	- happy moves down
       jmp L1								;;			up arrow	- happy moves up
L3:									;;			'c' or 'C'	- screen is cleared and happy left at last location
     cmp eax, 4B00h							;;			'r'		- happy changed to color red (lowercase g and b have same effect, but green and blue respec.
	jne L4								;;			'R'		- happy background color changed to red (uppercase g and be have same effect, but
       call moveLeft							;;										 produce green and blue respectively.
       jmp L1								
L4:
     cmp eax, 4D00h
	jne L5
       call moveRight
       jmp L1
L5:
     cmp eax, 1071h
	jne L6    					
	je LAST
L6:
     cmp eax, 1051h
	jne L7					
	je LAST
L7:
     cmp eax, 2E63h
	jne L8
	call clearHappy
	jmp L1
L8:  cmp eax, 2E43h
	jne L9
	call clearHappy
	jmp L1
L9:  cmp eax, 1372h
	jne L10
	call redHappy
	jmp L1
L10: cmp eax, 1352h
	jne L11
	call redBackground
	jmp L1
L11: cmp eax, 2267h
	jne L12
	call greenHappy
	jmp L1
L12: cmp eax, 2247h
	jne L13
	call greenBackground
	jmp L1
L13: cmp eax, 3062h
	jne L14
	call blueHappy
	jmp L1
L14: cmp eax, 3042h
     jne L1
	call blueBackground
	jmp L1
	
LAST:
	call clrscr
	mov dl, 0
	mov dh, 0
	call gotoxy
	exit
main ENDP

blueBackground PROC							;; Procedure for changing the background color of happy. The new color is moved into the mem location backC.
									;; backC and foreC are then moved into the eax and call setTextColor is called to change the colors to the
	mov backC, blue*16						;; new value. This is the logic for all background procs
     movsx eax, foreC
     add eax, DWORD PTR backC
	call SetTextColor
	
  RET
blueBackground ENDP
blueHappy PROC								;; Procedure for changing the color of happy. The new color is moved into the mem location foreC.
	mov foreC,blue							;; The foreC and backC colors are moved into the eax reg and setTextColor is called to change the colors to the
     movsx eax, foreC							;; new value. This is the logic for all happy color changes.
     add eax, DWORD PTR backC
	call SetTextColor

	call setHappy
 RET
blueHappy ENDP
greenBackground PROC
	mov backC, green*16
     movsx eax, foreC
     add eax, DWORD PTR backC
	call SetTextColor
	
	
  RET
greenBackground ENDP
greenHappy PROC
mov foreC, green
     movsx eax, foreC
     add eax, DWORD PTR backC
	call SetTextColor
	call setHappy
 RET
greenHappy ENDP
redBackground PROC
	mov backC, red*16
     movsx eax, foreC
     add eax, DWORD PTR backC
	call SetTextColor
	
  RET
redBackground ENDP
redHappy PROC
	mov foreC,red
     movsx eax, foreC
     add eax, DWORD PTR backC
	call SetTextColor
	call setHappy
  RET
redHappy ENDP
clearHappy Proc
	mov eax, blue + (green*16)
	call setTextColor
	call clrscr
	call setHappy
  RET
clearHappy ENDP
setHappy PROC									;; Procedure that moves happy to the values stored x-y values currently held in memory, referenced using the
	mov dh, Happy[esi].row							;; struct. The row and col vals are moved into the dh and dl regs, respectively and the gotoxy proc is called.
	mov dl, Happy[esi].col							;; Lastly, the smiley char is written.
	call Gotoxy

	mov al,Happy[esi].char
	call WriteChar

  RET
setHappy ENDP
moveRight PROC									;; Procedure that moves happy right. The current col val is compared to the right-most col value of the default window
     										;; size (79). If it's less than 79, a space is overwritten at happy's current location and happy is redrawn one col
     cmp Happy[esi].col,79							;; right of where he was before the proc. If he is at the edge of the window, the proc does nothing.
     je noMore									;; This is the logic for all move procs, with the exception of the value compared to determine if happy is at the edge of
     mov al, ' '								;; the window. i.e. move down requires that the row val be less than 24, the last row of the default window.
     mov dl, Happy[esi].col
     mov dh, Happy[esi].row
     call gotoxy
     call WriteChar
     inc Happy.col
     mov dl, Happy[esi].col
     call gotoxy
     mov al, Happy[esi].char
     call writeChar
noMore:
RET
moveRight ENDP
moveLeft PROC
   
     cmp Happy[esi].col,0
     je noMore
     call gotoxy
      mov al, ' '
     mov dl, Happy[esi].col
     mov dh, Happy[esi].row
     call gotoxy
     call WriteChar
     dec Happy.col
     mov dl, Happy[esi].col
     call gotoxy
     mov al, Happy[esi].char
     call writeChar
noMore:
RET
moveLeft ENDP
moveForward PROC
     
     cmp Happy[esi].row,0
     je noMore
     mov al, ' '
     mov dl, Happy[esi].col
     mov dh, Happy[esi].row
     call gotoxy
     call WriteChar
     dec Happy.row
     mov dh, Happy[esi].row
     call gotoxy
     mov al, Happy[esi].char
     call writeChar
noMore:
RET
moveForward ENDP
moveBack PROC
     
     cmp Happy[esi].row,24
     je noMore
     mov al, ' '
     mov dl, Happy[esi].col
     mov dh, Happy[esi].row
     call gotoxy
     call WriteChar
     inc Happy.row
     mov dh, Happy[esi].row
     call gotoxy
     mov al, Happy[esi].char
     call writeChar
noMore:
RET
moveBack ENDP
END main
