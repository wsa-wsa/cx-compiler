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
# store i32 23, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 23
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# store i32 25, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 25
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -60
# store i32 4, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op5 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -68
# %op7 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -72
# %op8 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -76
# %op9 = mul i32 %op7, %op8
	ld.w $t0, $fp, -72
	ld.w $t1, $fp, -76
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# %op10 = add i32 %op6, %op9
	ld.w $t0, $fp, -68
	ld.w $t1, $fp, -80
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# ret i32 %op10
	ld.w $a0, $fp, -84
	b main_exit
main_exit:
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
