# MIPS function to multiply a matrix by a scalar.
# 

.text

change:
change_prologue:
change_body:
	move	$t0, $a0
	move	$t1, $a1
	move	$t2, $a2
	move	$t3, $a3

change_row_init:
	li	$t4, 0

change_row_cond:
	bge	$t4, $t0, change_row_term

change_row_body:

change_col_init:
	li	$t5, 0

change_col_cond:
	bge	$t5, $t1, change_col_term

change_col_body:
	mul	$t6, $t4, $t1
	add	$t6, $t6, $t5
	mul	$t6, $t6, 4
	add	$t6, $t6, $t2
	lw	$t7, ($t6)		# $t6 = M[row][col]

	mul	$t7, $t7, $t3

	sw	$t7, ($t6)

change_col_iter:
	addi	$t5, $t5, 1
	b	change_col_cond

change_col_term:

change_row_iter:
	addi	$t4, $t4, 1
	b	change_row_cond

change_row_term:

change_epilogue:
	jr	$ra

main:
main_prologue:
	push	$ra
main_body:
	li   $a0, 3
	li   $a1, 4
	la   $a2, M
	li   $a3, 2
	jal  change

main_epilogue:
	pop	$ra

	jr	$ra

    .data
M:  .word 1, 2, 3, 4
    .word 3, 4, 5, 6
    .word 5, 6, 7, 8