	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = alloca i32*
	addi.d $t0, $fp, -48
	st.d $t0, $fp, -40
# store i32* %arg0, i32** %op3
	ld.d $t0, $fp, -40
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -60
	st.d $t0, $fp, -56
# store i32 %arg1, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op5 = alloca i32
	addi.d $t0, $fp, -72
	st.d $t0, $fp, -68
# store i32 %arg2, i32* %op5
	ld.d $t0, $fp, -68
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op6 = load i32, i32* %op5
	ld.d $t0, $fp, -68
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -76
# %op7 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -80
# %op8 = load i32*, i32** %op3
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -88
# %op9 = getelementptr i32, i32* %op8, i32 %op7
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -80
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# store i32 %op6, i32* %op9
	ld.d $t0, $fp, -96
	ld.w $t1, $fp, -76
	st.w $t1, $t0, 0
# %op10 = load i32, i32* %op9
	ld.d $t0, $fp, -96
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -100
# %op11 = load i32, i32* %op5
	ld.d $t0, $fp, -68
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -104
# ret i32 %op11
	ld.w $a0, $fp, -104
	b store_exit
store_exit:
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -192
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# %op2 = alloca i32
	addi.d $t0, $fp, -88
	st.d $t0, $fp, -84
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -92
# br label %label_while0
	b .main_label_while0
.main_label_while0:
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -96
# %op5 = icmp slt i32 %op4, 10
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 10
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -97
# br i1 %op5, label %label_true0, label %label_false0
	ld.b $t0, $fp, -97
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op6 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -105
# %op7 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -109
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -113
# %op9 = mul i32 %op8, 2
	ld.w $t0, $fp, -113
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -117
# %op10 = call i32 @store(i32* %op6, i32 %op7, i32 %op9)
	ld.d $a0, $fp, -105
	ld.w $a1, $fp, -109
	ld.w $a2, $fp, -117
	bl store
	st.w $a0, $fp, -121
# %op11 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -125
# %op12 = add i32 %op11, 1
	ld.w $t0, $fp, -125
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -129
# store i32 %op12, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -129
	st.w $t1, $t0, 0
# %op13 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -133
# br label %label_while0
	b .main_label_while0
.main_label_false0:
# store i32 0, i32* %op2
	ld.d $t0, $fp, -84
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op14 = load i32, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -137
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op15 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -141
# br label %label_while1
	b .main_label_while1
.main_label_while1:
# %op16 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -145
# %op17 = icmp slt i32 %op16, 10
	ld.w $t0, $fp, -145
	addi.w $t1, $zero, 10
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -146
# br i1 %op17, label %label_true1, label %label_false1
	ld.b $t0, $fp, -146
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true1
	b .main_label_false1
.main_label_true1:
# %op18 = load i32, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -150
# %op19 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -154
# %op20 = icmp slt i32 %op19, 0
	ld.w $t0, $fp, -154
	addi.w $t1, $zero, 0
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -155
# br i1 %op20, label %label_neg2, label %label_valid2
	ld.b $t0, $fp, -155
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_neg2
	b .main_label_valid2
.main_label_false1:
# %op21 = load i32, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -159
# call void @output(i32 %op21)
	ld.w $a0, $fp, -159
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label_valid2:
# %op22 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op19
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t1, $fp, -154
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -167
# %op23 = load i32, i32* %op22
	ld.d $t0, $fp, -167
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -171
# %op24 = add i32 %op18, %op23
	ld.w $t0, $fp, -150
	ld.w $t1, $fp, -171
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -175
# store i32 %op24, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t1, $fp, -175
	st.w $t1, $t0, 0
# %op25 = load i32, i32* %op2
	ld.d $t0, $fp, -84
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -179
# %op26 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -183
# %op27 = add i32 %op26, 1
	ld.w $t0, $fp, -183
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -187
# store i32 %op27, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -187
	st.w $t1, $t0, 0
# %op28 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -191
# br label %label_while1
	b .main_label_while1
.main_label_neg2:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_valid2
	b .main_label_valid2
main_exit:
	addi.d $sp, $sp, 192
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
