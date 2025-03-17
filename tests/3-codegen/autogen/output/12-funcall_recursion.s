	.text
	.globl factorial
	.type factorial, @function
factorial:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
	st.w $a0, $fp, -20
.factorial_label_entry:
# %op1 = alloca i32
	addi.d $t0, $fp, -32
	st.d $t0, $fp, -28
# store i32 %arg0, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# br label %label_loop0
	b .factorial_label_loop0
.factorial_label_loop0:
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -36
# %op3 = icmp eq i32 %op2, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltui $t3, $t2, 1
	st.b $t3, $fp, -37
# br i1 %op3, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -37
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .factorial_label_true0
	b .factorial_label_falseBB0
.factorial_label_true0:
# ret i32 1
	addi.w $a0, $zero, 1
	b factorial_exit
.factorial_label_falseBB0:
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -41
# %op5 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -45
# %op6 = sub i32 %op5, 1
	ld.w $t0, $fp, -45
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -49
# %op7 = call i32 @factorial(i32 %op6)
	ld.w $a0, $fp, -49
	bl factorial
	st.w $a0, $fp, -53
# %op8 = mul i32 %op4, %op7
	ld.w $t0, $fp, -41
	ld.w $t1, $fp, -53
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -57
# ret i32 %op8
	ld.w $a0, $fp, -57
	b factorial_exit
.factorial_label_other0:
# ret i32 0
	addi.w $a0, $zero, 0
	b factorial_exit
factorial_exit:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = call i32 @factorial(i32 10)
	addi.w $a0, $zero, 10
	bl factorial
	st.w $a0, $fp, -32
# store i32 %op1, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -36
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -40
# ret i32 %op3
	ld.w $a0, $fp, -40
	b main_exit
main_exit:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
