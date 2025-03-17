	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
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
# store i32 11, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# store i32 22, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -60
# store i32 33, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op5 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# br label %label_loop0
	b .main_label_loop0
.main_label_loop0:
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -68
# %op7 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -72
# %op8 = icmp sgt i32 %op6, %op7
	ld.w $t0, $fp, -68
	ld.w $t1, $fp, -72
	sub.w $t2, $t1, $t0
	slt $t3, $t2, $zero
	st.b $t3, $fp, -73
# br i1 %op8, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -73
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_falseBB0
.main_label_true0:
# br label %label_loop1
	b .main_label_loop1
.main_label_falseBB0:
# br label %label_loop2
	b .main_label_loop2
.main_label_other0:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label_loop1:
# %op9 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -77
# %op10 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -81
# %op11 = icmp sgt i32 %op9, %op10
	ld.w $t0, $fp, -77
	ld.w $t1, $fp, -81
	sub.w $t2, $t1, $t0
	slt $t3, $t2, $zero
	st.b $t3, $fp, -82
# br i1 %op11, label %label_true1, label %label_falseBB1
	ld.b $t0, $fp, -82
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true1
	b .main_label_falseBB1
.main_label_true1:
# %op12 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -86
# call void @output(i32 %op12)
	ld.w $a0, $fp, -86
	bl output
# br label %label_other1
	b .main_label_other1
.main_label_falseBB1:
# %op13 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -90
# call void @output(i32 %op13)
	ld.w $a0, $fp, -90
	bl output
# br label %label_other1
	b .main_label_other1
.main_label_other1:
# br label %label_other0
	b .main_label_other0
.main_label_loop2:
# %op14 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -94
# %op15 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -98
# %op16 = icmp slt i32 %op14, %op15
	ld.w $t0, $fp, -94
	ld.w $t1, $fp, -98
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -99
# br i1 %op16, label %label_true2, label %label_falseBB2
	ld.b $t0, $fp, -99
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true2
	b .main_label_falseBB2
.main_label_true2:
# %op17 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -103
# call void @output(i32 %op17)
	ld.w $a0, $fp, -103
	bl output
# br label %label_other2
	b .main_label_other2
.main_label_falseBB2:
# %op18 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -107
# call void @output(i32 %op18)
	ld.w $a0, $fp, -107
	bl output
# br label %label_other2
	b .main_label_other2
.main_label_other2:
# br label %label_other0
	b .main_label_other0
main_exit:
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
