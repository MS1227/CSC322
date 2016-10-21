.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

NUM1 DWORD 6
NUM2 DWORD 5
PROD DWORD ?
SAVEECX DWORD ?

.code
main proc
  SUB EAX,EAX ; ZERO'S OUT THE ACCUMULATOR.
  MOV ECX,NUM1
     TOP:
          MOV SAVEECX,ECX
          MOV ECX, NUM2
     MIDDLE:
          INC EAX  
          LOOP MIDDLE
     MOV ECX, SAVEECX      
     LOOP TOP

     MOV PROD,EAX

	invoke ExitProcess,0
main endp
end main