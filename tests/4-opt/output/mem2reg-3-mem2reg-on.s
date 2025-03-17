# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl matrix
	.type matrix, @object
	.size matrix, 80000000
matrix:
	.space 80000000
	.globl ad
	.type ad, @object
	.size ad, 400000
ad:
	.space 400000
	.globl len
	.type len, @object
	.size len, 4
len:
	.space 4
	.text
	.globl readarray
	.type readarray, @function
readarray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.readarray_label_entry:
# br label %label_while0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -20
	b .readarray_label_while0
.readarray_label_while0:
# %op0 = phi i32 [ 0, %label_entry ], [ %op6, %label_valid1 ]
# %op1 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -24
# %op2 = icmp slt i32 %op0, %op1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -25
# br i1 %op2, label %label_true0, label %label_false0
	ld.b $t0, $fp, -25
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .readarray_label_true0
	b .readarray_label_false0
.readarray_label_true0:
# %op3 = call i32 @input()
	bl input
	st.w $a0, $fp, -29
# %op4 = icmp slt i32 %op0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -30
# br i1 %op4, label %label_neg1, label %label_valid1
	ld.b $t0, $fp, -30
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .readarray_label_neg1
	b .readarray_label_valid1
.readarray_label_false0:
# ret void
	addi.d $a0, $zero, 0
	b readarray_exit
.readarray_label_valid1:
# %op5 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op0
	la.local $t0, ad
	addi.w $t1, $zero, 0
	lu12i.w $t2, 97
	ori $t2, $t2, 2688
	lu32i.d $t2, 0
	lu52i.d $t2, $t2, 0
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -20
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -38
# store i32 %op3, i32* %op5
	ld.d $t0, $fp, -38
	ld.w $t1, $fp, -29
	st.w $t1, $t0, 0
# %op6 = add i32 %op0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# br label %label_while0
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -20
	b .readarray_label_while0
.readarray_label_neg1:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid1
	b .readarray_label_valid1
readarray_exit:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl transpose
	.type transpose, @function
transpose:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
	st.w $a0, $fp, -20
	st.d $a1, $fp, -28
	st.w $a2, $fp, -32
.transpose_label_entry:
# %op3 = sdiv i32 %arg0, %arg2
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -32
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# br label %label_while0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -40
	b .transpose_label_while0
.transpose_label_while0:
# %op4 = phi i32 [ 0, %label_entry ], [ %op9, %label_false1 ]
# %op5 = icmp slt i32 %op4, %op3
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -36
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -41
# br i1 %op5, label %label_true0, label %label_false0
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .transpose_label_true0
	b .transpose_label_false0
.transpose_label_true0:
# br label %label_while1
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -49
	b .transpose_label_while1
.transpose_label_false0:
# %op6 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -45
# ret i32 %op6
	ld.w $a0, $fp, -45
	b transpose_exit
.transpose_label_while1:
# %op7 = phi i32 [ 0, %label_true0 ], [ %op27, %label_other2 ]
# %op8 = icmp slt i32 %op7, %arg2
	ld.w $t0, $fp, -49
	ld.w $t1, $fp, -32
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -50
# br i1 %op8, label %label_true1, label %label_false1
	ld.b $t0, $fp, -50
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .transpose_label_true1
	b .transpose_label_false1
.transpose_label_true1:
# br label %label_loop2
	b .transpose_label_loop2
.transpose_label_false1:
# %op9 = add i32 %op4, 1
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -54
# br label %label_while0
	ld.w $a0, $fp, -54
	st.w $a0, $fp, -40
	b .transpose_label_while0
.transpose_label_loop2:
# %op10 = icmp slt i32 %op4, %op7
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -49
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -55
# br i1 %op10, label %label_true2, label %label_falseBB2
	ld.b $t0, $fp, -55
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .transpose_label_true2
	b .transpose_label_falseBB2
.transpose_label_true2:
# %op11 = add i32 %op7, 1
	ld.w $t0, $fp, -49
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -59
# br label %label_other2
	ld.w $a0, $fp, -59
	st.w $a0, $fp, -139
	b .transpose_label_other2
