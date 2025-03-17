	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -160
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -80
# %op3 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -81
# br i1 %op3, label %label_neg0, label %label_valid0
	ld.b $t0, $fp, -81
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg0
	b .main_label_valid0
.main_label_valid0:
# %op4 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -89
# store i32 11, i32* %op4
	ld.d $t0, $fp, -89
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# %op5 = load i32, i32* %op4
	ld.d $t0, $fp, -89
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -93
# %op6 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -94
# br i1 %op6, label %label_neg1, label %label_valid1
	ld.b $t0, $fp, -94
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg1
	b .main_label_valid1
.main_label_neg0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid0
	b .main_label_valid0
.main_label_valid1:
# %op7 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 4
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -102
# store i32 22, i32* %op7
	ld.d $t0, $fp, -102
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# %op8 = load i32, i32* %op7
	ld.d $t0, $fp, -102
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -106
# %op9 = icmp slt i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -107
# br i1 %op9, label %label_neg2, label %label_valid2
	ld.b $t0, $fp, -107
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg2
	b .main_label_valid2
.main_label_neg1:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid1
	b .main_label_valid1
.main_label_valid2:
# %op10 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 9
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -115
# store i32 33, i32* %op10
	ld.d $t0, $fp, -115
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op11 = load i32, i32* %op10
	ld.d $t0, $fp, -115
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -119
# %op12 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -120
# br i1 %op12, label %label_neg3, label %label_valid3
	ld.b $t0, $fp, -120
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg3
	b .main_label_valid3
.main_label_neg2:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid2
	b .main_label_valid2
.main_label_valid3:
# %op13 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -128
# %op14 = load i32, i32* %op13
	ld.d $t0, $fp, -128
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -132
# call void @output(i32 %op14)
	ld.w $a0, $fp, -132
	bl output
# %op15 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -133
# br i1 %op15, label %label_neg4, label %label_valid4
	ld.b $t0, $fp, -133
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg4
	b .main_label_valid4
.main_label_neg3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid3
	b .main_label_valid3
.main_label_valid4:
# %op16 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 4
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -141
# %op17 = load i32, i32* %op16
	ld.d $t0, $fp, -141
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -145
# call void @output(i32 %op17)
	ld.w $a0, $fp, -145
	bl output
# %op18 = icmp slt i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -146
# br i1 %op18, label %label_neg5, label %label_valid5
	ld.b $t0, $fp, -146
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg5
	b .main_label_valid5
.main_label_neg4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid4
	b .main_label_valid4
.main_label_valid5:
# %op19 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 9
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -154
# %op20 = load i32, i32* %op19
	ld.d $t0, $fp, -154
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -158
# call void @output(i32 %op20)
	ld.w $a0, $fp, -158
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label_neg5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid5
	b .main_label_valid5
main_exit:
	addi.d $sp, $sp, 160
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
