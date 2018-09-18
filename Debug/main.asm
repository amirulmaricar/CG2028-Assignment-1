   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC1:
  21 0000 2566200A 		.ascii	"%f \012\000"
  21      00
  22              		.global	__aeabi_i2d
  23              		.global	__aeabi_ddiv
  24 0005 000000   		.align	2
  25              	.LC0:
  26 0008 3C000000 		.word	60
  27 000c 02000000 		.word	2
  28 0010 03000000 		.word	3
  29 0014 00000000 		.word	0
  30 0018 00000000 		.word	0
  31 001c 00000000 		.word	0
  32 0020 0B000000 		.word	11
  33 0024 2F000000 		.word	47
  34 0028 07000000 		.word	7
  35 002c 00000000 		.word	0
  36 0030 00000000 		.word	0
  37 0034 00000000 		.word	0
  38 0038 1B000000 		.word	27
  39 003c 0E000000 		.word	14
  40 0040 18000000 		.word	24
  41 0044 00000000 		.word	0
  42 0048 00000000 		.word	0
  43 004c 00000000 		.word	0
  44 0050 00000000 		.word	0
  45 0054 00000000 		.word	0
  46 0058 00000000 		.word	0
  47 005c 3C000000 		.word	60
  48 0060 02000000 		.word	2
  49 0064 03000000 		.word	3
  50 0068 00000000 		.word	0
  51 006c 00000000 		.word	0
  52 0070 00000000 		.word	0
  53 0074 0B000000 		.word	11
  54 0078 2F000000 		.word	47
  55 007c 07000000 		.word	7
  56 0080 00000000 		.word	0
  57 0084 00000000 		.word	0
  58 0088 00000000 		.word	0
  59 008c 1B000000 		.word	27
  60 0090 0E000000 		.word	14
  61 0094 18000000 		.word	24
  62              		.section	.text.main,"ax",%progbits
  63              		.align	2
  64              		.global	main
  65              		.thumb
  66              		.thumb_func
  68              	main:
  69              	.LFB0:
  70              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** 
   3:../src/main.c **** extern int pdm(int* base, int ncol, int index);
   4:../src/main.c **** 
   5:../src/main.c **** // CG2028 Assignment 1, Sem 1, AY 2018/19
   6:../src/main.c **** // (c) CK Tham, ECE NUS, 2018
   7:../src/main.c **** 
   8:../src/main.c **** // Dimension of confusion matrix, i.e. MxM square matrix
   9:../src/main.c **** // Note: pdm() must work for different values of M, e.g. M=10
  10:../src/main.c **** #define M 6
  11:../src/main.c **** 
  12:../src/main.c **** int main(void)
  13:../src/main.c **** {
  71              		.loc 1 13 0
  72              		.cfi_startproc
  73              		@ args = 0, pretend = 0, frame = 152
  74              		@ frame_needed = 1, uses_anonymous_args = 0
  75 0000 90B5     		push	{r4, r7, lr}
  76              	.LCFI0:
  77              		.cfi_def_cfa_offset 12
  78              		.cfi_offset 14, -4
  79              		.cfi_offset 7, -8
  80              		.cfi_offset 4, -12
  81 0002 A7B0     		sub	sp, sp, #156
  82              	.LCFI1:
  83              		.cfi_def_cfa_offset 168
  84 0004 00AF     		add	r7, sp, #0
  85              	.LCFI2:
  86              		.cfi_def_cfa_register 7
  14:../src/main.c **** 	// Variable definitions
  15:../src/main.c **** 	int index;
  16:../src/main.c **** 	// Note: different initialisation list is needed for different M
  17:../src/main.c **** 	int CM[M][M]={{60,2,3,0,0,0},{11,47,7,0,0,0},{27,14,24,0,0,0},{0,0,0,60,2,3},{0,0,0,11,47,7},{0,0,
  87              		.loc 1 17 0
  88 0006 40F20003 		movw	r3, #:lower16:.LC0
  89 000a C0F20003 		movt	r3, #:upper16:.LC0
  90 000e 07F10401 		add	r1, r7, #4
  91 0012 1A46     		mov	r2, r3
  92 0014 4FF09003 		mov	r3, #144
  93 0018 0846     		mov	r0, r1
  94 001a 1146     		mov	r1, r2
  95 001c 1A46     		mov	r2, r3
  96 001e FFF7FEFF 		bl	memcpy
  18:../src/main.c **** 
  19:../src/main.c **** 	// PDm: Call assembly language function pdm() for each class m
  20:../src/main.c **** 	// note: index = m - 1
  21:../src/main.c **** 	for ( index=0; index<M; index++ )
  97              		.loc 1 21 0
  98 0022 4FF00003 		mov	r3, #0
  99 0026 C7F89430 		str	r3, [r7, #148]
 100 002a 24E0     		b	.L2
 101              	.L3:
  22:../src/main.c **** 		printf("%f \n", pdm((int*)CM, M, index)/10000.0);
 102              		.loc 1 22 0 discriminator 2
 103 002c 40F20004 		movw	r4, #:lower16:.LC1
 104 0030 C0F20004 		movt	r4, #:upper16:.LC1
 105 0034 07F10403 		add	r3, r7, #4
 106 0038 1846     		mov	r0, r3
 107 003a 4FF00601 		mov	r1, #6
 108 003e D7F89420 		ldr	r2, [r7, #148]
 109 0042 FFF7FEFF 		bl	pdm
 110 0046 0346     		mov	r3, r0
 111 0048 1846     		mov	r0, r3
 112 004a FFF7FEFF 		bl	__aeabi_i2d
 113 004e 0246     		mov	r2, r0
 114 0050 0B46     		mov	r3, r1
 115 0052 1046     		mov	r0, r2
 116 0054 1946     		mov	r1, r3
 117 0056 10A3     		adr	r3, .L5
 118 0058 D3E90023 		ldrd	r2, [r3]
 119 005c FFF7FEFF 		bl	__aeabi_ddiv
 120 0060 0246     		mov	r2, r0
 121 0062 0B46     		mov	r3, r1
 122 0064 2046     		mov	r0, r4
 123 0066 FFF7FEFF 		bl	printf
  21:../src/main.c **** 	for ( index=0; index<M; index++ )
 124              		.loc 1 21 0 discriminator 2
 125 006a D7F89430 		ldr	r3, [r7, #148]
 126 006e 03F10103 		add	r3, r3, #1
 127 0072 C7F89430 		str	r3, [r7, #148]
 128              	.L2:
  21:../src/main.c **** 	for ( index=0; index<M; index++ )
 129              		.loc 1 21 0 is_stmt 0 discriminator 1
 130 0076 D7F89430 		ldr	r3, [r7, #148]
 131 007a 052B     		cmp	r3, #5
 132 007c D6DD     		ble	.L3
 133              	.L4:
  23:../src/main.c **** 
  24:../src/main.c **** 	// Enter an infinite loop, just incrementing a counter
  25:../src/main.c **** 	volatile static int loop = 0;
  26:../src/main.c **** 	while (1) {
  27:../src/main.c **** 		loop++;
 134              		.loc 1 27 0 is_stmt 1 discriminator 1
 135 007e 40F20003 		movw	r3, #:lower16:loop.3818
 136 0082 C0F20003 		movt	r3, #:upper16:loop.3818
 137 0086 1B68     		ldr	r3, [r3, #0]
 138 0088 03F10102 		add	r2, r3, #1
 139 008c 40F20003 		movw	r3, #:lower16:loop.3818
 140 0090 C0F20003 		movt	r3, #:upper16:loop.3818
 141 0094 1A60     		str	r2, [r3, #0]
  28:../src/main.c **** 	}
 142              		.loc 1 28 0 discriminator 1
 143 0096 F2E7     		b	.L4
 144              	.L6:
 145              		.align	3
 146              	.L5:
 147 0098 00000000 		.word	0
 148 009c 0088C340 		.word	1086556160
 149              		.cfi_endproc
 150              	.LFE0:
 152              		.bss
 153              		.align	2
 154              	loop.3818:
 155 0000 00000000 		.space	4
 156              		.text
 157              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\User\AppData\Local\Temp\ccoFSPGQ.s:19     .rodata:00000000 $d
C:\Users\User\AppData\Local\Temp\ccoFSPGQ.s:20     .rodata:00000000 .LC1
C:\Users\User\AppData\Local\Temp\ccoFSPGQ.s:25     .rodata:00000008 .LC0
C:\Users\User\AppData\Local\Temp\ccoFSPGQ.s:63     .text.main:00000000 $t
C:\Users\User\AppData\Local\Temp\ccoFSPGQ.s:68     .text.main:00000000 main
C:\Users\User\AppData\Local\Temp\ccoFSPGQ.s:154    .bss:00000000 loop.3818
C:\Users\User\AppData\Local\Temp\ccoFSPGQ.s:147    .text.main:00000098 $d
C:\Users\User\AppData\Local\Temp\ccoFSPGQ.s:153    .bss:00000000 $d
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
__aeabi_i2d
__aeabi_ddiv
memcpy
pdm
printf
