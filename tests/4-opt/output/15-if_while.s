	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.main_label_entry:
# br label %label_while0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -20
	addi.w $a0, $zero, 10
	st.w $a0, $fp, -24
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -28
	b .main_label_while0
.main_label_while0:
# %op0 = phi i32 [ 0, %label_entry ], [ %op9, %label_other1 ]
# %op1 = phi i32 [ 10, %label_entry ], [ %op4, %label_other1 ]
# %op2 = phi i32 [ 0, %label_entry ], [ %op10, %label_other1 ]
# %op3 = icmp ne i32 %op1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -29
# br i1 %op3, label %label_true0, label %label_false0
	ld.b $t0, $fp, -29
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op4 = sub i32 %op1, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# br label %label_loop1
	b .main_label_loop1
.main_label_false0:
# %op5 = add i32 %op0, %op2
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -28
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -37
# ret i32 %op5
	ld.w $a0, $fp, -37
	b main_exit
.main_label_loop1:
# %op6 = icmp slt i32 %op4, 5
	ld.w $t0, $fp, -33
	addi.w $t1, $zero, 5
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -38
# br i1 %op6, label %label_true1, label %label_falseBB1
	ld.b $t0, $fp, -38
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true1
	b .main_label_falseBB1
.main_label_true1:
# %op7 = add i32 %op0, %op4
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -33
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# br label %label_other1
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -50
	ld.w $a0, $fp, -28
	st.w $a0, $fp, -54
	b .main_label_other1
.main_label_falseBB1:
# %op8 = add i32 %op2, %op4
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -33
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -46
# br label %label_other1
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -50
	ld.w $a0, $fp, -46
	st.w $a0, $fp, -54
	b .main_label_other1
.main_label_other1:
# %op9 = phi i32 [ %op7, %label_true1 ], [ %op0, %label_falseBB1 ]
# %op10 = phi i32 [ %op2, %label_true1 ], [ %op8, %label_falseBB1 ]
# br label %label_while0
	ld.w $a0, $fp, -50
	st.w $a0, $fp, -20
	ld.w $a0, $fp, -33
	st.w $a0, $fp, -24
	ld.w $a0, $fp, -54
	st.w $a0, $fp, -28
	b .main_label_while0
main_exit:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
