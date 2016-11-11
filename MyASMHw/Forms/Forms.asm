;;;Forms.asm
;;;A program for reading in up to 10 names, phone numbers and email addresses
;;;Due 11/11/2016
;;;CSC322
;;;Fall 2016


INCLUDE IRVINE32.INC

.data
textColor           DWORD     green + (lightGray * 16)
blankColor          DWORD     lightGray + (green * 16)

headerStr           BYTE      "Welcome To A Forms Application - By: Matt Schnider",0
firstStr            BYTE      "First Name:",0
lastStr             BYTE      "Last Name:", 0
phoneStr            BYTE      "Phone:", 0
emailStr            BYTE      "Email:",0
recordStr           BYTE      "Record Count",0

counter             BYTE      0
fifteenSpaces       BYTE      15 DUP(" "), 0
fourteenSpaces      BYTE      14 DUP(" "), 0
TwentyFiveSpaces      BYTE      25 DUP(" "), 0

.code
main PROC
     mov eax, textColor
     call SetTextColor
     call clrscr

     mov dl, (80 - SIZEOF headerStr)/2
     mov dh, 1
     call gotoxy

     mov edx, OFFSET headerStr
     call WriteString
     call drawFields
    




exit

main ENDP
drawFields PROC
     mov dl, (80 - SIZEOF firstStr - SIZEOF fifteenSpaces)/2
     mov dh,4
     call gotoxy

     mov edx, OFFSET firstStr
     call WriteString

     mov eax, blankColor
     call SetTextColor

     mov edx, OFFSET fifteenSpaces
     call WriteString

     mov dl, (80 - SIZEOF lastStr - SIZEOF fifteenSpaces+1)/2
     mov dh, 6
     call gotoxy

     mov eax, textColor
     call setTextColor

     mov edx, OFFSET lastStr
     call WriteString

     mov eax, blankColor
     call setTextColor

     mov edx, OFFSET fifteenSpaces
     call WriteString

     mov dl, ((80 - SIZEOF phoneStr - SIZEOF fifteenSpaces)/2) + 3
     mov dh, 8
     call gotoxy

     mov eax, textColor
     call setTextColor

     mov edx, OFFSET phoneStr
     call WriteString

      mov eax, blankColor
     call setTextColor

     mov edx, OFFSET fourteenSpaces
     call WriteString


     mov dl, ((80 - SIZEOF emailStr - SIZEOF TwentyFiveSpaces)/2) + 8
     mov dh, 10
     call gotoxy

     mov eax, textColor
     call setTextColor

     mov edx, OFFSET emailStr
     call WriteString

      mov eax, blankColor
     call setTextColor

     mov edx, OFFSET TwentyFiveSpaces
     call WriteString

  exit   
drawFields ENDP
END main