# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl seed
	.type seed, @object
	.size seed, 4
seed:
	.space 4
	.text
	.globl randomLCG
	.type randomLCG, @function
randomLCG:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.randomLCG_label_entry:
# %op0 = load i32, i32* @seed
	la.local $t0, seed
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -20
# %op1 = mul i32 %op0, 1103515245
	ld.w $t0, $fp, -20
	lu12i.w $t1, 269412
	ori $t1, $t1, 3693
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# %op2 = add i32 %op1, 12345
	ld.w $t0, $fp, -24
	lu12i.w $t1, 3
	ori $t1, $t1, 57
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -28
# store i32 %op2, i32* @seed
	la.local $t0, seed
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op3 = load i32, i32* @seed
	la.local $t0, seed
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -32
# %op4 = load i32, i32* @seed
	la.local $t0, seed
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -36
# ret i32 %op4
	ld.w $a0, $fp, -36
	b randomLCG_exit
randomLCG_exit:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl randBin
	.type randBin, @function
randBin:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.randBin_label_entry:
# br label %label_loop0
	b .randBin_label_loop0
.randBin_label_loop0:
# %op0 = call i32 @randomLCG()
	bl randomLCG
	st.w $a0, $fp, -20
# %op1 = icmp sgt i32 %op0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	sub.w $t2, $t1, $t0
	slt $t3, $t2, $zero
	st.b $t3, $fp, -21
# br i1 %op1, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -21
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .randBin_label_true0
	b .randBin_label_falseBB0
.randBin_label_true0:
# ret i32 1
	addi.w $a0, $zero, 1
	b randBin_exit
.randBin_label_falseBB0:
# ret i32 0
	addi.w $a0, $zero, 0
	b randBin_exit
.randBin_label_other0:
# ret i32 0
	addi.w $a0, $zero, 0
	b randBin_exit
randBin_exit:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl returnToZeroSteps
	.type returnToZeroSteps, @function
returnToZeroSteps:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
.returnToZeroSteps_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -40
	st.d $t0, $fp, -36
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -44
# store i32 0, i32* %op1
	ld.d $t0, $fp, -36
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -48
# br label %label_while0
	b .returnToZeroSteps_label_while0
.returnToZeroSteps_label_while0:
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -52
# %op5 = icmp slt i32 %op4, 20
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 20
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -53
# br i1 %op5, label %label_true0, label %label_false0
	ld.b $t0, $fp, -53
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .returnToZeroSteps_label_true0
	b .returnToZeroSteps_label_false0
.returnToZeroSteps_label_true0:
# br label %label_loop1
	b .returnToZeroSteps_label_loop1
.returnToZeroSteps_label_false0:
# ret i32 20
	addi.w $a0, $zero, 20
	b returnToZeroSteps_exit
.returnToZeroSteps_label_loop1:
# %op6 = call i32 @randBin()
	bl randBin
	st.w $a0, $fp, -57
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -57
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltu $t3, $zero, $t2
	st.b $t3, $fp, -58
# br i1 %op7, label %label_true1, label %label_falseBB1
	ld.b $t0, $fp, -58
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .returnToZeroSteps_label_true1
	b .returnToZeroSteps_label_falseBB1
.returnToZeroSteps_label_true1:
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -62
# %op9 = add i32 %op8, 1
	ld.w $t0, $fp, -62
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -66
# store i32 %op9, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -66
	st.w $t1, $t0, 0
# %op10 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -70
# br label %label_other1
	b .returnToZeroSteps_label_other1
.returnToZeroSteps_label_falseBB1:
# %op11 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -74
# %op12 = sub i32 %op11, 1
	ld.w $t0, $fp, -74
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -78
# store i32 %op12, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -78
	st.w $t1, $t0, 0
# %op13 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -82
# br label %label_other1
	b .returnToZeroSteps_label_other1
.returnToZeroSteps_label_other1:
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -86
# %op15 = add i32 %op14, 1
	ld.w $t0, $fp, -86
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -90
# store i32 %op15, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -90
	st.w $t1, $t0, 0
# %op16 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -94
# br label %label_loop2
	b .returnToZeroSteps_label_loop2
.returnToZeroSteps_label_loop2:
# %op17 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -98
# %op18 = icmp eq i32 %op17, 0
	ld.w $t0, $fp, -98
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltui $t3, $t2, 1
	st.b $t3, $fp, -99
# br i1 %op18, label %label_true2, label %label_falseBB2
	ld.b $t0, $fp, -99
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .returnToZeroSteps_label_true2
	b .returnToZeroSteps_label_falseBB2
.returnToZeroSteps_label_true2:
# %op19 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -103
# ret i32 %op19
	ld.w $a0, $fp, -103
	b returnToZeroSteps_exit
.returnToZeroSteps_label_falseBB2:
# br label %label_other2
	b .returnToZeroSteps_label_other2
.returnToZeroSteps_label_other2:
# br label %label_while0
	b .returnToZeroSteps_label_while0
returnToZeroSteps_exit:
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
	addi.d $sp, $sp, -64
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
# store i32 3407, i32* @seed
	la.local $t0, seed
	lu12i.w $t1, 0
	ori $t1, $t1, 3407
	st.w $t1, $t0, 0
# %op2 = load i32, i32* @seed
	la.local $t0, seed
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -36
# br label %label_while0
	b .main_label_while0
.main_label_while0:
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -40
# %op4 = icmp slt i32 %op3, 20
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 20
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -41
# br i1 %op4, label %label_true0, label %label_false0
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op5 = call i32 @returnToZeroSteps()
	bl returnToZeroSteps
	st.w $a0, $fp, -45
# call void @output(i32 %op5)
	ld.w $a0, $fp, -45
	bl output
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -49
# %op7 = add i32 %op6, 1
	ld.w $t0, $fp, -49
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -53
# store i32 %op7, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -53
	st.w $t1, $t0, 0
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -57
# br label %label_while0
	b .main_label_while0
.main_label_false0:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
