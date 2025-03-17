	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
.fibonacci_label_entry:
# %op1 = alloca i32
	addi.d $t0, $fp, -32
	st.d $t0, $fp, -28
# store i32 %arg0, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# br label %label_loop0
	b .fibonacci_label_loop0
.fibonacci_label_loop0:
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -36
# %op3 = icmp eq i32 %op2, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	xor $t2, $t1, $t0
	sltui $t3, $t2, 1
	st.b $t3, $fp, -37
# br i1 %op3, label %label_true0, label %label_falseBB0
	ld.b $t0, $fp, -37
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .fibonacci_label_true0
	b .fibonacci_label_falseBB0
.fibonacci_label_true0:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_exit
.fibonacci_label_falseBB0:
# br label %label_loop1
	b .fibonacci_label_loop1
.fibonacci_label_other0:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_exit
.fibonacci_label_loop1:
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -41
# %op5 = icmp eq i32 %op4, 1
	ld.w $t0, $fp, -41
	addi.w $t1, $zero, 1
	xor $t2, $t1, $t0
	sltui $t3, $t2, 1
	st.b $t3, $fp, -42
# br i1 %op5, label %label_true1, label %label_falseBB1
	ld.b $t0, $fp, -42
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .fibonacci_label_true1
	b .fibonacci_label_falseBB1
.fibonacci_label_true1:
# ret i32 1
	addi.w $a0, $zero, 1
	b fibonacci_exit
.fibonacci_label_falseBB1:
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -46
# %op7 = sub i32 %op6, 1
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -50
# %op8 = call i32 @fibonacci(i32 %op7)
	ld.w $a0, $fp, -50
	bl fibonacci
	st.w $a0, $fp, -54
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -28
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -58
# %op10 = sub i32 %op9, 2
	ld.w $t0, $fp, -58
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -62
# %op11 = call i32 @fibonacci(i32 %op10)
	ld.w $a0, $fp, -62
	bl fibonacci
	st.w $a0, $fp, -66
# %op12 = add i32 %op8, %op11
	ld.w $t0, $fp, -54
	ld.w $t1, $fp, -66
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -70
# ret i32 %op12
	ld.w $a0, $fp, -70
	b fibonacci_exit
.fibonacci_label_other1:
# br label %label_other0
	b .fibonacci_label_other0
fibonacci_exit:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -40
	st.d $t0, $fp, -36
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
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
	b .main_label_while0
.main_label_while0:
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -52
# %op5 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -56
# %op6 = icmp slt i32 %op4, %op5
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -56
	sub.w $t2, $t0, $t1
	slt $t3, $t2, $zero
	st.b $t3, $fp, -57
# br i1 %op6, label %label_true0, label %label_false0
	ld.b $t0, $fp, -57
	bstrpick.w $t1, $t0, 0, 0
	bne $t1, $zero, .main_label_true0
	b .main_label_false0
.main_label_true0:
# %op7 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -61
# %op8 = call i32 @fibonacci(i32 %op7)
	ld.w $a0, $fp, -61
	bl fibonacci
	st.w $a0, $fp, -65
# call void @output(i32 %op8)
	ld.w $a0, $fp, -65
	bl output
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -69
# %op10 = add i32 %op9, 1
	ld.w $t0, $fp, -69
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -73
# store i32 %op10, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t1, $fp, -73
	st.w $t1, $t0, 0
# %op11 = load i32, i32* %op1
	ld.d $t0, $fp, -36
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -77
# br label %label_while0
	b .main_label_while0
.main_label_false0:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
