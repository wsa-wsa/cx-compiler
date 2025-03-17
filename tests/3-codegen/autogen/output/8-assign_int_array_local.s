	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -65
# br i1 %op1, label %label_neg0, label %label_valid0
	ld.b $t0, $fp, -65
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg0
	b .main_label_valid0
.main_label_valid0:
# %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 3
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -73
# store i32 1234, i32* %op2
	ld.d $t0, $fp, -73
	addi.w $t1, $zero, 1234
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op2
	ld.d $t0, $fp, -73
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -77
# %op4 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -78
# br i1 %op4, label %label_neg1, label %label_valid1
	ld.b $t0, $fp, -78
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg1
	b .main_label_valid1
.main_label_neg0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid0
	b .main_label_valid0
.main_label_valid1:
# %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 3
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -86
# %op6 = load i32, i32* %op5
	ld.d $t0, $fp, -86
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -90
# ret i32 %op6
	ld.w $a0, $fp, -90
	b main_exit
.main_label_neg1:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid1
	b .main_label_valid1
main_exit:
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
