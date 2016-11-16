;;;Forms.asm
;;;A program for reading in up to 10 names, phone numbers and email addresses
;;;Due 11/11/2016
;;;CSC322
;;;Fall 2016


INCLUDE IRVINE32.INC

.data
textColor           DWORD     green + (lightGray * 16)						;;Text color - green on light gray background
blankColor          DWORD     lightGray + (green * 16)						;;Inversion of the above to make blank spaces visable.
																			;;//Following strings are stored in memory for use in the program:
headerStr           BYTE      "Forms Program - By: Matt Schnider",0			;;Header string that will be printed at the top of the window.
firstStr            BYTE      "First Name:",0								;;First name title string
lastStr             BYTE      "Last Name:", 0								;;Last name title string
phoneStr            BYTE      "Phone:", 0									;;Phone number title string
emailStr            BYTE      "Email:",0									;;Email address title string
recordStr           BYTE      "Record Count",0								;;Record count string
pressEnt	        BYTE      "<Enter> by itself to quit.",0				;;String to alert user to press enter to quit
Space				BYTE      " ",0											;;Blank space.
firstP				BYTE      "First Name",0									;;First name string used to title print out column
lastP				BYTE      "Last Name",0									;;Last name string used to title print out column
phoneP				BYTE      "Phone Number",0									;;Phone number string used to title print out column
emailP				BYTE      "Email Address",0								;;Email address string used to title print out column


PrintCount          BYTE      1											;;Integer value initialized to 1 for use in marking line numbers when printing out records
counter             BYTE      2 DUP(0)											;;Integer value initialized to 0 for use in counting number of inserted records
fifteenSpaces       BYTE      15 DUP(' '), 0								;;15 blank spaces - used to print blanks
fourteenSpaces      BYTE      14 DUP(' '), 0								;;14 blank spaces
twentyFiveSpaces    BYTE      25 DUP(' '), 0								;;25 blank spaces
recordCounter	    BYTE      "Record Count:",0							;;Record count string
printLine           BYTE      5												;;Integer used to hold the y coordinate of the line being printed on

theRecords	    BYTE      10 DUP(2 DUP(15 DUP(' '),0), 14 DUP(' '),0, 25 DUP(' '), 0)		;;Formatted space in RAM to hold the data for 10 records
firstBuf	        BYTE      15 DUP(' ')									;;Buffer of size 15 to limit the amount of chars read in from the user input
lastBuf			    BYTE      15 DUP(' ')										;;Same as above
phoneBuf	        BYTE      14 DUP(' ')									;;Same as above	- size different
emailBuf	        BYTE      25 DUP(' ') 									;;Same as above


.code
main PROC
     mov eax, textColor														;;Moves the value of textColor into the eax register
     call SetTextColor														;;Calls the proc to set the window colors to the values spec'd in the eax
     call clrscr															;;Clear Screen wipes the screen and shows new colors

    
     mov ecx, 10															;;10 is moved into ecx for use in creating a loop to collect the 10 records
     
     mov edi, OFFSET theRecords												;;edi set to point to the beginnin of the records array

RDATA:																		;;Label for looping purposes
     push ecx																;;ecx val is pushed onto the stack

     call drawFields														;;drawFields is called to print the form to the window
	mov dl, (80 - SIZEOF fifteenSpaces)/2 +5								;;X coordinate of first name blank
	mov dh, 4																;;Y coordinate of first name blank
	call gotoxy																;;Moves cursor to above x,y coords

	mov edx, edi															;;moves the val of edi into edx
	mov ecx, LENGTHOF firstBuf												;;moves the length of the firstBuf into the ecx to limit chars read
	call ReadString															;;ReadString called to prompt user for data entry
	add edi, SIZEOF firstBuf+1												;;Advances the edi to point to the next field of the array in memory
	cmp eax,0																;;Compare statement to determine if the user input was null
	je FinishedDataEntry													;;If above statement was true, jump to FinishedDataEntry, else keep going
	
	mov dl,(80 - SIZEOF fifteenSpaces + 1)/2 + 5							;;Same as above
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

	inc counter																;;Record counter is incremented

	
 
	pop ecx																	;;ecx is popped off the stack so the following loop command can operate
loop RDATA

FinishedDataEntry:															;;label destination for the above jump instruction
     mov eax, textColor														;;moves the text color into the eax
     call setTextColor														;;proc call to set the text color to the one in the eax
     call clrscr															;;screen is cleared in prep for printing out records
     call drawPrint															;;drawPrint proc is called to set up the column headers, etc. for printing
	movzx ecx,counter														;;moves the amount of records stored in counter, padded with leading zeros into the ecx
	mov esi, OFFSET theRecords												;;to set up a loop for printing. The esi is set to the address of theRecords array.

