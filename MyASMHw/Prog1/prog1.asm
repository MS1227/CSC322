; Matt Schnider
; CSC 322 Fall 2016
; Program 1
; Due 10/14/2016
; Program to sum up the values of arrays of different data types. The sum of each array is then added together and stored
; in the grandTotal var.

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
bArray 		SBYTE 	-1,-2,-3,-4,-5
wArray 		SWORD 	0ah,0bh,0ch,0dh,0eh
dArray		SDWORD 	-10,20,-30,40,-50
bArraySum 	SBYTE 	0
wArraySum	SWORD	0
dArraySum	SDWORD	0
grandTotal	SDWORD	0

.code
main proc
	;Sum bArray
	mov AL,bArray 		;Moves first integer, -1,  in bArray into the 8-bit AL reg,preserving the sign bit.
	mov AH,bArray+1		;Moves -2 in byte into the 8-bit AH reg, preserving the sign bit.
	add AL,AH			     ;Adds the value in the AH register to the AL reg. result stored in AL.
	mov AH,bArray+2		;Moves the byte representation of -3 into the AH reg.
	add AL,AH			     ;Adds the value stored in AH reg to AL reg.
	mov AH,bArray+3		;moves byte rep of -4 into AH reg.
	add AL,AH			     ;same as above.
	mov AH, bArray+4
	add AL,AH
	mov bArraySum,AL		;Moves the sum of bArray vals into memory.

	;Sum wArray
	mov AX,wArray		;Moves the first element of the wArray into the AX 16-bit reg, preserving the sign bit.
	mov BX,wArray+2	     ;Indexes the wArray 2 bytes further in to retrieve the 0bh val and moves it into the BX reg.
	add AX,BX			     ;Adds the value of BX to the AX reg.
	mov BX,wArray+4	     ;moves 0ch into BX reg.
	add AX,BX			     ;same as above.
	mov BX,wArray+6
	add AX,BX
	mov BX,wArray+8
	add AX,BX
	mov wArraySum,AX		;Moves the value of the above summation into the wArraySum variable in memory.

	;Sum dArray
	mov EAX,dArray		;moves the first element of dArray int the EAX 32-bit register, preserving the sign bit.
	mov EBX,dArray+4		;Indexes the dArray 4bytes further in to retrieve the 20 val and moves it into the 32-bit EBX reg.
	add EAX,EBX			;Adds teh value of the EBX reg to the EAX reg.
	mov EBX,dArray+8		;same as above.
	add EAX,EBX
	mov EBX,dArray+12
	add EAX,EBX
	mov EBX,dArray+16
	add EAX,EBX
	mov dArraySum,EAX		;Moves the value of the above summation into the dArraySum variable in memory.

	;grandTotal
	movsx EAX,bArraySum		;Moves into the EAX 32-bit register the value stored at bArraySum. Sign bit is preserved.
	movsx EBX,wArraySum		;Moves into the EBX 32-bit register the value stored at wArraySum. Sign bit is preserved.
	add EAX,EBX			;Adds the value in the EBX reg to the value in the EAX reg.
	add EAX,dArraySum			;adds the value stored in the EBX to the EAX.
	mov grandTotal, EAX		;Moves the value stored in the EAX register to the grandTotal var in memory.



	Invoke ExitProcess,0
main endp
end main