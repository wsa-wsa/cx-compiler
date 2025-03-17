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
# %op2 = phi i32 [ 0, %label_entry ], [ %op12, %label_valid1 ]
# %op4 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -24
# %op5 = icmp slt i32 %op2, %op4
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -25
# br i1 %op5, label %label_true0, label %label_false0
	ld.b $t0, $fp, -25
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .readarray_label_true0
	b .readarray_label_false0
.readarray_label_true0:
# %op6 = call i32 @input()
	bl input
	st.w $a0, $fp, -29
# %op8 = icmp slt i32 %op2, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -30
# br i1 %op8, label %label_neg1, label %label_valid1
	ld.b $t0, $fp, -30
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .readarray_label_neg1
	b .readarray_label_valid1
.readarray_label_false0:
# ret void
	addi.d $a0, $zero, 0
	b readarray_exit
.readarray_label_valid1:
# %op9 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op2
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
# store i32 %op6, i32* %op9
	ld.d $t0, $fp, -38
	ld.w $t1, $fp, -29
	st.w $t1, $t0, 0
# %op12 = add i32 %op2, 1
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
# %op12 = sdiv i32 %arg0, %arg2
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -32
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# br label %label_while0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -40
	b .transpose_label_while0
.transpose_label_while0:
# %op18 = phi i32 [ 0, %label_entry ], [ %op30, %label_false1 ]
# %op21 = icmp slt i32 %op18, %op12
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -36
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -41
# br i1 %op21, label %label_true0, label %label_false0
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
# %op23 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -45
# ret i32 %op23
	ld.w $a0, $fp, -45
	b transpose_exit
.transpose_label_while1:
# %op25 = phi i32 [ 0, %label_true0 ], [ %op76, %label_other2 ]
# %op28 = icmp slt i32 %op25, %arg2
	ld.w $t0, $fp, -49
	ld.w $t1, $fp, -32
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -50
# br i1 %op28, label %label_true1, label %label_false1
	ld.b $t0, $fp, -50
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .transpose_label_true1
	b .transpose_label_false1
.transpose_label_true1:
# br label %label_loop2
	b .transpose_label_loop2
.transpose_label_false1:
# %op30 = add i32 %op18, 1
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -54
# br label %label_while0
	ld.w $a0, $fp, -54
	st.w $a0, $fp, -40
	b .transpose_label_while0
.transpose_label_loop2:
# %op34 = icmp slt i32 %op18, %op25
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -49
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -55
# br i1 %op34, label %label_true2, label %label_falseBB2
	ld.b $t0, $fp, -55
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .transpose_label_true2
	b .transpose_label_falseBB2
.transpose_label_true2:
# %op36 = add i32 %op25, 1
	ld.w $t0, $fp, -49
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -59
# br label %label_other2
	ld.w $a0, $fp, -59
	st.w $a0, $fp, -139
	b .transpose_label_other2
.transpose_label_falseBB2:
# %op40 = mul i32 %op18, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -63
# %op42 = add i32 %op40, %op25
	ld.w $t0, $fp, -63
	ld.w $t1, $fp, -49
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -67
# %op44 = getelementptr i32, i32* %arg1, i32 %op42
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -67
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -75
# %op45 = load i32, i32* %op44
	ld.d $t0, $fp, -75
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -79
# %op49 = mul i32 %op18, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -83
# %op51 = add i32 %op49, %op25
	ld.w $t0, $fp, -83
	ld.w $t1, $fp, -49
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -87
# %op53 = getelementptr i32, i32* %arg1, i32 %op51
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -87
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -95
# %op54 = load i32, i32* %op53
	ld.d $t0, $fp, -95
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -99
# %op57 = mul i32 %op25, %op12
	ld.w $t0, $fp, -49
	ld.w $t1, $fp, -36
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -103
# %op59 = add i32 %op57, %op18
	ld.w $t0, $fp, -103
	ld.w $t1, $fp, -40
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -107
# %op61 = getelementptr i32, i32* %arg1, i32 %op59
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -107
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -115
# store i32 %op54, i32* %op61
	ld.d $t0, $fp, -115
	ld.w $t1, $fp, -99
	st.w $t1, $t0, 0
