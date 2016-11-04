;;;;; P4 play - testing out some features of program 4
;;;;; Matt Schnider
;;;;; Fall 2016

INCLUDE Irvine32.inc

.data
msg                 BYTE "Please enter something: ",0

inputBuff           BYTE 15 DUP(0)  ;;;; where we will read in a name.
strSize             DWORD     ?     ;;;; String length.

myData                  BYTE 5 DUP(15 DUP(' '), 0);

.code
main PROC
     call clrscr
     mov dx,0C0Ah ;;;;row 12 col 10
     call gotoxy

     mov edx,OFFSET msg
     call WriteString
     
     mov edx, OFFSET inputBuff
     mov ecx, LENGTHOF inputBuff
     call ReadString
     mov strSize,eax

     ;;;; CALL OUR STR COPY PROC
     ;;;;; Params eax = length, esi points to src string, edi point to where we want to copy the string.
     mov esi, OFFSET inputBuff
     mov edi, OFFSET myData
     call strCopy

     exit

main ENDP

strCopy PROC
        pushAD
        mov ecx, eax ;;; copy str length into loop reg
TOP:
        mov bh,[esi]
        mov [edi],bh
        inc esi
        inc edi

        loop TOP
        popAD
        ret
strCopy ENDP
END main