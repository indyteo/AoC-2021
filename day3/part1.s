ONE_AND_A_HALF_BYTE EQU 0xFFF

	AREA |.text|, CODE, READONLY
	ENTRY
	EXPORT __main

	IMPORT INPUT
	IMPORT LENGTH

__main
	LDR R0, =LENGTH
	LDRH R3, [R0] ; Input length
	LDR R0, =INPUT ; Input values address

	LSR R6, R3, #1 ; Half of input length
	MOV R7, #0 ; Intermediary result

	MOV R4, #1 ; Reading mask
	LSL R4, #11
__loop_each_bit
	MOV R5, #0 ; Count of "1" bit

	MOV R1, R3 ; Input value index
	LSL R1, #1
	SUB R1, #2
__loop_each_value
	LDRH R2, [R0, R1] ; Input value
	ANDS R2, R4
	ADDNE R5, #1

	SUBS R1, #2
	BPL __loop_each_value ; Continue if > 0

	CMP R5, R6
	ORRMI R7, R4

	LSRS R4, #1
	BNE __loop_each_bit ; Continue if > 0

	MVN R8, R7
	LDR R9, =ONE_AND_A_HALF_BYTE
	AND R8, R9
	MUL R9, R7, R8 ; Final result

	NOP

	END
