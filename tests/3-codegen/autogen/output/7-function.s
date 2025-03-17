	.text
	.globl min
	.type min, @function
min:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.min_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -36
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t0, $fp, -48
	st.d $t0, $fp, -44
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# br label %label_loop0
	b .min_label_loop0
.min_label_loop0:
# %op4 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -52
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# %op6 = icmp sle i32 %op4, %op5
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -56
	sub.w $t2, $t0, $t1
	slti $t3, $t2, 1
	st.b $t3, $fp, -57
# br i1 %op6, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -57
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .min_label_true0
	b .min_label_falseBB0
.min_label_true0:
# %op7 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -61
# ret i32 %op7
	ld.w $a0, $fp, -61
	b min_exit
.min_label_falseBB0:
# %op8 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -65
# ret i32 %op8
	ld.w $a0, $fp, -65
	b min_exit
.min_label_other0:
# ret i32 0
	addi.w $a0, $zero, 0
	b min_exit
min_exit:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
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
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -68
# %op7 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -72
# %op8 = call i32 @min(i32 %op6, i32 %op7)
	ld.w $a0, $fp, -68
	ld.w $a1, $fp, -72
	bl min
	st.w $a0, $fp, -76
# call void @output(i32 %op8)
	ld.w $a0, $fp, -76
	bl output
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -80
# %op10 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -84
# %op11 = call i32 @min(i32 %op9, i32 %op10)
	ld.w $a0, $fp, -80
	ld.w $a1, $fp, -84
	bl min
	st.w $a0, $fp, -88
# call void @output(i32 %op11)
	ld.w $a0, $fp, -88
	bl output
# %op12 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -92
# %op13 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -96
# %op14 = call i32 @min(i32 %op12, i32 %op13)
	ld.w $a0, $fp, -92
	ld.w $a1, $fp, -96
	bl min
	st.w $a0, $fp, -100
# call void @output(i32 %op14)
	ld.w $a0, $fp, -100
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
