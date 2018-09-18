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

		STMDB SP!,{R3-R11} //NA

		/** Here we subtract one from the order of
		confusion matrix */
		LDR R12, [R0]		//0x0490C000

		//offset addresser
		MOV R3, R0 			//03464FF0( nOT SURE)

		/** Here we calculate the offset mnumber for row
		and lode the n(mm) value in R3 for devision */
		MOV R4, #4			//040404FB (NOT SURE)
		MUL R4, R4, R1		//0x00004114
		ADD R4, #4			//0x02844004
		MUL R4,R2,R4		//0x00004412
		ADD R3,R3,R4 		//0x00833004
		LDR R3, [R3]		//0x04933000
		MOVW R4,#10000		//NA
		MUL R3,R3,R4		//0x00003413

		SUB R1, 1			//0x02411001

		/**

		*/
		@params effective address of R0
LOOP:
		LDR R11, [R0, #4]	//0x0490B004
		ADD R12, R12, R11	//0x008CC00B
		ADD R0, R0, #4		//0x02800004
        SUBS R1, 1			//0x02511001
        BNE LOOP			//0x08000014

		UDIV R0,R3,R12		//NA

		LDMIA SP!,{R3-R11} // POP back the datas for R1-R12.

		BX	LR
