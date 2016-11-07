;; FirstIf.asm
;; Demo how to make a conditional jump.

INCLUDE IRVINE32.INC     

.data
prompt BYTE         "Enter something: ",0
inputField     BYTE 11 DUP (' ')
msgY   BYTE "YES",0
msgN   BYTE "No",0
.code

main PROC
     call clrscr
     mov edx, 0A0ch
     call gotoxy

     mov edx, OFFSET prompt
     call writeString

     mov edx, OFFSET inputField
     mov ecx, 10
     call ReadString

     ;;;;; eax has string length
     cmp eax,0
     je doNO
     mov edx, OFFSET msgY
     call Writestring


     jmp doneAll
     doNo:
     mov edx, OFFSET msgN
     call writestring
          
     doneAll:
  exit

main ENDP
end main