.transpose_label_falseBB2:
# %op12 = mul i32 %op4, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -63
# %op13 = add i32 %op12, %op7
	ld.w $t0, $fp, -63
	ld.w $t1, $fp, -49
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -67
# %op14 = getelementptr i32, i32* %arg1, i32 %op13
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -67
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -75
# %op15 = load i32, i32* %op14
	ld.d $t0, $fp, -75
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -79
# %op16 = mul i32 %op4, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -83
# %op17 = add i32 %op16, %op7
	ld.w $t0, $fp, -83
	ld.w $t1, $fp, -49
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -87
# %op18 = getelementptr i32, i32* %arg1, i32 %op17
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -87
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -95
# %op19 = load i32, i32* %op18
	ld.d $t0, $fp, -95
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -99
# %op20 = mul i32 %op7, %op3
	ld.w $t0, $fp, -49
	ld.w $t1, $fp, -36
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -103
# %op21 = add i32 %op20, %op4
	ld.w $t0, $fp, -103
	ld.w $t1, $fp, -40
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -107
# %op22 = getelementptr i32, i32* %arg1, i32 %op21
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -107
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -115
# store i32 %op19, i32* %op22
	ld.d $t0, $fp, -115
	ld.w $t1, $fp, -99
	st.w $t1, $t0, 0
# %op23 = mul i32 %op4, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -119
# %op24 = add i32 %op23, %op7
	ld.w $t0, $fp, -119
	ld.w $t1, $fp, -49
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -123
# %op25 = getelementptr i32, i32* %arg1, i32 %op24
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -123
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -131
# store i32 %op15, i32* %op25
	ld.d $t0, $fp, -131
	ld.w $t1, $fp, -79
	st.w $t1, $t0, 0
# %op26 = add i32 %op7, 1
	ld.w $t0, $fp, -49
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -135
# br label %label_other2
	ld.w $a0, $fp, -135
	st.w $a0, $fp, -139
	b .transpose_label_other2
.transpose_label_other2:
# %op27 = phi i32 [ %op11, %label_true2 ], [ %op26, %label_falseBB2 ]
# br label %label_while1
	ld.w $a0, $fp, -139
	st.w $a0, $fp, -49
	b .transpose_label_while1
transpose_exit:
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# %op1 = call i32 @input()
	bl input
	st.w $a0, $fp, -24
# store i32 %op1, i32* @len
	la.local $t0, len
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# call void @readarray()
	bl readarray
# br label %label_while0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -28
	b .main_label_while0
.main_label_while0:
# %op2 = phi i32 [ 0, %label_entry ], [ %op6, %label_valid1 ]
# %op3 = icmp slt i32 %op2, %op0
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -20
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -29
# br i1 %op3, label %label_true0, label %label_false0
	ld.b $t0, $fp, -29
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op4 = icmp slt i32 %op2, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -30
# br i1 %op4, label %label_neg1, label %label_valid1
	ld.b $t0, $fp, -30
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg1
	b .main_label_valid1
.main_label_false0:
# br label %label_while2
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -46
	b .main_label_while2
.main_label_valid1:
# %op5 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op2
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	lu12i.w $t2, 19531
	ori $t2, $t2, 1024
	lu32i.d $t2, 0
	lu52i.d $t2, $t2, 0
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -28
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -38
# store i32 %op2, i32* %op5
	ld.d $t0, $fp, -38
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op6 = add i32 %op2, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# br label %label_while0
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -28
	b .main_label_while0
.main_label_neg1:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid1
	b .main_label_valid1
.main_label_while2:
# %op7 = phi i32 [ 0, %label_false0 ], [ %op15, %label_valid3 ]
# %op8 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -50
# %op9 = icmp slt i32 %op7, %op8
	ld.w $t0, $fp, -46
	ld.w $t1, $fp, -50
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -51
# br i1 %op9, label %label_true2, label %label_false2
	ld.b $t0, $fp, -51
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true2
	b .main_label_false2
