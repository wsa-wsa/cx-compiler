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
	addi.d $sp, $sp, -80
.readarray_label_entry:
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
# br label %label_while0
	b .readarray_label_while0
.readarray_label_while0:
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -36
# %op3 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -40
# %op4 = icmp slt i32 %op2, %op3
	ld.w $t0, $fp, -36
	ld.w $t1, $fp, -40
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -41
# br i1 %op4, label %label_true0, label %label_false0
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .readarray_label_true0
	b .readarray_label_false0
.readarray_label_true0:
# %op5 = call i32 @input()
	bl input
	st.w $a0, $fp, -45
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -49
# %op7 = icmp slt i32 %op6, 0
	ld.w $t0, $fp, -49
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -50
# br i1 %op7, label %label_neg1, label %label_valid1
	ld.b $t0, $fp, -50
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .readarray_label_neg1
	b .readarray_label_valid1
.readarray_label_false0:
# ret void
	addi.d $a0, $zero, 0
	b readarray_exit
.readarray_label_valid1:
# %op8 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op6
	la.local $t0, ad
	addi.w $t1, $zero, 0
	lu12i.w $t2, 97
	ori $t2, $t2, 2688
	lu32i.d $t2, 0
	lu52i.d $t2, $t2, 0
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -49
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -58
# store i32 %op5, i32* %op8
	ld.d $t0, $fp, -58
	ld.w $t1, $fp, -45
	st.w $t1, $t0, 0
# %op9 = load i32, i32* %op8
	ld.d $t0, $fp, -58
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -62
# %op10 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -66
# %op11 = add i32 %op10, 1
	ld.w $t0, $fp, -66
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -70
# store i32 %op11, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -70
	st.w $t1, $t0, 0
# %op12 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -74
# br label %label_while0
	b .readarray_label_while0
.readarray_label_neg1:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid1
	b .readarray_label_valid1
readarray_exit:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl transpose
	.type transpose, @function
transpose:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -384
	st.w $a0, $fp, -20
	st.d $a1, $fp, -28
	st.w $a2, $fp, -32
.transpose_label_entry:
# %op3 = alloca i32
	addi.d $t0, $fp, -44
	st.d $t0, $fp, -40
# store i32 %arg0, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op4 = alloca i32*
	addi.d $t0, $fp, -60
	st.d $t0, $fp, -52
# store i32* %arg1, i32** %op4
	ld.d $t0, $fp, -52
	ld.d $t1, $fp, -28
	st.d $t1, $t0, 0
# %op5 = alloca i32
	addi.d $t0, $fp, -72
	st.d $t0, $fp, -68
# store i32 %arg2, i32* %op5
	ld.d $t0, $fp, -68
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op6 = alloca i32
	addi.d $t0, $fp, -84
	st.d $t0, $fp, -80
# %op7 = alloca i32
	addi.d $t0, $fp, -96
	st.d $t0, $fp, -92
# %op8 = alloca i32
	addi.d $t0, $fp, -108
	st.d $t0, $fp, -104
# %op9 = alloca i32
	addi.d $t0, $fp, -120
	st.d $t0, $fp, -116
# %op10 = load i32, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -124
# %op11 = load i32, i32* %op5
	ld.d $t0, $fp, -68
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -128
# %op12 = sdiv i32 %op10, %op11
	ld.w $t0, $fp, -124
	ld.w $t1, $fp, -128
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# store i32 %op12, i32* %op6
	ld.d $t0, $fp, -80
	ld.w $t1, $fp, -132
	st.w $t1, $t0, 0
# %op13 = load i32, i32* %op6
	ld.d $t0, $fp, -80
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -136
# store i32 0, i32* %op7
	ld.d $t0, $fp, -92
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op14 = load i32, i32* %op7
	ld.d $t0, $fp, -92
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -140
# store i32 0, i32* %op8
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op15 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -144
# br label %label_while0
	b .transpose_label_while0
.transpose_label_while0:
# %op16 = load i32, i32* %op7
	ld.d $t0, $fp, -92
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -148
# %op17 = load i32, i32* %op6
	ld.d $t0, $fp, -80
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -152
# %op18 = icmp slt i32 %op16, %op17
	ld.w $t0, $fp, -148
	ld.w $t1, $fp, -152
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -153
# br i1 %op18, label %label_true0, label %label_false0
	ld.b $t0, $fp, -153
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .transpose_label_true0
	b .transpose_label_false0
