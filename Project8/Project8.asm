; Hunter Crisp
; Project 8
; Greatest Common Divisor

INCLUDE Irvine32.inc

.data
	
	numbers SDWORD 5, 20, 24, 18, 11, 7, 432, 226, 26, 13
	msg1 BYTE "Greatest common divisor of(", 0
	msg2 BYTE ",", 0
	msg3 BYTE ") is: ", 0
	;msg2 BYTE "calculated by recursion: ", 0
	
.code
main PROC

	mov ecx, LENGTHOF numbers / 2
	mov esi, OFFSET numbers


L1:
	mov edx, OFFSET msg1		; display result
	call WriteString			; print first part of message

	mov eax, [esi]
	call WriteDec				; print x

	mov edx, OFFSET msg2		; print ,
	call WriteString
	
	mov eax, [esi + 4]
	call WriteDec				; print y

	mov edx, OFFSET msg3		; print last part of message
	call WriteString

	mov eax, [esi]
	mov ebx, [esi + 4]
	call GCDI
	call WriteDec				; print result
	call Crlf
	add esi, TYPE numbers * 2
	loop L1

	call WaitMsg
	exit

main ENDP

GCDI PROC
	push ebx
	push edx

	cmp eax, 0 				; Check if less than 0
	jl L2					; jump if less than 0

L6:
	cmp ebx, 0 				
	jl L3
	
	jmp L4					; if neither are negative, jump

L2:
	neg eax					; Make value positive
	jmp L6

L3:
	neg ebx

L4:
	mov edx, 0				; set remainder to 0
	idiv ebx					; remainder of eax/ebx is stored in edx
	cmp edx, 0 				; if edx is 0, gcd is found, jump to L5
	je L5
	mov eax, ebx				; else, store ebx in eax,
	mov ebx, edx				; and store edx in ebx
	jmp L4					; repeat loop

L5: 
	mov eax, ebx				; GCD found

	pop edx
	pop ebx
	ret

GCDI ENDP

END main