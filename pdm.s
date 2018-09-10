	MUL R1, R1, R1
	LDR R3, [R0]
	LDR R4, [R0, #4]
	ADD R0, R0, #4

l1:
	ADD R3, R3, R4
	LDR R3, [R0, #4]