.transpose_label_true0:
# store i32 0, i32* %op8
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op19 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -157
# br label %label_while1
	b .transpose_label_while1
.transpose_label_false0:
# %op20 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -161
# ret i32 %op20
	ld.w $a0, $fp, -161
	b transpose_exit
.transpose_label_while1:
# %op21 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -165
# %op22 = load i32, i32* %op5
	ld.d $t0, $fp, -68
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -169
# %op23 = icmp slt i32 %op21, %op22
	ld.w $t0, $fp, -165
	ld.w $t1, $fp, -169
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -170
# br i1 %op23, label %label_true1, label %label_false1
	ld.b $t0, $fp, -170
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .transpose_label_true1
	b .transpose_label_false1
.transpose_label_true1:
# br label %label_loop2
	b .transpose_label_loop2
.transpose_label_false1:
# %op24 = load i32, i32* %op7
	ld.d $t0, $fp, -92
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -174
# %op25 = add i32 %op24, 1
	ld.w $t0, $fp, -174
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -178
# store i32 %op25, i32* %op7
	ld.d $t0, $fp, -92
	ld.w $t1, $fp, -178
	st.w $t1, $t0, 0
# %op26 = load i32, i32* %op7
	ld.d $t0, $fp, -92
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -182
# br label %label_while0
	b .transpose_label_while0
.transpose_label_loop2:
# %op27 = load i32, i32* %op7
	ld.d $t0, $fp, -92
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -186
# %op28 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -190
# %op29 = icmp slt i32 %op27, %op28
	ld.w $t0, $fp, -186
	ld.w $t1, $fp, -190
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -191
# br i1 %op29, label %label_true2, label %label_falseBB2
	ld.b $t0, $fp, -191
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .transpose_label_true2
	b .transpose_label_falseBB2
.transpose_label_true2:
# %op30 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -195
# %op31 = add i32 %op30, 1
	ld.w $t0, $fp, -195
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -199
# store i32 %op31, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -199
	st.w $t1, $t0, 0
# %op32 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -203
# br label %label_other2
	b .transpose_label_other2
.transpose_label_falseBB2:
# %op33 = load i32, i32* %op7
	ld.d $t0, $fp, -92
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -207
# %op34 = load i32, i32* %op5
	ld.d $t0, $fp, -68
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -211
# %op35 = mul i32 %op33, %op34
	ld.w $t0, $fp, -207
	ld.w $t1, $fp, -211
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -215
# %op36 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -219
# %op37 = add i32 %op35, %op36
	ld.w $t0, $fp, -215
	ld.w $t1, $fp, -219
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -223
# %op38 = load i32*, i32** %op4
	ld.d $t0, $fp, -52
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -231
# %op39 = getelementptr i32, i32* %op38, i32 %op37
	ld.d $t0, $fp, -231
	ld.w $t1, $fp, -223
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -239
# %op40 = load i32, i32* %op39
	ld.d $t0, $fp, -239
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -243
# store i32 %op40, i32* %op9
	ld.d $t0, $fp, -116
	ld.w $t1, $fp, -243
	st.w $t1, $t0, 0
# %op41 = load i32, i32* %op9
	ld.d $t0, $fp, -116
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -247
# %op42 = load i32, i32* %op7
	ld.d $t0, $fp, -92
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -251
# %op43 = load i32, i32* %op5
	ld.d $t0, $fp, -68
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -255
# %op44 = mul i32 %op42, %op43
	ld.w $t0, $fp, -251
	ld.w $t1, $fp, -255
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -259
# %op45 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -263
# %op46 = add i32 %op44, %op45
	ld.w $t0, $fp, -259
	ld.w $t1, $fp, -263
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -267
# %op47 = load i32*, i32** %op4
	ld.d $t0, $fp, -52
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -275
# %op48 = getelementptr i32, i32* %op47, i32 %op46
	ld.d $t0, $fp, -275
	ld.w $t1, $fp, -267
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -283
# %op49 = load i32, i32* %op48
	ld.d $t0, $fp, -283
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -287
# %op50 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -291
# %op51 = load i32, i32* %op6
	ld.d $t0, $fp, -80
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -295
# %op52 = mul i32 %op50, %op51
	ld.w $t0, $fp, -291
	ld.w $t1, $fp, -295
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -299
# %op53 = load i32, i32* %op7
	ld.d $t0, $fp, -92
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -303
# %op54 = add i32 %op52, %op53
	ld.w $t0, $fp, -299
	ld.w $t1, $fp, -303
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -307
# %op55 = load i32*, i32** %op4
	ld.d $t0, $fp, -52
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -315
# %op56 = getelementptr i32, i32* %op55, i32 %op54
	ld.d $t0, $fp, -315
	ld.w $t1, $fp, -307
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -323
# store i32 %op49, i32* %op56
	ld.d $t0, $fp, -323
	ld.w $t1, $fp, -287
	st.w $t1, $t0, 0
