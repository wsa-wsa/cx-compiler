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
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -44
# br label %label_while0
	b .main_label_while0
.main_label_while0:
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -48
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -49
# br i1 %op4, label %label_true0, label %label_false0
	ld.b $t0, $fp, -49
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op5 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -53
# %op6 = sub i32 %op5, 1
	ld.w $t0, $fp, -53
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -57
# store i32 %op6, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -57
	st.w $t1, $t0, 0
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -61
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -65
# store i32 %op8, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -65
	st.w $t1, $t0, 0
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -69
# br label %label_while1
	b .main_label_while1
.main_label_false0:
# %op10 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -73
# %op11 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -77
# %op12 = add i32 %op10, %op11
	ld.w $t0, $fp, -73
	ld.w $t1, $fp, -77
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -81
# ret i32 %op12
	ld.w $a0, $fp, -81
	b main_exit
.main_label_while1:
# %op13 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -85
# %op14 = icmp ne i32 %op13, 0
	ld.w $t0, $fp, -85
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -86
# br i1 %op14, label %label_true1, label %label_false1
	ld.b $t0, $fp, -86
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true1
	b .main_label_false1
.main_label_true1:
# %op15 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -90
# %op16 = sub i32 %op15, 1
	ld.w $t0, $fp, -90
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -94
# store i32 %op16, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -94
	st.w $t1, $t0, 0
# %op17 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -98
# br label %label_while1
	b .main_label_while1
.main_label_false1:
# br label %label_while0
	b .main_label_while0
main_exit:
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
