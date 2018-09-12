 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func

pdm:
@ write the code for pdm(CM,M,index) here

		/** Here we push all data values from register 3-11
		into the stack	*/

		STMDB SP!,{R3-R11}

		/** Here we subtract one from the order of
		confusion matrix */
		LDR R12, [R0]
		MOV R3, R0 		//offset addresser

		/** Here we calculate the offset mnumber for row
		and lode the n(mm) value in R3 for devision */
		MOV R4, #4
		MUL R4, R4, R1
		ADD R4, #4
		MUL R4,R2,R4
		ADD R3,R3,R4
		LDR R3, [R3]
		MOVW R4,#10000
		MUL R3,R3,R4

		SUBS R1, 1

		/**

		*/
		@params effective address of R0
LOOP:
		LDR R11, [R0, #4]
		ADD R12, R12, R11
		ADD R0, R0, #4
        SUBS R1, 1
        BNE LOOP

		UDIV R0,R3,R12

		LDMIA SP!,{R3-R11} // POP back the datas for R1-R12.

		BX	LR
