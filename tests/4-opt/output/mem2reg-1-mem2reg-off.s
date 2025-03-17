	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -368
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -40
	st.d $t0, $fp, -36
# %op2 = alloca i32
	addi.d $t0, $fp, -52
	st.d $t0, $fp, -48
# %op3 = alloca i32
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -60
# %op4 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# %op5 = alloca i32
	addi.d $t0, $fp, -88
	st.d $t0, $fp, -84
# %op6 = alloca i32
	addi.d $t0, $fp, -100
	st.d $t0, $fp, -96
# %op7 = call i32 @input()
	bl input
	st.w $a0, $fp, -104
# store i32 %op7, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t1, $fp, -104
	st.w $t1, $t0, 0
# %op8 = load i32, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -108
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op9 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -112
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op10 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -116
# store i32 0, i32* %op5
	ld.d $t0, $fp, -84
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op11 = load i32, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -120
# br label %label_while0
	b .main_label_while0
.main_label_while0:
# %op12 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -124
# %op13 = load i32, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -128
# %op14 = icmp slt i32 %op12, %op13
	ld.w $t0, $fp, -124
	ld.w $t1, $fp, -128
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -129
# br i1 %op14, label %label_true0, label %label_false0
	ld.b $t0, $fp, -129
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op15 = fmul float 0x3ff3c0c200000000, 0x4016f06a20000000
	lu12i.w $t8, 260576
	ori $t8, $t8, 1552
	movgr2fr.w $ft0, $t8
	lu12i.w $t8, 265080
	ori $t8, $t8, 849
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -133
# %op16 = fmul float %op15, 0x4002aa9940000000
	fld.s $ft0, $fp, -133
	lu12i.w $t8, 262485
	ori $t8, $t8, 1226
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -137
# %op17 = fmul float %op16, 0x4011781d80000000
	fld.s $ft0, $fp, -137
	lu12i.w $t8, 264380
	ori $t8, $t8, 236
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -141
# %op18 = fmul float %op17, 0x401962ac40000000
	fld.s $ft0, $fp, -141
	lu12i.w $t8, 265393
	ori $t8, $t8, 1378
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -145
# %op19 = fptosi float %op18 to i32
	fld.s $ft0, $fp, -145
	ftintrz.w.s $ft0, $ft0
	movfr2gr.s $t0, $ft0
	st.w $t0, $fp, -149
# store i32 %op19, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -149
	st.w $t1, $t0, 0
# %op20 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -153
# %op21 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -157
# %op22 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -161
# %op23 = mul i32 %op21, %op22
	ld.w $t0, $fp, -157
	ld.w $t1, $fp, -161
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -165
# %op24 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -169
# %op25 = mul i32 %op23, %op24
	ld.w $t0, $fp, -165
	ld.w $t1, $fp, -169
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -173
# %op26 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -177
# %op27 = mul i32 %op25, %op26
	ld.w $t0, $fp, -173
	ld.w $t1, $fp, -177
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -181
# %op28 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -185
# %op29 = mul i32 %op27, %op28
	ld.w $t0, $fp, -181
	ld.w $t1, $fp, -185
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -189
# %op30 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -193
# %op31 = mul i32 %op29, %op30
	ld.w $t0, $fp, -189
	ld.w $t1, $fp, -193
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -197
# store i32 %op31, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -197
	st.w $t1, $t0, 0
# %op32 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -201
# %op33 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -205
# %op34 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -209
# %op35 = mul i32 %op33, %op34
	ld.w $t0, $fp, -205
	ld.w $t1, $fp, -209
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -213
# %op36 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -217
# %op37 = mul i32 %op35, %op36
	ld.w $t0, $fp, -213
	ld.w $t1, $fp, -217
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -221
# %op38 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -225
# %op39 = mul i32 %op37, %op38
	ld.w $t0, $fp, -221
	ld.w $t1, $fp, -225
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -229
# %op40 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -233
# %op41 = mul i32 %op39, %op40
	ld.w $t0, $fp, -229
	ld.w $t1, $fp, -233
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -237
# %op42 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -241
# %op43 = mul i32 %op41, %op42
	ld.w $t0, $fp, -237
	ld.w $t1, $fp, -241
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -245
# store i32 %op43, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t1, $fp, -245
	st.w $t1, $t0, 0
# %op44 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -249
# %op45 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -253
# %op46 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -257
# %op47 = mul i32 %op45, %op46
	ld.w $t0, $fp, -253
	ld.w $t1, $fp, -257
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -261
# %op48 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -265
# %op49 = mul i32 %op47, %op48
	ld.w $t0, $fp, -261
	ld.w $t1, $fp, -265
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -269
# %op50 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -273
# %op51 = mul i32 %op49, %op50
	ld.w $t0, $fp, -269
	ld.w $t1, $fp, -273
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -277
# %op52 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -281
# %op53 = mul i32 %op51, %op52
	ld.w $t0, $fp, -277
	ld.w $t1, $fp, -281
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -285
# %op54 = load i32, i32* %op3
	ld.d $t0, $fp, -60
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -289
# %op55 = mul i32 %op53, %op54
	ld.w $t0, $fp, -285
	ld.w $t1, $fp, -289
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -293
# store i32 %op55, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -293
	st.w $t1, $t0, 0
# %op56 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -297
# %op57 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -301
# %op58 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -305
# %op59 = mul i32 %op57, %op58
	ld.w $t0, $fp, -301
	ld.w $t1, $fp, -305
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -309
# %op60 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -313
# %op61 = mul i32 %op59, %op60
	ld.w $t0, $fp, -309
	ld.w $t1, $fp, -313
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -317
# %op62 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -321
# %op63 = mul i32 %op61, %op62
	ld.w $t0, $fp, -317
	ld.w $t1, $fp, -321
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -325
# %op64 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -329
# %op65 = mul i32 %op63, %op64
	ld.w $t0, $fp, -325
	ld.w $t1, $fp, -329
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -333
# %op66 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -337
# %op67 = mul i32 %op65, %op66
	ld.w $t0, $fp, -333
	ld.w $t1, $fp, -337
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -341
# store i32 %op67, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t1, $fp, -341
	st.w $t1, $t0, 0
# %op68 = load i32, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -345
# %op69 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -349
# %op70 = add i32 %op69, 1
	ld.w $t0, $fp, -349
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -353
# store i32 %op70, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -353
	st.w $t1, $t0, 0
# %op71 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -357
# br label %label_while0
	b .main_label_while0
.main_label_false0:
# %op72 = load i32, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -361
# call void @output(i32 %op72)
	ld.w $a0, $fp, -361
	bl output
# ret void
	addi.d $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 368
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
