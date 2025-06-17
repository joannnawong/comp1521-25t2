# A Short program that will load each element of an array, add 42 to it if 
# it is a negative number, and then store it back if it was modified.

# Constant for the size of the array
# This is treated like a literal (i.e. you load it with `li`, not `la/lb/lw`) but is more 
# clear than a magic number
N_SIZE = 10

        .text

main:

loop_init:
	li	$t0, 0

loop_cond:
	bge	$t0, N_SIZE, loop_term

loop_body:
	la	$t1, numbers
	mul	$t2, $t0, 4
	add	$t2, $t2, $t1

	lw	$t3, ($t2)

	bgez	$t3, loop_iter
	bge	$t3, 0, loop_iter

	addi	$t4, $t3, 42
	sw	$t4, ($t2)

loop_iter:
	addi	$t0, $t0, 1
	b	loop_cond

loop_term:
       
epilogue:
        jr      $ra                     # return


        .data

numbers:
        .word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9   # int numbers[10] = {0, 1, 2, -3, 4, -5, 6, -7, 8, 9};