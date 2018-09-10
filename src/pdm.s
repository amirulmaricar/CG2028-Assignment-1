 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func

pdm:
@ write the code for pdm(CM,M,index) here
	MUL R1, R1, R1
	LDR R3, [R0]
	LDR R4, [R0, #4]
	ADD R0, R0, #4

l1:
	ADD R3, R3, R4
	LDR R3, [R0, #4]

	BX	LR
