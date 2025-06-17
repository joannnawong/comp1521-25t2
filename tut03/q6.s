# A simple program that will print 10 number from an array

# Constant for the size of the array
# This is treated like a literal (i.e. you load it with `li`, not `la/lb/lw`) but is more 
# readable than a magic number
NUMBERS_SIZE = 10

        .text

main:

loop_init:
	li	$t0, 0

loop_cond:
	bge	$t0, NUMBERS_SIZE, loop_term

loop_body:
	la	$t1, numbers
	mul	$t2, $t0, 4
	add	$t2, $t2, $t1
	lw	$t3, ($t2)

	move	$a0, $t3
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall


loop_iter:
	addi	$t0, $t0, 1
	b	loop_cond

loop_term:

epilogue:
        jr      $ra                     # return

        .data

numbers:
        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9  # int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};