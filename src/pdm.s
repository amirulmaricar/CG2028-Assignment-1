 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func

pdm:
@ write the code for pdm(CM,M,index) here
		STMDB SP!,{R3-R11} //Push all the data from R1-R12 to memory

		SUBS R1, 1 //sIZE OF THE M -1
		LDR R12, [R0]
		MOV R3, R0
		//LDR R11, [R0, #4]
		//ADD R12, R12, R11
		//ADD R0, R0, #4
LOOP:
		LDR R11, [R0, #4]
		ADD R12, R12, R11
		ADD R0, R0, #4
        SUBS R1, 1
        BNE LOOP

	MOV R4,#16 //MUST EDIT
	MUL R4,R2,R4
	ADD R3,R3,R4
	LDR R3, [R3]
	MOV R4,#1000 //EDIT
	MUL R3,R3,R4
	MOV R4,#10
	MUL R3,R3,R4

	UDIV R0,R3,R12

	LDMIA SP!,{R3-R11} // POP back the datas for R1-R12.

	BX	LR
