	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# br label %label_loop0
	b .main_label_loop0
.main_label_loop0:
# %op0 = icmp ne i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -17
# br i1 %op0, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -17
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_falseBB0
.main_label_true0:
# br label %label_loop1
	b .main_label_loop1
.main_label_falseBB0:
# br label %label_other0
	addi.w $a0, $zero, 2
	st.w $a0, $fp, -21
	b .main_label_other0
.main_label_other0:
# %op1 = phi i32 [ %op3, %label_other1 ], [ 2, %label_falseBB0 ]
# ret i32 %op1
	ld.w $a0, $fp, -21
	b main_exit
.main_label_loop1:
# %op2 = icmp ne i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -22
# br i1 %op2, label %label_true1, label %label_falseBB1
	ld.b $t0, $fp, -22
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true1
	b .main_label_falseBB1
.main_label_true1:
# br label %label_other1
	addi.w $a0, $zero, 4
	st.w $a0, $fp, -26
	b .main_label_other1
.main_label_falseBB1:
# br label %label_other1
	addi.w $a0, $zero, 3
	st.w $a0, $fp, -26
	b .main_label_other1
.main_label_other1:
# %op3 = phi i32 [ 4, %label_true1 ], [ 3, %label_falseBB1 ]
# br label %label_other0
	ld.w $a0, $fp, -26
	st.w $a0, $fp, -21
	b .main_label_other0
main_exit:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
