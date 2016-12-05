;;;Demo for Macros

INCLUDE Irvine32.inc
setCursor MACRO row, col
     mov dh, row
     mov dl, col
     call gotoxy
     ENDM
putChar MACRO theChar
     mov al, theChar
     call writeChar
     ENDM
putCharAt MACRO char, row, col
     setCursor row,col
     putChar char
     ENDM
putString Macro stringName
     mov edx, offset stringName
     call writeString
     ENDM
putStringAt MACRO stringName, row, col
     setCursor row,col
     putString stringName
     ENDM
.data
first BYTE "First Name: ", 0
last BYTE "Last Name: ", 0

.code

main PROC

     ;;; move the cursor to row 12,col 39
     putCharAt 'C', 12, 39
     putCharAt 'L',0,0
     putCharAt 'R',0,79
     putCharAt 'B',24,0
     setCursor 5,15
     putStringAt first, 0, 15
     putStringAt last, 1, 15
     call readChar
     exit
main ENDP
end main
