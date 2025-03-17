# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl x
	.type x, @object
	.size x, 4
x:
	.space 4
	.globl y
	.type y, @object
	.size y, 4
y:
	.space 4
	.text
	.globl gcd
	.type gcd, @function
gcd:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.gcd_label_entry:
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
	b .gcd_label_loop0
.gcd_label_loop0:
# %op4 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -52
# %op5 = icmp eq i32 %op4, 0
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltui $t3, $t2, 1
	st.b $t3, $fp, -53
# br i1 %op5, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -53
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .gcd_label_true0
	b .gcd_label_falseBB0
.gcd_label_true0:
# %op6 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -57
# ret i32 %op6
	ld.w $a0, $fp, -57
	b gcd_exit
.gcd_label_falseBB0:
# %op7 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -61
# %op8 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -65
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -69
# %op10 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -73
# %op11 = sdiv i32 %op9, %op10
	ld.w $t0, $fp, -69
	ld.w $t1, $fp, -73
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# %op12 = load i32, i32* %op3
	ld.d $t0, $fp, -44
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -81
# %op13 = mul i32 %op11, %op12
	ld.w $t0, $fp, -77
	ld.w $t1, $fp, -81
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -85
# %op14 = sub i32 %op8, %op13
	ld.w $t0, $fp, -65
	ld.w $t1, $fp, -85
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -89
# %op15 = call i32 @gcd(i32 %op7, i32 %op14)
	ld.w $a0, $fp, -61
	ld.w $a1, $fp, -89
	bl gcd
	st.w $a0, $fp, -93
# ret i32 %op15
	ld.w $a0, $fp, -93
	b gcd_exit
.gcd_label_other0:
# ret i32 0
	addi.w $a0, $zero, 0
	b gcd_exit
gcd_exit:
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl funArray
	.type funArray, @function
funArray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -208
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.funArray_label_entry:
# %op2 = alloca i32*
	addi.d $t0, $fp, -48
	st.d $t0, $fp, -40
# store i32* %arg0, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op3 = alloca i32*
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -56
# store i32* %arg1, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $fp, -32
	st.d $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# %op5 = alloca i32
	addi.d $t0, $fp, -88
	st.d $t0, $fp, -84
# %op6 = alloca i32
	addi.d $t0, $fp, -100
	st.d $t0, $fp, -96
# %op7 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -108
# %op8 = getelementptr i32, i32* %op7, i32 0
	ld.d $t0, $fp, -108
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -116
# %op9 = load i32, i32* %op8
	ld.d $t0, $fp, -116
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -120
# store i32 %op9, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -120
	st.w $t1, $t0, 0
# %op10 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -124
# %op11 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -132
# %op12 = getelementptr i32, i32* %op11, i32 0
	ld.d $t0, $fp, -132
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -140
# %op13 = load i32, i32* %op12
	ld.d $t0, $fp, -140
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -144
# store i32 %op13, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t1, $fp, -144
	st.w $t1, $t0, 0
# %op14 = load i32, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -148
# br label %label_loop0
	b .funArray_label_loop0
.funArray_label_loop0:
# %op15 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -152
# %op16 = load i32, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -156
# %op17 = icmp slt i32 %op15, %op16
	ld.w $t0, $fp, -152
	ld.w $t1, $fp, -156
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -157
# br i1 %op17, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -157
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .funArray_label_true0
	b .funArray_label_falseBB0
.funArray_label_true0:
# %op18 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -161
# store i32 %op18, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t1, $fp, -161
	st.w $t1, $t0, 0
# %op19 = load i32, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -165
# %op20 = load i32, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -169
# store i32 %op20, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -169
	st.w $t1, $t0, 0
# %op21 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -173
# %op22 = load i32, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -177
# store i32 %op22, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t1, $fp, -177
	st.w $t1, $t0, 0
# %op23 = load i32, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -181
# br label %label_other0
	b .funArray_label_other0
.funArray_label_falseBB0:
# br label %label_other0
	b .funArray_label_other0
.funArray_label_other0:
# %op24 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -185
# %op25 = load i32, i32* %op5
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -189
# %op26 = call i32 @gcd(i32 %op24, i32 %op25)
	ld.w $a0, $fp, -185
	ld.w $a1, $fp, -189
	bl gcd
	st.w $a0, $fp, -193
# ret i32 %op26
	ld.w $a0, $fp, -193
	b funArray_exit
funArray_exit:
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.main_label_entry:
# %op0 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -17
# br i1 %op0, label %label_neg0, label %label_valid0
	ld.b $t0, $fp, -17
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg0
	b .main_label_valid0
.main_label_valid0:
# %op1 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -25
# store i32 90, i32* %op1
	ld.d $t0, $fp, -25
	addi.w $t1, $zero, 90
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -25
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -29
# %op3 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -30
# br i1 %op3, label %label_neg1, label %label_valid1
	ld.b $t0, $fp, -30
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg1
	b .main_label_valid1
.main_label_neg0:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid0
	b .main_label_valid0
.main_label_valid1:
# %op4 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -38
# store i32 18, i32* %op4
	ld.d $t0, $fp, -38
	addi.w $t1, $zero, 18
	st.w $t1, $t0, 0
# %op5 = load i32, i32* %op4
	ld.d $t0, $fp, -38
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -42
# %op6 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -50
# %op7 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -58
# %op8 = call i32 @funArray(i32* %op6, i32* %op7)
	ld.d $a0, $fp, -50
	ld.d $a1, $fp, -58
	bl funArray
	st.w $a0, $fp, -62
# ret i32 %op8
	ld.w $a0, $fp, -62
	b main_exit
.main_label_neg1:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid1
	b .main_label_valid1
main_exit:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
