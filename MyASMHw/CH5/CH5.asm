; Library Test #1: Integer I/O   (InputLoop.asm)

; Tests the Clrscr, Crlf, DumpMem, ReadInt, SetTextColor, 
; WaitMsg, WriteBin, WriteHex, and WriteString procedures.

INCLUDE Irvine32.inc

.data
myArray DWORD 1,2,3,4,5

.code
main PROC
     mov eax,10
     mov esi,OFFSET myArray
     mov ecx, 5
     call DoubleIt
	
	exit
main ENDP

DoubleIt PROC
     push eax
TOP:
     mov eax,[esi]
     add eax,eax
     mov [esi],eax
     add esi,4
     loop TOP
     pop eax
     RET
DoubleIt ENDP
END main