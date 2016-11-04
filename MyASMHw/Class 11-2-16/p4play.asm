;;;;; P4 play - testing out some features of program 4
;;;;; Matt Schnider
;;;;; Fall 2016

INCLUDE Irvine32.inc

.data
msg                 BYTE "Please enter something: ",0

inputBuff           BYTE 15 DUP(0)  ;;;; where we will read in a name.
strSize             DWORD     ?     ;;;; String length.

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

     exit

main ENDP

END main