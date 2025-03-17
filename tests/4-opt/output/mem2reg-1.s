	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# br label %label_while0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -24
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -28
	b .main_label_while0
.main_label_while0:
# %op1 = phi i32 [ 0, %label_entry ], [ %op29, %label_true0 ]
# %op2 = phi i32 [ 0, %label_entry ], [ %op28, %label_true0 ]
# %op3 = icmp slt i32 %op1, %op0
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -20
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -29
# br i1 %op3, label %label_true0, label %label_false0
	ld.b $t0, $fp, -29
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op4 = fmul float 0x3ff3c0c200000000, 0x4016f06a20000000
	lu12i.w $t8, 260576
	ori $t8, $t8, 1552
	movgr2fr.w $ft0, $t8
	lu12i.w $t8, 265080
	ori $t8, $t8, 849
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -33
# %op5 = fmul float %op4, 0x4002aa9940000000
	fld.s $ft0, $fp, -33
	lu12i.w $t8, 262485
	ori $t8, $t8, 1226
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -37
# %op6 = fmul float %op5, 0x4011781d80000000
	fld.s $ft0, $fp, -37
	lu12i.w $t8, 264380
	ori $t8, $t8, 236
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -41
# %op7 = fmul float %op6, 0x401962ac40000000
	fld.s $ft0, $fp, -41
	lu12i.w $t8, 265393
	ori $t8, $t8, 1378
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -45
# %op8 = fptosi float %op7 to i32
	fld.s $ft0, $fp, -45
	ftintrz.w.s $ft0, $ft0
	movfr2gr.s $t0, $ft0
	st.w $t0, $fp, -49
# %op9 = mul i32 %op8, %op8
	ld.w $t0, $fp, -49
	ld.w $t1, $fp, -49
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -53
# %op10 = mul i32 %op9, %op8
	ld.w $t0, $fp, -53
	ld.w $t1, $fp, -49
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -57
# %op11 = mul i32 %op10, %op8
	ld.w $t0, $fp, -57
	ld.w $t1, $fp, -49
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -61
# %op12 = mul i32 %op11, %op8
	ld.w $t0, $fp, -61
	ld.w $t1, $fp, -49
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -65
# %op13 = mul i32 %op12, %op8
	ld.w $t0, $fp, -65
	ld.w $t1, $fp, -49
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -69
# %op14 = mul i32 %op13, %op13
	ld.w $t0, $fp, -69
	ld.w $t1, $fp, -69
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -73
# %op15 = mul i32 %op14, %op13
	ld.w $t0, $fp, -73
	ld.w $t1, $fp, -69
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# %op16 = mul i32 %op15, %op13
	ld.w $t0, $fp, -77
	ld.w $t1, $fp, -69
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -81
# %op17 = mul i32 %op16, %op13
	ld.w $t0, $fp, -81
	ld.w $t1, $fp, -69
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -85
# %op18 = mul i32 %op17, %op13
	ld.w $t0, $fp, -85
	ld.w $t1, $fp, -69
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -89
# %op19 = mul i32 %op18, %op18
	ld.w $t0, $fp, -89
	ld.w $t1, $fp, -89
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -93
# %op20 = mul i32 %op19, %op18
	ld.w $t0, $fp, -93
	ld.w $t1, $fp, -89
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -97
# %op21 = mul i32 %op20, %op18
	ld.w $t0, $fp, -97
	ld.w $t1, $fp, -89
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -101
# %op22 = mul i32 %op21, %op18
	ld.w $t0, $fp, -101
	ld.w $t1, $fp, -89
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -105
# %op23 = mul i32 %op22, %op18
	ld.w $t0, $fp, -105
	ld.w $t1, $fp, -89
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -109
# %op24 = mul i32 %op23, %op23
	ld.w $t0, $fp, -109
	ld.w $t1, $fp, -109
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -113
# %op25 = mul i32 %op24, %op23
	ld.w $t0, $fp, -113
	ld.w $t1, $fp, -109
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -117
# %op26 = mul i32 %op25, %op23
	ld.w $t0, $fp, -117
	ld.w $t1, $fp, -109
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -121
# %op27 = mul i32 %op26, %op23
	ld.w $t0, $fp, -121
	ld.w $t1, $fp, -109
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -125
# %op28 = mul i32 %op27, %op23
	ld.w $t0, $fp, -125
	ld.w $t1, $fp, -109
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -129
# %op29 = add i32 %op1, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -133
# br label %label_while0
	ld.w $a0, $fp, -133
	st.w $a0, $fp, -24
	ld.w $a0, $fp, -129
	st.w $a0, $fp, -28
	b .main_label_while0
.main_label_false0:
# call void @output(i32 %op2)
	ld.w $a0, $fp, -28
	bl output
# ret void
	addi.d $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