.main_label_true2:
# %op10 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	lu12i.w $t2, 19531
	ori $t2, $t2, 1024
	lu32i.d $t2, 0
	lu52i.d $t2, $t2, 0
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -59
# %op11 = icmp slt i32 %op7, 0
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -60
# br i1 %op11, label %label_neg3, label %label_valid3
	ld.b $t0, $fp, -60
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg3
	b .main_label_valid3
.main_label_false2:
# br label %label_while4
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -84
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -88
	b .main_label_while4
.main_label_valid3:
# %op12 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op7
	la.local $t0, ad
	addi.w $t1, $zero, 0
	lu12i.w $t2, 97
	ori $t2, $t2, 2688
	lu32i.d $t2, 0
	lu52i.d $t2, $t2, 0
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -46
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -68
# %op13 = load i32, i32* %op12
	ld.d $t0, $fp, -68
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -72
# %op14 = call i32 @transpose(i32 %op0, i32* %op10, i32 %op13)
	ld.w $a0, $fp, -20
	ld.d $a1, $fp, -59
	ld.w $a2, $fp, -72
	bl transpose
	st.w $a0, $fp, -76
# %op15 = add i32 %op7, 1
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# br label %label_while2
	ld.w $a0, $fp, -80
	st.w $a0, $fp, -46
	b .main_label_while2
.main_label_neg3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid3
	b .main_label_valid3
.main_label_while4:
# %op16 = phi i32 [ 0, %label_false2 ], [ %op25, %label_valid5 ]
# %op17 = phi i32 [ 0, %label_false2 ], [ %op26, %label_valid5 ]
# %op18 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -92
# %op19 = icmp slt i32 %op17, %op18
	ld.w $t0, $fp, -88
	ld.w $t1, $fp, -92
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -93
# br i1 %op19, label %label_true4, label %label_false4
	ld.b $t0, $fp, -93
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true4
	b .main_label_false4
.main_label_true4:
# %op20 = mul i32 %op17, %op17
	ld.w $t0, $fp, -88
	ld.w $t1, $fp, -88
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -97
# %op21 = icmp slt i32 %op17, 0
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -98
# br i1 %op21, label %label_neg5, label %label_valid5
	ld.b $t0, $fp, -98
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg5
	b .main_label_valid5
.main_label_false4:
# br label %label_loop6
	b .main_label_loop6
.main_label_valid5:
# %op22 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op17
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	lu12i.w $t2, 19531
	ori $t2, $t2, 1024
	lu32i.d $t2, 0
	lu52i.d $t2, $t2, 0
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -88
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -106
# %op23 = load i32, i32* %op22
	ld.d $t0, $fp, -106
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -110
# %op24 = mul i32 %op20, %op23
	ld.w $t0, $fp, -97
	ld.w $t1, $fp, -110
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -114
# %op25 = add i32 %op16, %op24
	ld.w $t0, $fp, -84
	ld.w $t1, $fp, -114
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -118
# %op26 = add i32 %op17, 1
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -122
# br label %label_while4
	ld.w $a0, $fp, -118
	st.w $a0, $fp, -84
	ld.w $a0, $fp, -122
	st.w $a0, $fp, -88
	b .main_label_while4
.main_label_neg5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid5
	b .main_label_valid5
.main_label_loop6:
# %op27 = icmp slt i32 %op16, 0
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -123
# br i1 %op27, label %label_true6, label %label_falseBB6
	ld.b $t0, $fp, -123
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true6
	b .main_label_falseBB6
.main_label_true6:
# %op28 = sub i32 0, %op16
	addi.w $t0, $zero, 0
	ld.w $t1, $fp, -84
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -127
# br label %label_other6
	ld.w $a0, $fp, -127
	st.w $a0, $fp, -131
	b .main_label_other6
.main_label_falseBB6:
# br label %label_other6
	ld.w $a0, $fp, -84
	st.w $a0, $fp, -131
	b .main_label_other6
.main_label_other6:
# %op29 = phi i32 [ %op28, %label_true6 ], [ %op16, %label_falseBB6 ]
# call void @output(i32 %op29)
	ld.w $a0, $fp, -131
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
