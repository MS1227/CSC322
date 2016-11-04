INCLUDE Irvine32.inc

.data

theChars       BYTE 9 DUP   ("Bears")
theAttribs     BYTE      25,35,2,-44,22
theAttrib      BYTE      18

.code
  main PROC
  mov esi,0

  movzx edx,theAttrib

  mov ecx,5
 TOP:
     movzx     ebx,theChars[esi]
     call      PrintCharAttrib
     add       edx,17
     inc       esi
     loop      TOP
     call      Crlf  
         
     exit   

  main ENDP

  PrintCharAttrib PROC
     push      eax

     mov       eax,edx        ;; the attribute param
     call      SetTextColor
     mov       eax,ebx        ;; the character
     call      WriteChar
     pop       eax

     ret
  PrintCharAttrib ENDP
END main