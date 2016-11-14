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
pressEnt	          BYTE      "<Enter> by itself to quit.",0
Space               BYTE      " ",0
PrintCount          BYTE      1

counter             BYTE      0
fifteenSpaces       BYTE      15 DUP(' '), 0
fourteenSpaces      BYTE      14 DUP(' '), 0
twentyFiveSpaces    BYTE      25 DUP(' '), 0
recordCounter	    BYTE      "Record Count:",0

theRecords	    BYTE      10 DUP(2 DUP(15 DUP(' '),0), 14 DUP(' '),0, 25 DUP(' '), 0)
firstBuf	         BYTE      15 DUP(' ')
lastBuf		    BYTE      15 DUP(' ')
phoneBuf	         BYTE      14 DUP(' ')
emailBuf	         BYTE      25 DUP(' ') 
byteCount	         BYTE      ?


.code
main PROC
     mov eax, textColor
     call SetTextColor
     call clrscr

    
     mov ecx, 10
     
     mov edi, OFFSET theRecords

RDATA:
     push ecx

     call drawFields
	mov dl, (80 - SIZEOF fifteenSpaces)/2 +5
	mov dh, 4
	call gotoxy

	mov edx, edi
	mov ecx, LENGTHOF firstBuf
	call ReadString
	add edi, SIZEOF firstBuf+1
	cmp eax,0
	je FinishedDataEntry
	
	mov dl,(80 - SIZEOF fifteenSpaces + 1)/2 + 5
	mov dh, 6
	call gotoxy
	mov edx, edi
	mov ecx, LENGTHOF lastBuf
	call ReadString
	add edi, SIZEOF lastBuf+1

	mov dl,((80 - SIZEOF fifteenSpaces)/2) + 5
	mov dh, 8
	call gotoxy
	mov edx, edi
	mov ecx,LENGTHOF phoneBuf
	call ReadString
	add edi, SIZEOF phoneBuf+1	

	mov dl,((80 - SIZEOF TwentyFiveSpaces)/2)+10
	mov dh, 10
	call gotoxy
	mov edx, edi
	mov ecx, LENGTHOF emailBuf
	call ReadString
	add edi, SIZEOF emailBuf+1

	inc counter

	
 
	pop ecx
loop RDATA
	call clrscr

FinishedDataEntry:
     mov eax, textColor
     call setTextColor
     call clrscr

	movzx ecx,counter
	mov esi, OFFSET theRecords
PrintData:

     mov dl, (80 - SIZEOF headerStr)/2
     mov dh, 1
     call gotoxy

     mov edx, OFFSET headerStr
     call WriteString

     mov dl, 0
     mov dh,4
     call gotoxy
	
	mov edx, esi	;;First name print
	call WriteString
     mov edx, OFFSET Space
     call WriteString
	add esi, SIZEOF firstBuf+1

	mov edx,esi
	call WriteString	;;Last name Print
     mov edx, OFFSET Space
     call WriteString
	add esi, SIZEOF lastBuf+1

	mov edx,esi
	call WriteString	;;phone number print
     mov edx, OFFSET Space
     call WriteString
	add esi, SIZEOF phoneBuf+1

	mov edx,esi
	call WriteString	;;email print
     mov edx, OFFSET Space
     call WriteString
	add esi, SIZEOF emailBuf+1

     add dh,2
loop PrintData
exit

main ENDP


drawFields PROC

     mov eax, textColor
     call setTextColor

     mov dl, (80 - SIZEOF headerStr)/2
     mov dh, 1
     call gotoxy

     mov edx, OFFSET headerStr
     call WriteString
     mov dl, (80 - SIZEOF firstStr - SIZEOF fifteenSpaces)/2
     mov dh,4
     call gotoxy

     mov edx, OFFSET firstStr
     call WriteString						;;Print first name string.

     mov eax, blankColor
     call SetTextColor

     mov edx, OFFSET fifteenSpaces
     call WriteString

     mov dl, (80 - SIZEOF lastStr - SIZEOF fifteenSpaces+1)/2
     mov dh, 6
     call gotoxy

     mov eax, textColor
     call setTextColor

     mov edx, OFFSET lastStr					;;Print last name string.
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
     call WriteString						;;Print phone string.

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
     call WriteString						;;Print email string.

      mov eax, blankColor
     call setTextColor

     mov edx, OFFSET TwentyFiveSpaces
     call WriteString
     
     cmp ecx,10
     jge FIRSTENTRY
     
     mov dl, ((80 - SIZEOF emailStr - SIZEOF TwentyFiveSpaces)/2) + 8
     mov dh, 13
     call gotoxy
     mov edx, OFFSET pressEnt
     call WriteString

FIRSTENTRY:
     mov dl, (80 - 16)						;; X-coordinate of the record counter.
     mov dh, 24							;; Y-coordinate of the record counter.
     call gotoxy						;; mov cursor to above coordinates.

     mov eax, textColor
     call setTextColor

     mov edx, OFFSET recordCounter
     call WriteString

     mov eax, blankColor
     call setTextColor

     movzx eax, counter
     call WriteDec

 
     
  RET
drawFields ENDP
END main
