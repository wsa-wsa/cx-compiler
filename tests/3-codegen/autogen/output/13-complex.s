# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl n
	.type n, @object
	.size n, 4
n:
	.space 4
	.globl m
	.type m, @object
	.size m, 4
m:
	.space 4
	.globl w
	.type w, @object
	.size w, 20
w:
	.space 20
	.globl v
	.type v, @object
	.size v, 20
v:
	.space 20
	.globl dp
	.type dp, @object
	.size dp, 264
dp:
	.space 264
	.text
	.globl max
	.type max, @function
max:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
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
	b .max_label_loop0
.max_label_loop0:
# %op4 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -52
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# %op6 = icmp sgt i32 %op4, %op5
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -56
	sub.w $t2, $t1, $t0
	slt $t3, $t2, $zero
	st.b $t3, $fp, -57
# br i1 %op6, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -57
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .max_label_true0
	b .max_label_falseBB0
.max_label_true0:
# %op7 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -61
# ret i32 %op7
	ld.w $a0, $fp, -61
	b max_exit
.max_label_falseBB0:
# %op8 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -65
# ret i32 %op8
	ld.w $a0, $fp, -65
	b max_exit
.max_label_other0:
# ret i32 0
	addi.w $a0, $zero, 0
	b max_exit
max_exit:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl knapsack
	.type knapsack, @function
knapsack:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -304
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
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
# %op4 = alloca i32
	addi.d $t0, $fp, -60
	st.d $t0, $fp, -56
# br label %label_loop0
	b .knapsack_label_loop0
.knapsack_label_loop0:
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -64
# %op6 = icmp sle i32 %op5, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slti $t3, $t2, 1
	st.b $t3, $fp, -65
# br i1 %op6, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -65
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .knapsack_label_true0
	b .knapsack_label_falseBB0
.knapsack_label_true0:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label_falseBB0:
# br label %label_other0
	b .knapsack_label_other0
.knapsack_label_other0:
# br label %label_loop1
	b .knapsack_label_loop1
.knapsack_label_loop1:
# %op7 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -69
# %op8 = icmp eq i32 %op7, 0
	ld.w $t0, $fp, -69
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltui $t3, $t2, 1
	st.b $t3, $fp, -70
# br i1 %op8, label %label_true1, label %label_falseBB1
	ld.b $t0, $fp, -70
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .knapsack_label_true1
	b .knapsack_label_falseBB1
.knapsack_label_true1:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label_falseBB1:
# br label %label_other1
	b .knapsack_label_other1
.knapsack_label_other1:
# br label %label_loop2
	b .knapsack_label_loop2
.knapsack_label_loop2:
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -74
# %op10 = mul i32 %op9, 11
	ld.w $t0, $fp, -74
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -78
# %op11 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -82
# %op12 = add i32 %op10, %op11
	ld.w $t0, $fp, -78
	ld.w $t1, $fp, -82
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -86
# %op13 = icmp slt i32 %op12, 0
	ld.w $t0, $fp, -86
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -87
# br i1 %op13, label %label_neg3, label %label_valid3
	ld.b $t0, $fp, -87
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .knapsack_label_neg3
	b .knapsack_label_valid3
.knapsack_label_true2:
# %op14 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -91
# %op15 = mul i32 %op14, 11
	ld.w $t0, $fp, -91
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -95
# %op16 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -99
# %op17 = add i32 %op15, %op16
	ld.w $t0, $fp, -95
	ld.w $t1, $fp, -99
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -103
# %op18 = icmp slt i32 %op17, 0
	ld.w $t0, $fp, -103
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -104
# br i1 %op18, label %label_neg4, label %label_valid4
	ld.b $t0, $fp, -104
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .knapsack_label_neg4
	b .knapsack_label_valid4
.knapsack_label_falseBB2:
# br label %label_other2
	b .knapsack_label_other2
.knapsack_label_other2:
# br label %label_loop5
	b .knapsack_label_loop5
.knapsack_label_valid3:
# %op19 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op12
	la.local $t0, dp
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 264
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -86
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -112
# %op20 = load i32, i32* %op19
	ld.d $t0, $fp, -112
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -116
# %op21 = icmp sge i32 %op20, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	sub.w $t2, $t1, $t0
	slti $t3, $t2, 1
	st.b $t3, $fp, -117
