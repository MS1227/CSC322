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
	;;;;	Just a reminder how we can set the foreground and background colors
	mov	 	eax, blue + (green*16)	
	call	SetTextColor
	call 	Clrscr  
     mov esi,0
     mov ecx,1
TOP:
     mov dh,Smiley[esi].row
     mov dl,Smiley[esi].col
     call Gotoxy

     mov al,Smiley[esi].char
     call WriteChar

     add esi, SIZEOF RCC
    ;;;;;;;;;;;;;;;;;;;;;;;;;;; loop TOP
L1:
     call readChar

     cmp eax,4800h
     je FORWARD
     cmp eax, 5000h
     je BACKWARD
     cmp eax, 4B00h
     je LEFT
     cmp eax, 4D00h
     je RIGHT

FORWARD:
     call moveForward
     jmp LAST
BACKWARD:
     call moveBack
     jmp LAST      
LEFT:
     call moveLeft
     jmp LAST
RIGHT:
     call moveRight  
     jmp LAST
LAST:
     cmp eax, 17h
     jne L1
	
	exit
main ENDP
moveRight PROC
     mov esi, 0
     call clrscr
     inc dl
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
RET
moveRight ENDP
moveLeft PROC
     mov esi, 0
     call clrscr
     dec dl
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
RET
moveLeft ENDP
moveForward PROC
     mov esi, 0
     call clrscr
     dec dh
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
RET
moveForward ENDP
moveBack PROC
     mov esi, 0
     call clrscr
     inc dh
     call gotoxy
     mov al, Smiley[esi].char
     call writeChar
RET
moveBack ENDP
END main