PrintData:																	;;Label used to print the records out with a loop
	 
     movzx eax, printCount													;;moves the printCount value into the eax, padded with leading zeros
     call writeDec															;;WriteDec prints out the decimal value of the number in the eax
     movzx eax, space														;;this line and the following 2 linesprint 2 spaces
     call writeChar			
     call printFirst														;;Proc call to print first name

     mov dl, 3 + SIZEOF firstBuf											;;x coordinate of first name is moved into the dl 
     mov dh, printLine														;;y coordinate is set to the current printLine value
     call gotoxy															;;moves cursor to above x,y coordinate
     call printLast															;;Proc call to print last name

     mov dl, 3 + SIZEOF firstBuf + SIZEOF lastBuf							;;Same as above
     mov dh, printLine
     call gotoxy
     call printPhone							
	
     mov dl, 3 + SIZEOF firstBuf + SIZEOF lastBuf + SIZEOF phoneBuf		
     mov dh, printLine
     call gotoxy
     call printEmail
	
     inc printCount															;;printCount is incremented for the printing of the next record if applicable
     call crlf																;;Cursor is moved to a new line

     inc printLine															;;printline is incremented to properly print the next record
																			
loop PrintData																;;Loops back to printData if ecx is not equal to 0
exit									

main ENDP																			
printEmail PROC																;;Procedure for printing out a stored email address referenced by the esi
     mov edx,esi															;;the address in the esi is moved to the edx
	call WriteString	          ;;email print								;;WriteString prints out the string located in the edx
     mov edx, OFFSET Space													;;Space printed
     call WriteString
	add esi, SIZEOF emailBuf+1												;;esi is updated to point to the next item in theRecords array
RET																			;;Return to calling proc
PrintEmail ENDP
printPhone PROC																;;Same as above proc
     mov edx, esi
     call WriteString														;;phone number print
     mov edx, OFFSET Space
     call WriteString
	add esi, SIZEOF phoneBuf+1

RET
printPhone ENDP
printFirst PROC
     mov edx, esi															;;First name print	
	call WriteString    
     mov edx, OFFSET Space
     call WriteString
	add esi, SIZEOF firstBuf+1
RET
printFirst ENDP

printLast PROC
     mov edx,esi
	call WriteString														;;Last name Print
     mov edx, OFFSET Space
     call WriteString
	add esi, SIZEOF lastBuf+1
RET
printLast ENDP

drawPrint PROC																;;Proc to print out the formatted print out of the data in the array
     mov dl, (80 - SIZEOF headerStr)/2										;;x and y coords are set up and the cursor is moved to the coordinate.
     mov dh, 1										
     call gotoxy

     mov edx, OFFSET headerStr												;;address of headerStr is moved into the edx and printed out by WriteString
     call WriteString														;;at the above coords

     mov dl, 3																;;Above process is repeated below print the column headers 
     mov dh,4
     call gotoxy
     
	mov edx, OFFSET firstP
	call WriteString
	
	mov dl, 3 + SIZEOF firstBuf
	mov dh, 4
	call gotoxy
	
	mov edx, OFFSET lastP
	call WriteString

	mov dl, (3 + SIZEOF firstBuf + SIZEOF lastBuf)
	mov dh, 4
	call gotoxy
	mov edx, OFFSET phoneP
	call WriteString

	mov dl, (3+ SIZEOF firstBuf + SIZEOF lastBuf + SIZEOF phoneBuf)
	mov dh, 4
	call gotoxy
	mov edx, OFFSET emailP
	call WriteString

     call crlf
     
  RET
drawPrint ENDP

drawFields PROC															;;Proc to set up the window with text boxes and box titles for the collection of data
																		;;from the user.
     mov eax, textColor													;;textColor is set in prep for print out the title
     call setTextColor

     mov dl, (80 - SIZEOF headerStr)/2									;;cursor is moved to the xy coords of appropriate for the header string
     mov dh, 1
     call gotoxy
	
     mov edx, OFFSET headerStr											;;Header is printed out
     call WriteString
     mov dl, (80 - SIZEOF firstStr - SIZEOF fifteenSpaces)/2			;;x-y coords for the first name title
     mov dh,4
     call gotoxy

     mov edx, OFFSET firstStr
     call WriteString													;;Print first name title.

     mov eax, blankColor												;;Blank color is set for the creation of pseudo text box.
     call SetTextColor

     mov edx, OFFSET fifteenSpaces
     call WriteString													;;Pseudo text box printed out.

     mov dl, (80 - SIZEOF lastStr - SIZEOF fifteenSpaces+1)/2			;;Same as above, but with different title
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
     
     cmp ecx,10																		;;The value in the ecx is compared to 10
     jge FIRSTENTRY																	;;If the value in the ecx is greater than or equal to 10, jump to FIRSTENTRY label
     
     mov dl, ((80 - SIZEOF emailStr - SIZEOF TwentyFiveSpaces)/2) + 8				;;This code is reached after one record is read in, it simply prompts the user
     mov dh, 13											;;to press enter to quit.
     call gotoxy
     mov edx, OFFSET pressEnt
     call WriteString

FIRSTENTRY:
     mov dl, (80 - 16)																;; X-coordinate of the record counter.
     mov dh, 24																		;; Y-coordinate of the record counter.
     call gotoxy																	;; mov cursor to above coordinates.

     mov eax, textColor																;;textColor is set
     call setTextColor

     mov edx, OFFSET recordCounter													;;record counter is printed out
     call WriteString

     mov eax, blankColor
     call setTextColor

     movzx eax, counter																;;number of records in the database is printed out
     call WriteDec

 
     
  RET
drawFields ENDP
END main
