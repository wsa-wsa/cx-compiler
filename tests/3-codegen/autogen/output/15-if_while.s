	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
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
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# store i32 0, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -60
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op5 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# br label %label_while0
	b .main_label_while0
.main_label_while0:
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -68
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -69
# br i1 %op7, label %label_true0, label %label_false0
	ld.b $t0, $fp, -69
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -73
# %op9 = sub i32 %op8, 1
	ld.w $t0, $fp, -73
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# store i32 %op9, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -77
	st.w $t1, $t0, 0
# %op10 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -81
# br label %label_loop1
	b .main_label_loop1
.main_label_false0:
# %op11 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -85
# %op12 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -89
# %op13 = add i32 %op11, %op12
	ld.w $t0, $fp, -85
	ld.w $t1, $fp, -89
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -93
# ret i32 %op13
	ld.w $a0, $fp, -93
	b main_exit
.main_label_loop1:
# %op14 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -97
# %op15 = icmp slt i32 %op14, 5
	ld.w $t0, $fp, -97
	addi.w $t1, $zero, 5
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -98
# br i1 %op15, label %label_true1, label %label_falseBB1
	ld.b $t0, $fp, -98
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true1
	b .main_label_falseBB1
.main_label_true1:
# %op16 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -102
# %op17 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -106
# %op18 = add i32 %op16, %op17
	ld.w $t0, $fp, -102
	ld.w $t1, $fp, -106
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -110
# store i32 %op18, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -110
	st.w $t1, $t0, 0
# %op19 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -114
# br label %label_other1
	b .main_label_other1
.main_label_falseBB1:
# %op20 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -118
# %op21 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -122
# %op22 = add i32 %op20, %op21
	ld.w $t0, $fp, -118
	ld.w $t1, $fp, -122
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -126
# store i32 %op22, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -126
	st.w $t1, $t0, 0
# %op23 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -130
# br label %label_other1
	b .main_label_other1
.main_label_other1:
# br label %label_while0
	b .main_label_while0
main_exit:
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
