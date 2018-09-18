 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func

pdm:
@ The code for pdm(CM,M,index) starts here

		/** Here we push all data values from register 3-11
		into the stack */
		STMDB SP!,{R3-R11} //NA

		LDR R12, [R0]		//0x0490C000

		//** Here we move the address of memory location 
		containing element (1,1) */
		MOV R3, R0 			//0x01A03000

		/** Here we calculate the offset mnumber for row
		and load the n(mm) value in R3 for division */
		MOV R4, #4			//0x03A04004
		MUL R4, R4, R1		//0x00004114
		ADD R4, #4			//0x02844004
		MUL R4,R2,R4		//0x00004412
		ADD R3,R3,R4 		//0x00833004
		LDR R3, [R3]		//0x04933000
		MOVW R4,#10000		//NA
		MUL R3,R3,R4		//0x00003413

		/** Here we subtract one from the order of
		confusion matrix */
		SUB R1, 1			//0x02411001

		/** 1) Here we loop for M number times, when
		M is the size of confusion matrix.
		2) Add all the elements in the same row */
LOOP:
		LDR R11, [R0, #4]	//0x0490B004
		ADD R12, R12, R11	//0x008CC00B
		ADD R0, R0, #4		//0x02800004
        SUBS R1, 1			//0x02511001
        BNE LOOP			//0x08000014

		UDIV R0,R3,R12		//NA

		LDMIA SP!,{R3-R11} // POP back the datas for R3-R11.

		BX	LR
