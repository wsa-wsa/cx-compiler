	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# br label %label_while0
	addi.w $a0, $zero, 10
	st.w $a0, $fp, -24
	b .main_label_while0
.main_label_while0:
# %op0 = phi i32 [ %op5, %label_false1 ], [ undef, %label_entry ]
# %op1 = phi i32 [ 10, %label_entry ], [ %op3, %label_false1 ]
# %op2 = icmp ne i32 %op1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -25
# br i1 %op2, label %label_true0, label %label_false0
	ld.b $t0, $fp, -25
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op3 = sub i32 %op1, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -29
# br label %label_while1
	ld.w $a0, $fp, -29
	st.w $a0, $fp, -37
	b .main_label_while1
.main_label_false0:
# %op4 = add i32 %op1, %op0
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -20
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# ret i32 %op4
	ld.w $a0, $fp, -33
	b main_exit
.main_label_while1:
# %op5 = phi i32 [ %op3, %label_true0 ], [ %op7, %label_true1 ]
# %op6 = icmp ne i32 %op5, 0
	ld.w $t0, $fp, -37
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -38
# br i1 %op6, label %label_true1, label %label_false1
	ld.b $t0, $fp, -38
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true1
	b .main_label_false1
.main_label_true1:
# %op7 = sub i32 %op5, 1
	ld.w $t0, $fp, -37
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# br label %label_while1
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -37
	b .main_label_while1
.main_label_false1:
# br label %label_while0
	ld.w $a0, $fp, -37
	st.w $a0, $fp, -20
	ld.w $a0, $fp, -29
	st.w $a0, $fp, -24
	b .main_label_while0
main_exit:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