# %op66 = mul i32 %op18, %arg2
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -32
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -119
# %op68 = add i32 %op66, %op25
	ld.w $t0, $fp, -119
	ld.w $t1, $fp, -49
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -123
# %op70 = getelementptr i32, i32* %arg1, i32 %op68
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -123
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -131
# store i32 %op45, i32* %op70
	ld.d $t0, $fp, -131
	ld.w $t1, $fp, -79
	st.w $t1, $t0, 0
# %op73 = add i32 %op25, 1
	ld.w $t0, $fp, -49
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -135
# br label %label_other2
	ld.w $a0, $fp, -135
	st.w $a0, $fp, -139
	b .transpose_label_other2
.transpose_label_other2:
# %op76 = phi i32 [ %op36, %label_true2 ], [ %op73, %label_falseBB2 ]
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
# %op3 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# %op5 = call i32 @input()
	bl input
	st.w $a0, $fp, -24
# store i32 %op5, i32* @len
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
# %op8 = phi i32 [ 0, %label_entry ], [ %op19, %label_valid1 ]
# %op11 = icmp slt i32 %op8, %op3
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -20
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -29
# br i1 %op11, label %label_true0, label %label_false0
	ld.b $t0, $fp, -29
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op14 = icmp slt i32 %op8, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -30
# br i1 %op14, label %label_neg1, label %label_valid1
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
# %op16 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op8
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
# store i32 %op8, i32* %op16
	ld.d $t0, $fp, -38
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op19 = add i32 %op8, 1
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
# %op21 = phi i32 [ 0, %label_false0 ], [ %op35, %label_valid3 ]
# %op23 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -50
# %op24 = icmp slt i32 %op21, %op23
	ld.w $t0, $fp, -46
	ld.w $t1, $fp, -50
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -51
# br i1 %op24, label %label_true2, label %label_false2
	ld.b $t0, $fp, -51
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true2
	b .main_label_false2
.main_label_true2:
# %op26 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
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
# %op28 = icmp slt i32 %op21, 0
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -60
# br i1 %op28, label %label_neg3, label %label_valid3
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
# %op31 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op21
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
# %op32 = load i32, i32* %op31
	ld.d $t0, $fp, -68
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -72
# %op33 = call i32 @transpose(i32 %op3, i32* %op26, i32 %op32)
	ld.w $a0, $fp, -20
	ld.d $a1, $fp, -59
	ld.w $a2, $fp, -72
	bl transpose
	st.w $a0, $fp, -76
# %op35 = add i32 %op21, 1
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
# %op37 = phi i32 [ 0, %label_false2 ], [ %op51, %label_valid5 ]
# %op38 = phi i32 [ 0, %label_false2 ], [ %op54, %label_valid5 ]
# %op40 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -92
# %op41 = icmp slt i32 %op38, %op40
	ld.w $t0, $fp, -88
	ld.w $t1, $fp, -92
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -93
# br i1 %op41, label %label_true4, label %label_false4
	ld.b $t0, $fp, -93
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true4
	b .main_label_false4
.main_label_true4:
# %op45 = mul i32 %op38, %op38
	ld.w $t0, $fp, -88
	ld.w $t1, $fp, -88
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -97
# %op47 = icmp slt i32 %op38, 0
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -98
# br i1 %op47, label %label_neg5, label %label_valid5
	ld.b $t0, $fp, -98
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg5
	b .main_label_valid5
.main_label_false4:
# br label %label_loop6
	b .main_label_loop6
.main_label_valid5:
# %op48 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op38
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
# %op49 = load i32, i32* %op48
	ld.d $t0, $fp, -106
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -110
# %op50 = mul i32 %op45, %op49
	ld.w $t0, $fp, -97
	ld.w $t1, $fp, -110
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -114
# %op51 = add i32 %op37, %op50
	ld.w $t0, $fp, -84
	ld.w $t1, $fp, -114
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -118
# %op54 = add i32 %op38, 1
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
# %op57 = icmp slt i32 %op37, 0
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -123
# br i1 %op57, label %label_true6, label %label_falseBB6
	ld.b $t0, $fp, -123
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true6
	b .main_label_falseBB6
.main_label_true6:
# %op59 = sub i32 0, %op37
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
# %op61 = phi i32 [ %op59, %label_true6 ], [ %op37, %label_falseBB6 ]
# call void @output(i32 %op61)
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
