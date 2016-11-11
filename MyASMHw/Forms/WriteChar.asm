INCLUDE Irvine32.inc

.data

theChars       BYTE      "Bears"
theAttribs     BYTE      25,35,2,-44,22

.code
  main PROC
  mov esi,0
  mov ecx,5
 TOP:
     movzx     eax,theAttribs[esi]
     call      SetTextColor

     movzx     eax,BYTE PTR [esi] ;; get one char
     call      WriteChar
     inc       esi
     loop      TOP
     call      Crlf      
     exit   

  main ENDP
END main