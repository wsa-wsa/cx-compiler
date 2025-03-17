	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -40
	st.d $t0, $fp, -36
# %op2 = icmp slt i32 1, 3
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 3
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -41
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	st.w $t1, $fp, -45
# store i32 %op3, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -45
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -49
# %op5 = sitofp i32 2 to float
	addi.w $t0, $zero, 2
	movgr2fr.w $ft0, $t0
	ffint.s.w $ft0, $ft0
	fst.s $ft0, $fp, -53
# %op6 = fadd float %op5, 0x4003333340000000
	fld.s $ft0, $fp, -53
	lu12i.w $t8, 262553
	ori $t8, $t8, 2458
	movgr2fr.w $ft1, $t8
	fadd.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -57
# %op7 = fptosi float %op6 to i32
	fld.s $ft0, $fp, -57
	ftintrz.w.s $ft0, $ft0
	movfr2gr.s $t0, $ft0
	st.w $t0, $fp, -61
# store i32 %op7, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -61
	st.w $t1, $t0, 0
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -65
# %op9 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -69
# %op10 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -73
# %op11 = add i32 %op9, %op10
	ld.w $t0, $fp, -69
	ld.w $t1, $fp, -73
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# ret i32 %op11
	ld.w $a0, $fp, -77
	b main_exit
main_exit:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
