; Happy.asm
; A demo using structs and our Surprise Program
; Bob Allen
; Fall 2016

INCLUDE Irvine32.inc

RCC Struct                    ;;;;Row Col Char
     Row       BYTE          0
     Col       BYTE          0
     Char      BYTE          'X'
RCC ENDS

.data

Smiley         RCC  <12,39, 1>
backC          BYTE      green*16
foreC          BYTE      blue
.code
main PROC
	movsx ax, foreC 
     add  eax, DWORD PTR backC	
	call	SetTextColor
	call 	Clrscr  
     mov esi,0
     
	call setHappy
L1:
     call readChar

     cmp eax,4800h
       jne L2
       call moveForward
       jmp L1
L2:
     cmp eax, 5000h
       jne L3
       call moveBack
       jmp L1
L3:
     cmp eax, 4B00h
	jne L4
       call moveLeft
       jmp L1
L4:
     cmp eax, 4D00h
	jne L5
       call moveRight
       jmp L1
L5:
     cmp eax, 1071h
	jne L6    					;q exit
	je LAST
L6:
     cmp eax, 1051h
	jne L7					;Q exit
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
     jne LAST
	call blueBackground
	jmp L1
	
LAST:
	exit
main ENDP

blueBackground PROC
	
	mov backC, blue*16
     movsx eax, foreC
     add eax, DWORD PTR backC
	call SetTextColor
	
  RET
blueBackground ENDP
blueHappy PROC
	mov foreC,blue
     movsx eax, foreC
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
setHappy PROC
	mov dh, Smiley[esi].row
	mov dl, Smiley[esi].col
	call Gotoxy

	mov al,Smiley[esi].char
	call WriteChar

  RET
setHappy ENDP
moveRight PROC
     
     cmp Smiley[esi].col,79
     je noMore
     mov al, ' '
     mov dl, Smiley[esi].col
     mov dh, Smiley[esi].row
     call gotoxy
     call WriteChar
     inc Smiley.col
     mov dl, Smiley[esi].col
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
noMore:
RET
moveRight ENDP
moveLeft PROC
   
     cmp Smiley[esi].col,0
     je noMore
     call gotoxy
      mov al, ' '
     mov dl, Smiley[esi].col
     mov dh, Smiley[esi].row
     call gotoxy
     call WriteChar
     dec Smiley.col
     mov dl, Smiley[esi].col
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
noMore:
RET
moveLeft ENDP
moveForward PROC
     
     cmp Smiley[esi].row,0
     je noMore
     mov al, ' '
     mov dl, Smiley[esi].col
     mov dh, Smiley[esi].row
     call gotoxy
     call WriteChar
     dec Smiley.row
     mov dh, Smiley[esi].row
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
noMore:
RET
moveForward ENDP
moveBack PROC
     
     cmp Smiley[esi].row,24
     je noMore
     mov al, ' '
     mov dl, Smiley[esi].col
     mov dh, Smiley[esi].row
     call gotoxy
     call WriteChar
     inc Smiley.row
     mov dh, Smiley[esi].row
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
noMore:
RET
moveBack ENDP
END main