# %op57 = load i32, i32* %op56
	ld.d $t0, $fp, -323
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -327
# %op58 = load i32, i32* %op9
	ld.d $t0, $fp, -116
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -331
# %op59 = load i32, i32* %op7
	ld.d $t0, $fp, -92
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -335
# %op60 = load i32, i32* %op5
	ld.d $t0, $fp, -68
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -339
# %op61 = mul i32 %op59, %op60
	ld.w $t0, $fp, -335
	ld.w $t1, $fp, -339
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -343
# %op62 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -347
# %op63 = add i32 %op61, %op62
	ld.w $t0, $fp, -343
	ld.w $t1, $fp, -347
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -351
# %op64 = load i32*, i32** %op4
	ld.d $t0, $fp, -52
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -359
# %op65 = getelementptr i32, i32* %op64, i32 %op63
	ld.d $t0, $fp, -359
	ld.w $t1, $fp, -351
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -367
# store i32 %op58, i32* %op65
	ld.d $t0, $fp, -367
	ld.w $t1, $fp, -331
	st.w $t1, $t0, 0
# %op66 = load i32, i32* %op65
	ld.d $t0, $fp, -367
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -371
# %op67 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -375
# %op68 = add i32 %op67, 1
	ld.w $t0, $fp, -375
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -379
# store i32 %op68, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -379
	st.w $t1, $t0, 0
# %op69 = load i32, i32* %op8
	ld.d $t0, $fp, -104
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -383
# br label %label_other2
	b .transpose_label_other2
.transpose_label_other2:
# br label %label_while1
	b .transpose_label_while1
transpose_exit:
	addi.d $sp, $sp, 384
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -272
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
# %op3 = call i32 @input()
	bl input
	st.w $a0, $fp, -56
# store i32 %op3, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -56
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -60
# %op5 = call i32 @input()
	bl input
	st.w $a0, $fp, -64
# store i32 %op5, i32* @len
	la.local $t0, len
	ld.w $t1, $fp, -64
	st.w $t1, $t0, 0
# %op6 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -68
# call void @readarray()
	bl readarray
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op7 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -72
# br label %label_while0
	b .main_label_while0
.main_label_while0:
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -76
# %op9 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -80
# %op10 = icmp slt i32 %op8, %op9
	ld.w $t0, $fp, -76
	ld.w $t1, $fp, -80
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -81
# br i1 %op10, label %label_true0, label %label_false0
	ld.b $t0, $fp, -81
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op11 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -85
# %op12 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -89
# %op13 = icmp slt i32 %op12, 0
	ld.w $t0, $fp, -89
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -90
# br i1 %op13, label %label_neg1, label %label_valid1
	ld.b $t0, $fp, -90
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg1
	b .main_label_valid1
.main_label_false0:
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -94
# br label %label_while2
	b .main_label_while2
.main_label_valid1:
# %op15 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op12
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	lu12i.w $t2, 19531
	ori $t2, $t2, 1024
	lu32i.d $t2, 0
	lu52i.d $t2, $t2, 0
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -89
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -102
# store i32 %op11, i32* %op15
	ld.d $t0, $fp, -102
	ld.w $t1, $fp, -85
	st.w $t1, $t0, 0
# %op16 = load i32, i32* %op15
	ld.d $t0, $fp, -102
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -106
# %op17 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -110
# %op18 = add i32 %op17, 1
	ld.w $t0, $fp, -110
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -114
# store i32 %op18, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -114
	st.w $t1, $t0, 0
# %op19 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -118
# br label %label_while0
	b .main_label_while0
.main_label_neg1:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid1
	b .main_label_valid1
.main_label_while2:
# %op20 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -122
# %op21 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -126
# %op22 = icmp slt i32 %op20, %op21
	ld.w $t0, $fp, -122
	ld.w $t1, $fp, -126
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -127
# br i1 %op22, label %label_true2, label %label_false2
	ld.b $t0, $fp, -127
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true2
	b .main_label_false2
