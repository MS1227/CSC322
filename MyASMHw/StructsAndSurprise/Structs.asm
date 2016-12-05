; SurpriseStruct.asm
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

Smiley         RCC  <12,3, 1>,<12,2,'*'>,<12,1,'*'>,<12,0,'+'>
speed          DWORD 1000
.code
main PROC

     mov eax, LENGTHOF Smiley
	;;;;	Just a reminder how we can set the foreground and background colors
	mov	 	eax,white + (blue*16)	
	call	SetTextColor
	call 	Clrscr  
     mov esi,0
     mov ecx,5
     call putSmiley
     mov ecx, 75
moveTop:
     call readKey

     jz   skip
     cmp  al, '+'
     jne skip
     sub speed,100
skip:
     call moveSmileyRight
     mov  eax,speed
     call delay
     loop moveTOP
  

	
	exit
main ENDP
moveSmileyRight PROC
     pushad
     
     call clearSmiley
     ;;;;;;; adjust Smiley
     mov ecx, lengthof smiley -1
     mov edi, (lengthof smiley -1)*sizeof RCC
     mov esi, edi
     sub edi, sizeof RCC


RtTop:
     mov ah,Smiley[esi].row
     mov al,Smiley[esi].col
     mov Smiley[edi].row,ah
     mov Smiley[edi].col,al
     sub edi,sizeof RCC
     sub esi,sizeof RCC
     loop RtTop
     inc  Smiley.col   
     call putSmiley

     popad
     ret
moveSmileyRight ENDP
clearSmiley PROC
     pushad
     mov ecx, lengthof smiley
TOP:
     mov dh,Smiley[esi].row
     mov dl,Smiley[esi].col
     call Gotoxy

     mov al,' '
     call WriteChar

     add esi, SIZEOF RCC
     loop TOP
       popad
 RET
   
clearSmiley ENDP

putSmiley PROC
     pushad
     mov ecx, lengthof smiley
TOP:
     mov dh,Smiley[esi].row
     mov dl,Smiley[esi].col
     call Gotoxy

     mov al,Smiley[esi].char
     call WriteChar

     add esi, SIZEOF RCC
     loop TOP
     popad

RET
 putSmiley ENDP

END main