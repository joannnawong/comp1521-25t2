# A short program that reverses an array by swapping elements.
# Note that since we end up using more registers, we need more documentation. 

# Constants
N_SIZE = 10
N_SIZE_M_1 = N_SIZE - 1
N_SIZE_D_2 = N_SIZE / 2

        .text

main:

loop_init:
	li	$t0, 0

loop_cond:
	bge	$t0, N_SIZE_D_2, loop_term

loop_body:
	la	$t1, numbers
	mul	$t2, $t0, 4
	add	$t2, $t2, $t1

	lw	$t3, ($t2)		# x = numbers[i]

	sub	$t4, N_SIZE_M_1, $t0
	mul	$t2, $t4, 4
	add	$t2, $t1, $t2

	lw	$t4, ($t2)		# y = numbers[N_SIZE_M_1 - i]

	mul	$t2, $t0, 4
	add	$t2, $t2, $t1
	sw	$t4, ($t2)

	sub	$t2, N_SIZE_M_1, $t0
	mul	$t2, $t2, 4
	add	$t2, $t2, $t1
	sw	$t3, ($t2)

loop_iter:
	addi	$t0, $t0, 1
	b	loop_cond

loop_term:
       
epilogue:
        jr      $ra                     # return

        .data

numbers:
        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9      # int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};