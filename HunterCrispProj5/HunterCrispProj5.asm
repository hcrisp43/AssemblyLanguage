; Hunter Crisp
; Project 5

INCLUDE Irvine32.inc

.data

capital BYTE "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 0
randString BYTE 5 DUP(? ), 0

endPrompt BYTE "Press any key to continue...", 0

.code
main PROC

	mov ecx, 10
	mov esi, OFFSET capital
	L1 :
	call GenerateString
	loop L1
	
	mov edx, OFFSET endPrompt
	call WriteString
	call ReadChar
	exit
main ENDP


GenerateString PROC

	push ecx
	push esi
	mov ecx, SIZEOF randString - 1	; loop sizeof randString - 1 times
	mov esi, 0					; index for randString
			
	L2:							; store upper bound of random range in eax
		mov eax, sizeof capital - 1
		call RandomRange			; generate random number and store in eax

		mov bl, capital[eax]		; get char at random location
		mov randString[esi], bl
		INC esi
		loop L2

	mov edx, OFFSET randString
	call WriteString
	call Crlf
	pop ecx
	pop esi
	ret

GenerateString ENDP

END main