# br i1 %op21, label %label_true2, label %label_falseBB2
	ld.b $t0, $fp, -117
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .knapsack_label_true2
	b .knapsack_label_falseBB2
.knapsack_label_neg3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid3
	b .knapsack_label_valid3
.knapsack_label_valid4:
# %op22 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op17
	la.local $t0, dp
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 264
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -103
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -125
# %op23 = load i32, i32* %op22
	ld.d $t0, $fp, -125
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -129
# ret i32 %op23
	ld.w $a0, $fp, -129
	b knapsack_exit
.knapsack_label_neg4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid4
	b .knapsack_label_valid4
.knapsack_label_loop5:
# %op24 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -133
# %op25 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -137
# %op26 = sub i32 %op25, 1
	ld.w $t0, $fp, -137
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -141
# %op27 = icmp slt i32 %op26, 0
	ld.w $t0, $fp, -141
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -142
# br i1 %op27, label %label_neg6, label %label_valid6
	ld.b $t0, $fp, -142
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .knapsack_label_neg6
	b .knapsack_label_valid6
.knapsack_label_true5:
# %op28 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -146
# %op29 = sub i32 %op28, 1
	ld.w $t0, $fp, -146
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -150
# %op30 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -154
# %op31 = call i32 @knapsack(i32 %op29, i32 %op30)
	ld.w $a0, $fp, -150
	ld.w $a1, $fp, -154
	bl knapsack
	st.w $a0, $fp, -158
# store i32 %op31, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -158
	st.w $t1, $t0, 0
# %op32 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -162
# br label %label_other5
	b .knapsack_label_other5
.knapsack_label_falseBB5:
# %op33 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -166
# %op34 = sub i32 %op33, 1
	ld.w $t0, $fp, -166
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -170
# %op35 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -174
# %op36 = call i32 @knapsack(i32 %op34, i32 %op35)
	ld.w $a0, $fp, -170
	ld.w $a1, $fp, -174
	bl knapsack
	st.w $a0, $fp, -178
# %op37 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -182
# %op38 = sub i32 %op37, 1
	ld.w $t0, $fp, -182
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -186
# %op39 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -190
# %op40 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -194
# %op41 = sub i32 %op40, 1
	ld.w $t0, $fp, -194
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -198
# %op42 = icmp slt i32 %op41, 0
	ld.w $t0, $fp, -198
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -199
# br i1 %op42, label %label_neg7, label %label_valid7
	ld.b $t0, $fp, -199
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .knapsack_label_neg7
	b .knapsack_label_valid7
.knapsack_label_other5:
# %op43 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -203
# %op44 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -207
# %op45 = mul i32 %op44, 11
	ld.w $t0, $fp, -207
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -211
# %op46 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -215
# %op47 = add i32 %op45, %op46
	ld.w $t0, $fp, -211
	ld.w $t1, $fp, -215
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -219
# %op48 = icmp slt i32 %op47, 0
	ld.w $t0, $fp, -219
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -220
# br i1 %op48, label %label_neg9, label %label_valid9
	ld.b $t0, $fp, -220
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .knapsack_label_neg9
	b .knapsack_label_valid9
.knapsack_label_valid6:
# %op49 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op26
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -141
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -228
# %op50 = load i32, i32* %op49
	ld.d $t0, $fp, -228
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -232
# %op51 = icmp slt i32 %op24, %op50
	ld.w $t0, $fp, -133
	ld.w $t1, $fp, -232
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -233
# br i1 %op51, label %label_true5, label %label_falseBB5
	ld.b $t0, $fp, -233
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .knapsack_label_true5
	b .knapsack_label_falseBB5
.knapsack_label_neg6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid6
	b .knapsack_label_valid6
.knapsack_label_valid7:
# %op52 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op41
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -198
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -241
# %op53 = load i32, i32* %op52
	ld.d $t0, $fp, -241
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -245
# %op54 = sub i32 %op39, %op53
	ld.w $t0, $fp, -190
	ld.w $t1, $fp, -245
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -249
# %op55 = call i32 @knapsack(i32 %op38, i32 %op54)
	ld.w $a0, $fp, -186
	ld.w $a1, $fp, -249
	bl knapsack
	st.w $a0, $fp, -253
