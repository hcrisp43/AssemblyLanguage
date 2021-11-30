; Hunter Crisp
; Project 6
; Boolean Calculator

INCLUDE Irvine32.inc

.data
	menu BYTE "----Boolean Calculator----", 0dh, 0ah
	BYTE 0dh, 0ah
	BYTE "1. X AND Y", 0dh, 0ah
	BYTE "2. X OR Y", 0dh, 0ah
	BYTE "3. NOT X", 0dh, 0ah
	BYTE "4. X XOR Y", 0dh, 0ah
	BYTE "5. Exit program", 0dh, 0ah
	BYTE "Enter your choice: ", 0

	msgAND BYTE "Boolean AND", 0
	msgOR BYTE "Boolean OR", 0
	msgNOT BYTE "Boolean NOT", 0
	msgXOR BYTE "Boolean XOR", 0

	msgO1 BYTE "Input the first 32-bit hexadecimal operand: ", 0
	msgO2 BYTE "Input the second 32-bit hexadecimal operand: ", 0
	msgResult BYTE "The 32-bit hexadecimal result is: ", 0
	msgError BYTE "Not an option. Please choose from 1-5: ", 0

	CaseTable BYTE '1'
	DWORD AND_op
	EntrySize = ($ - CaseTable)
	BYTE '2'
	DWORD OR_op
	BYTE '3'
	DWORD NOT_op
	BYTE '4'
	DWORD XOR_op
	NumberOfEntries = ($ - CaseTable) / EntrySize

.code
main PROC
Display_Menu:
	mov edx, OFFSET menu
	call WriteString

Get_Choice:
	call ReadChar
	call WriteChar
	mov ebx, OFFSET CaseTable
	mov ecx, NumberOfEntries

Loop_CaseTable:
	cmp al, [ebx]
	jne Not_Match
	call Near PTR [ebx + 1]
	call Crlf
	jmp Display_Menu

Not_Match:
	add ebx, EntrySize
	loop Loop_CaseTable

	cmp al, '5'
	je Exit_Program
	mov edx, OFFSET msgError
	call Crlf
	call WriteString
	jmp Get_Choice

Exit_Program:
	exit
main ENDP

AND_op PROC
	pushad
	call Crlf
	mov edx, OFFSET msgAND
	call WriteString
	call Crlf

	mov edx, OFFSET msgO1		; ask user for first operand
	call WriteString
	call ReadHex
	mov ebx, eax				; store first operand in ebx

	mov edx, OFFSET msgO2		; ask user for second operand
	call WriteString
	call ReadHex
	and eax, ebx				; O1 and O2 is stored in eax
	mov edx, OFFSET msgResult	; print result string
	call WriteString
	call WriteHex				; print result number

	call Crlf
	call Crlf
	popad
	ret
AND_op ENDP

OR_op PROC
	pushad
	call Crlf
	mov edx, OFFSET msgOR
	call WriteString
	call Crlf

	mov edx, OFFSET msgO1		; ask user for first operand
	call WriteString
	call ReadHex
	mov ebx, eax				; store first operand in ebx

	mov edx, OFFSET msgO2		; ask user for second operand
	call WriteString
	call ReadHex
	or eax, ebx				; O1 or O2 is stored in eax
	mov edx, OFFSET msgResult	; print result string
	call WriteString
	call WriteHex				; print result number

	call Crlf
	call Crlf
	popad
	ret
OR_op ENDP

NOT_op PROC
	pushad
	call Crlf
	mov edx, OFFSET msgOR
	call WriteString
	call Crlf

	mov edx, OFFSET msgO1		; ask user for first operand
	call WriteString
	call ReadHex
	not eax					; not O1 is stored in eax
	mov edx, OFFSET msgResult	; print result string
	call WriteString
	call WriteHex				; print result number

	call Crlf
	call Crlf
	popad
	ret
NOT_op ENDP

XOR_op PROC
	pushad
	call Crlf
	mov edx, OFFSET msgXOR
	call WriteString
	call Crlf

	mov edx, OFFSET msgO1		; ask user for first operand
	call WriteString
	call ReadHex
	mov ebx, eax				; store first operand in ebx

	mov edx, OFFSET msgO2		; ask user for second operand
	call WriteString
	call ReadHex
	xor eax, ebx				; O1 xor O2 is stored in eax
	mov edx, OFFSET msgResult	; print result string
	call WriteString
	call WriteHex				; print result number

	call Crlf
	call Crlf
	popad
	ret
XOR_op ENDP

END main