; Hunter Crisp
; Project 7
; Bitwise Multiplier

INCLUDE Irvine32.inc

.data

	msg1 BYTE "Enter the multiplicand: ", 0
	msg2 BYTE "Enter the multiplier: ", 0
	msg3 BYTE "The product is: ", 0
	msg4 BYTE "Do you want to do another calculation? (y/n): ", 0
	choice BYTE ?

.code
main PROC

user_loop:
	mov edx, offset msg2	; get multiplier
	call WriteString
	call ReadInt
	mov ebx, eax			; store in ebx

	mov edx, offset msg1	; get multiplicand
	call WriteString
	call ReadInt

	call Crlf

	call BWMult
	mov edx, offset msg3	; display result
	call WriteString
	call WriteDec
	call Crlf

	mov edx, offset msg4	; ask user if they want to repeat
	call WriteString
	call ReadChar

	call Crlf

	cmp al, 'y'
	je user_loop

	call WaitMsg
	exit

main ENDP

BWMult PROC
	push edx
	push ebx
	push ecx

	mov edx, eax
	mov ecx, 16
	mov eax, 0			; sum initial value is 0

L:
	test ebx, 00000001h		; if last bit in ebx is 1, add edx to eax
	jz NO_ADD				; else, jump to shift
	add eax, edx


NO_ADD:
	shl edx, 1			; shift multiplicand to left 1 bit
	shr ebx, 1			; shift multiplier to right 1 bit
	loop L

	pop ecx
	pop ebx
	pop edx
	ret
BWMult ENDP
END main