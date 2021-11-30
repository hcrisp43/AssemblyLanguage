; Project 4 
; Hunter Crisp
.386 
.model flat,stdcall 
.stack 4096 
ExitProcess PROTO, dwExitCode:DWORD 
.data 
	
	source BYTE "This is the string that will be reversed",0
	target BYTE SIZEOF source DUP('#')

.code 
main PROC 
	mov esi, OFFSET target - 2       ;source index
	mov edi, OFFSET target			 ;target index
	mov ecx, SIZEOF source - 1		 ;loop counter

	L1:
		mov al,[esi]
		mov [edi],al
		dec esi
		inc edi
		loop L1

	mov BYTE PTR [edi],0

	INVOKE ExitProcess,0 
main ENDP 
END main