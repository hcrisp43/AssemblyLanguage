;// Project 3 First MASM Program
.386 
.model flat,stdcall 
.stack 4096 
ExitProcess PROTO, dwExitCode:DWORD 

JAN EQU <"January",0>
FEB EQU <"February",0>
MAR EQU <"March",0>
APR EQU <"April",0>

.data 
	;// declare variables here
mon = 1
tue = 2
wed = 3
thu = 4
fri = 5
sat = 6
sun = 7

week DWORD mon, tue, wed, thu, fri, sat, sun

val1 BYTE 15
val2 SBYTE -15
val3 WORD 10000
val4 SWORD -10000
val5 DWORD 200000h
val6 SDWORD -200000
val7 QWORD 1234567812345678h
val8 TBYTE 80000000000000001234h
val9 REAL4 -5.3
val10 REAL8 1.3E+200
val11 REAL10 2.1E+3900

month1 BYTE JAN
month2 BYTE FEB
month3 BYTE MAR
month4 BYTE APR

.code 
main PROC 
	;// write your code here
	mov eax,5
	mov ebx,6
	mov ecx,4
	mov edx,3

	add eax,ebx
	add ecx,edx
	sub eax,ecx

	INVOKE ExitProcess,0 
main ENDP 
END main