.main_label_true2:
# %op23 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -131
# %op24 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
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
	st.d $t0, $fp, -139
# %op25 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -143
# %op26 = icmp slt i32 %op25, 0
	ld.w $t0, $fp, -143
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -144
# br i1 %op26, label %label_neg3, label %label_valid3
	ld.b $t0, $fp, -144
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg3
	b .main_label_valid3
.main_label_false2:
# store i32 0, i32* %op2
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op27 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -148
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op28 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -152
# br label %label_while4
	b .main_label_while4
.main_label_valid3:
# %op29 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op25
	la.local $t0, ad
	addi.w $t1, $zero, 0
	lu12i.w $t2, 97
	ori $t2, $t2, 2688
	lu32i.d $t2, 0
	lu52i.d $t2, $t2, 0
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -143
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -160
# %op30 = load i32, i32* %op29
	ld.d $t0, $fp, -160
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -164
# %op31 = call i32 @transpose(i32 %op23, i32* %op24, i32 %op30)
	ld.w $a0, $fp, -131
	ld.d $a1, $fp, -139
	ld.w $a2, $fp, -164
	bl transpose
	st.w $a0, $fp, -168
# %op32 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -172
# %op33 = add i32 %op32, 1
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# store i32 %op33, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -176
	st.w $t1, $t0, 0
# %op34 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -180
# br label %label_while2
	b .main_label_while2
.main_label_neg3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid3
	b .main_label_valid3
.main_label_while4:
# %op35 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -184
# %op36 = load i32, i32* @len
	la.local $t0, len
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -188
# %op37 = icmp slt i32 %op35, %op36
	ld.w $t0, $fp, -184
	ld.w $t1, $fp, -188
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -189
# br i1 %op37, label %label_true4, label %label_false4
	ld.b $t0, $fp, -189
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true4
	b .main_label_false4
.main_label_true4:
# %op38 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -193
# %op39 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -197
# %op40 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -201
# %op41 = mul i32 %op39, %op40
	ld.w $t0, $fp, -197
	ld.w $t1, $fp, -201
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -205
# %op42 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -209
# %op43 = icmp slt i32 %op42, 0
	ld.w $t0, $fp, -209
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -210
# br i1 %op43, label %label_neg5, label %label_valid5
	ld.b $t0, $fp, -210
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg5
	b .main_label_valid5
.main_label_false4:
# br label %label_loop6
	b .main_label_loop6
.main_label_valid5:
# %op44 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op42
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	lu12i.w $t2, 19531
	ori $t2, $t2, 1024
	lu32i.d $t2, 0
	lu52i.d $t2, $t2, 0
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -209
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -218
# %op45 = load i32, i32* %op44
	ld.d $t0, $fp, -218
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -222
# %op46 = mul i32 %op41, %op45
	ld.w $t0, $fp, -205
	ld.w $t1, $fp, -222
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -226
# %op47 = add i32 %op38, %op46
	ld.w $t0, $fp, -193
	ld.w $t1, $fp, -226
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -230
# store i32 %op47, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -230
	st.w $t1, $t0, 0
# %op48 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -234
# %op49 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -238
# %op50 = add i32 %op49, 1
	ld.w $t0, $fp, -238
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -242
# store i32 %op50, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -242
	st.w $t1, $t0, 0
# %op51 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -246
# br label %label_while4
	b .main_label_while4
.main_label_neg5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid5
	b .main_label_valid5
.main_label_loop6:
# %op52 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -250
# %op53 = icmp slt i32 %op52, 0
	ld.w $t0, $fp, -250
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -251
# br i1 %op53, label %label_true6, label %label_falseBB6
	ld.b $t0, $fp, -251
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true6
	b .main_label_falseBB6
.main_label_true6:
# %op54 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -255
# %op55 = sub i32 0, %op54
	addi.w $t0, $zero, 0
	ld.w $t1, $fp, -255
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -259
# store i32 %op55, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -259
	st.w $t1, $t0, 0
# %op56 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -263
# br label %label_other6
	b .main_label_other6
.main_label_falseBB6:
# br label %label_other6
	b .main_label_other6
.main_label_other6:
# %op57 = load i32, i32* %op2
	ld.d $t0, $fp, -48
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -267
# call void @output(i32 %op57)
	ld.w $a0, $fp, -267
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 272
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
