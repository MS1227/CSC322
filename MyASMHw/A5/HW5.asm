; HW5.asm
; Matt Schnider

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
sum dword 0

.code
main proc
;problem 1
	mov ax, 0246h
     mov bx, 0DCABh
     add ax,bx

;problem 2
     mov ax, 0ABCDh
     mov bx, 0DCBAh
     add ax,bx

;problem 3    
     mov ax, 0FFFFh
     mov bx, 0001h
     add ax,bx

;problem 4
     mov ax, 0F0F0h
     mov bx, 0F0F0h
     add ax,bx
   
;problem 5     
     mov ax, 2468h
     mov bx, 2468h
     add ax,bx

;problem 6
     mov ax, 7FFFh
     mov bx, 0001h
     add ax,bx
 
;problem 7     
     mov ax, 0ABCDh
     mov bx, 0FEDCh
     add ax,bx
    
;problem 8     
     mov ax, 0B0Bh
     mov bx, 0A11Eh
     add ax,bx

;problem 9     
     mov ax, 7FFFh
     mov bx, 7FFFh
     add ax,bx
     
;problem 10
     mov ax, 8000h
     mov bx, 8000h
     add ax,bx

	invoke ExitProcess,0
main endp
end main