# %op56 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -257
# %op57 = sub i32 %op56, 1
	ld.w $t0, $fp, -257
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -261
# %op58 = icmp slt i32 %op57, 0
	ld.w $t0, $fp, -261
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -262
# br i1 %op58, label %label_neg8, label %label_valid8
	ld.b $t0, $fp, -262
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .knapsack_label_neg8
	b .knapsack_label_valid8
.knapsack_label_neg7:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid7
	b .knapsack_label_valid7
.knapsack_label_valid8:
# %op59 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op57
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -261
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -270
# %op60 = load i32, i32* %op59
	ld.d $t0, $fp, -270
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -274
# %op61 = add i32 %op55, %op60
	ld.w $t0, $fp, -253
	ld.w $t1, $fp, -274
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -278
# %op62 = call i32 @max(i32 %op36, i32 %op61)
	ld.w $a0, $fp, -178
	ld.w $a1, $fp, -278
	bl max
	st.w $a0, $fp, -282
# store i32 %op62, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -282
	st.w $t1, $t0, 0
# %op63 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -286
# br label %label_other5
	b .knapsack_label_other5
.knapsack_label_neg8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid8
	b .knapsack_label_valid8
.knapsack_label_valid9:
# %op64 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op47
	la.local $t0, dp
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 264
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -219
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -294
# store i32 %op43, i32* %op64
	ld.d $t0, $fp, -294
	ld.w $t1, $fp, -203
	st.w $t1, $t0, 0
# %op65 = load i32, i32* %op64
	ld.d $t0, $fp, -294
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -298
# %op66 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -302
# ret i32 %op66
	ld.w $a0, $fp, -302
	b knapsack_exit
.knapsack_label_neg9:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid9
	b .knapsack_label_valid9
knapsack_exit:
	addi.d $sp, $sp, 304
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -224
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op1 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -32
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op2 = load i32, i32* @n
	la.local $t0, n
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -36
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op3 = load i32, i32* @m
	la.local $t0, m
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -40
# %op4 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -41
# br i1 %op4, label %label_neg0, label %label_valid0
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg0
	b .main_label_valid0
.main_label_valid0:
# %op5 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -49
# store i32 2, i32* %op5
	ld.d $t0, $fp, -49
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op6 = load i32, i32* %op5
	ld.d $t0, $fp, -49
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -53
# %op7 = icmp slt i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -54
# br i1 %op7, label %label_neg1, label %label_valid1
	ld.b $t0, $fp, -54
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg1
	b .main_label_valid1
.main_label_neg0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid0
	b .main_label_valid0
.main_label_valid1:
# %op8 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 1
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -62
# store i32 2, i32* %op8
	ld.d $t0, $fp, -62
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op9 = load i32, i32* %op8
	ld.d $t0, $fp, -62
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -66
# %op10 = icmp slt i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -67
# br i1 %op10, label %label_neg2, label %label_valid2
	ld.b $t0, $fp, -67
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg2
	b .main_label_valid2
.main_label_neg1:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid1
	b .main_label_valid1
.main_label_valid2:
# %op11 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 2
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -75
# store i32 6, i32* %op11
	ld.d $t0, $fp, -75
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op12 = load i32, i32* %op11
	ld.d $t0, $fp, -75
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -79
# %op13 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -80
# br i1 %op13, label %label_neg3, label %label_valid3
	ld.b $t0, $fp, -80
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg3
	b .main_label_valid3
.main_label_neg2:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid2
	b .main_label_valid2
.main_label_valid3:
# %op14 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 3
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -88
# store i32 5, i32* %op14
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op15 = load i32, i32* %op14
	ld.d $t0, $fp, -88
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -92
# %op16 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -93
# br i1 %op16, label %label_neg4, label %label_valid4
	ld.b $t0, $fp, -93
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg4
	b .main_label_valid4
.main_label_neg3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid3
	b .main_label_valid3
.main_label_valid4:
# %op17 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 4
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -101
# store i32 4, i32* %op17
	ld.d $t0, $fp, -101
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op18 = load i32, i32* %op17
	ld.d $t0, $fp, -101
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -105
# %op19 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -106
# br i1 %op19, label %label_neg5, label %label_valid5
	ld.b $t0, $fp, -106
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg5
	b .main_label_valid5
