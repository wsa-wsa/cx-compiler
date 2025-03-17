	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# br label %label_while0
	addi.w $a0, $zero, 1
	st.w $a0, $fp, -20
	b .main_label_while0
.main_label_while0:
# %op0 = phi i32 [ 1, %label_entry ], [ %op2, %label_true0 ]
# %op1 = icmp slt i32 %op0, 999999999
	ld.w $t0, $fp, -20
	lu12i.w $t1, 244140
	ori $t1, $t1, 2559
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -21
# br i1 %op1, label %label_true0, label %label_false0
	ld.b $t0, $fp, -21
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op2 = add i32 %op0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -25
# br label %label_while0
	ld.w $a0, $fp, -25
	st.w $a0, $fp, -20
	b .main_label_while0
.main_label_false0:
# ret i32 %op0
	ld.w $a0, $fp, -20
	b main_exit
main_exit:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
