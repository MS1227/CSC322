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

CharAttrib Struct
	TheChar	  BYTE ' '	; a space
	TheAttrib   BYTE 7	     ; white on black
CharAttrib ENDS

.data



Smiley         RCC  <12,39, 1>
.code
main PROC
	mov	 	eax, blue + (green*16)	
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
     cmp eax, 17h
	jne L6    					;q exit
	je END
L6:
     cmp eax, 15h
	jne L7					;Q exit
	je END
L7:
     cmp eax, 36h
	jne L8
	call clearHappy
	jmp L1
L8:  cmp eax, 34h
	jne L9
	call clearHappy
	jmp L1
L9:  cmp eax, 27h
	jne L10
	call redHappy
	jmp L1
L10: cmp eax, 25h
	jne L11
	call redBackground
	jmp L1
L11: cmp eax, 76h
	jne L12
	call greenHappy
	jmp L1
L12: cmp eax, 74h
	jne L13
	call greenBackground
	jmp L1
L13: cmp eax, 26h
	jne L14
	call blueHappy
	jmp L1
L14: cmp eax, 24h
	call blueBackground
	jmp L1
	
END:
	exit
main ENDP

blueBackground PROC
	call GetTextColor
	add eax, (blue*16)
	call SetTextColor
	
  RET
blueBackground ENDP
blueHappy PROC
	call GetTextColor
	add eax, blue
	call SetTextColor
	call setHappy
 RET
blueHappy ENDP
greenBackground PROC
	call GetTextColor
	add eax, (green*16)
	call SetTextColor
	
  RET
greenBackground ENDP
greenHappy PROC
	call GetTextColor
	add eax, green
	call SetTextColor
	call setHappy
 RET
greenHappy ENDP
redBackground PROC
	call GetTextColor
	add eax, (red*16)
	call SetTextColor
	
  RET
redBackground ENDP
redHappy PROC
	call GetTextColor
	add eax, red
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
     call WriteChar
     inc Smiley[esi].col
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
noMore:
RET
moveRight ENDP
moveLeft PROC
   
     cmp Smiley[esi].col,0
     je noMore
     mov al, ' '
     call WriteChar
     dec Smiley[esi].col
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
     call WriteChar
     dec Smiley[esi].row
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
noMore:
RET
moveForward ENDP
moveBack PROC
     
     cmp Smiley[esi].row,79
     je noMore
     mov al, ' '
     call WriteChar
     inc Smiley[esi].row
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
RET
moveBack ENDP
END main
