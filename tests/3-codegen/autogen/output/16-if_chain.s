	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
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
# store i32 0, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# store i32 2, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -60
# store i32 1, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
# %op5 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# br label %label_loop0
	b .main_label_loop0
.main_label_loop0:
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -68
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -69
# br i1 %op7, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -69
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_falseBB0
.main_label_true0:
# br label %label_loop1
	b .main_label_loop1
.main_label_falseBB0:
# br label %label_other0
	b .main_label_other0
.main_label_other0:
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -73
# ret i32 %op8
	ld.w $a0, $fp, -73
	b main_exit
.main_label_loop1:
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -77
# %op10 = icmp ne i32 %op9, 0
	ld.w $t0, $fp, -77
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -78
# br i1 %op10, label %label_true1, label %label_falseBB1
	ld.b $t0, $fp, -78
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true1
	b .main_label_falseBB1
.main_label_true1:
# store i32 4, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op11 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -82
# br label %label_other1
	b .main_label_other1
.main_label_falseBB1:
# store i32 3, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op12 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -86
# br label %label_other1
	b .main_label_other1
.main_label_other1:
# br label %label_other0
	b .main_label_other0
main_exit:
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
