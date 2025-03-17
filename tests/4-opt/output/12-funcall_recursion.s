	.text
	.globl factorial
	.type factorial, @function
factorial:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
.factorial_label_entry:
# br label %label_loop0
	b .factorial_label_loop0
.factorial_label_loop0:
# %op1 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltui $t3, $t2, 1
	st.b $t3, $fp, -21
# br i1 %op1, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -21
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .factorial_label_true0
	b .factorial_label_falseBB0
.factorial_label_true0:
# ret i32 1
	addi.w $a0, $zero, 1
	b factorial_exit
.factorial_label_falseBB0:
# %op2 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -25
# %op3 = call i32 @factorial(i32 %op2)
	ld.w $a0, $fp, -25
	bl factorial
	st.w $a0, $fp, -29
# %op4 = mul i32 %arg0, %op3
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -29
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# ret i32 %op4
	ld.w $a0, $fp, -33
	b factorial_exit
factorial_exit:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = call i32 @factorial(i32 10)
	addi.w $a0, $zero, 10
	bl factorial
	st.w $a0, $fp, -20
# ret i32 %op0
	ld.w $a0, $fp, -20
	b main_exit
main_exit:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
