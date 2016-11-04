INCLUDE Irvine32.inc

.data
msg byte "Happy Halloween to each of you!!",0        ;0 is end marker for the string.


.code
  main PROC
     mov eax, 000eh ;; yellow on black?
     call setTextColor
     call clrscr  
     mov dh,1
     mov dl,(80-lengthof msg)/2
     call gotoxy
     mov edx, OFFSET msg
     call writestring

     mov dx,0A00h
     call gotoxy
     SHR eax,1
     exit   
  
  main ENDP

  CenterText PROC ;;;; edx=addr of String, AL = row.
     PUSHAD
     push eax
     call str_length     ;;;; EAX=str length
     mov ebx, 80
     sub ebx,eax         ;;;; remaining chars on screen
     shr ebx,1           ;;;; divide by 2
     pop eax             ;;;; gives back row number


     mov ebx,edx  ;;;; save the ptr to the string.
     mov dh,al
     mov

     POPAD
     ret
  CenterText ENDP


END main