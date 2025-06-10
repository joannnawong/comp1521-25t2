# Prints a right-angled triangle of asterisks, 10 rows high.

main:

row_init:
	li	$t0, 1

row_cond:
	bgt	$t0, 10, row_term

row_body:

col_init:
	li	$t1, 0

col_cond:
	bge	$t1, $t0, col_term

col_body:
	li      $a0, '*'                  # printf("%c", '*');        
        li      $v0, 11 
        syscall
        
col_step:
	addi	$t1, 1
        
        b       col_cond       # goto col_loop_cond;

col_term:

	li	$v0, 11
	li	$a0, '\n'
	syscall

row_step:
	addi	$t0, 1
	b	row_cond

row_term:

epilogue:
	li	$v0, 0
	jr	$ra