.main_label_neg4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid4
	b .main_label_valid4
.main_label_valid5:
# %op20 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -114
# store i32 6, i32* %op20
	ld.d $t0, $fp, -114
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op21 = load i32, i32* %op20
	ld.d $t0, $fp, -114
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -118
# %op22 = icmp slt i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -119
# br i1 %op22, label %label_neg6, label %label_valid6
	ld.b $t0, $fp, -119
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg6
	b .main_label_valid6
.main_label_neg5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid5
	b .main_label_valid5
.main_label_valid6:
# %op23 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 1
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -127
# store i32 3, i32* %op23
	ld.d $t0, $fp, -127
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op24 = load i32, i32* %op23
	ld.d $t0, $fp, -127
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -131
# %op25 = icmp slt i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -132
# br i1 %op25, label %label_neg7, label %label_valid7
	ld.b $t0, $fp, -132
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg7
	b .main_label_valid7
.main_label_neg6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid6
	b .main_label_valid6
.main_label_valid7:
# %op26 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 2
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -140
# store i32 5, i32* %op26
	ld.d $t0, $fp, -140
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op27 = load i32, i32* %op26
	ld.d $t0, $fp, -140
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -144
# %op28 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -145
# br i1 %op28, label %label_neg8, label %label_valid8
	ld.b $t0, $fp, -145
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg8
	b .main_label_valid8
.main_label_neg7:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid7
	b .main_label_valid7
.main_label_valid8:
# %op29 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 3
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -153
# store i32 4, i32* %op29
	ld.d $t0, $fp, -153
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op30 = load i32, i32* %op29
	ld.d $t0, $fp, -153
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -157
# %op31 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -158
# br i1 %op31, label %label_neg9, label %label_valid9
	ld.b $t0, $fp, -158
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg9
	b .main_label_valid9
.main_label_neg8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid8
	b .main_label_valid8
.main_label_valid9:
# %op32 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 4
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -166
# store i32 6, i32* %op32
	ld.d $t0, $fp, -166
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op33 = load i32, i32* %op32
	ld.d $t0, $fp, -166
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -170
# br label %label_while10
	b .main_label_while10
.main_label_neg9:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid9
	b .main_label_valid9
.main_label_while10:
# %op34 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -174
# %op35 = icmp slt i32 %op34, 66
	ld.w $t0, $fp, -174
	addi.w $t1, $zero, 66
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -175
# br i1 %op35, label %label_true10, label %label_false10
	ld.b $t0, $fp, -175
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true10
	b .main_label_false10
.main_label_true10:
# %op36 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -179
# %op37 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -183
# %op38 = icmp slt i32 %op37, 0
	ld.w $t0, $fp, -183
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -184
# br i1 %op38, label %label_neg11, label %label_valid11
	ld.b $t0, $fp, -184
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg11
	b .main_label_valid11
.main_label_false10:
# %op39 = load i32, i32* @n
	la.local $t0, n
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -188
# %op40 = load i32, i32* @m
	la.local $t0, m
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -192
# %op41 = call i32 @knapsack(i32 %op39, i32 %op40)
	ld.w $a0, $fp, -188
	ld.w $a1, $fp, -192
	bl knapsack
	st.w $a0, $fp, -196
# call void @output(i32 %op41)
	ld.w $a0, $fp, -196
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label_valid11:
# %op42 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op37
	la.local $t0, dp
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 264
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -183
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -204
# store i32 %op36, i32* %op42
	ld.d $t0, $fp, -204
	ld.w $t1, $fp, -179
	st.w $t1, $t0, 0
# %op43 = load i32, i32* %op42
	ld.d $t0, $fp, -204
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -208
# %op44 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -212
# %op45 = add i32 %op44, 1
	ld.w $t0, $fp, -212
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -216
# store i32 %op45, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -216
	st.w $t1, $t0, 0
# %op46 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -220
# br label %label_while10
	b .main_label_while10
.main_label_neg11:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid11
	b .main_label_valid11
main_exit:
	addi.d $sp, $sp, 224
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
