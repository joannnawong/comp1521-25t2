# A simple program that will read 10 numbers into an array

# Constant for the size of the array
# This is treated like a literal (i.e. you load it with `li`, not `la/lb/lw`) but is more 
# readable than a magic number
N_SIZE = 10

        .text

main:

loop_init:
	li	$t0, 0

loop_cond:
	bge	$t0, N_SIZE, loop_term

loop_body:
	li	$v0, 5
	syscall

	la	$t1, numbers		# numbers address

	mul	$t2, $t0, 4		# i * 4
	add	$t2, $t2, $t1		# numbers + i * 4

	sw	$v0, ($t2)		

loop_iter:
	addi	$t0, $t0, 1
	b	loop_cond

loop_term:

epilogue:
        jr      $ra                     	# return

        .data

numbers:                                        # The array of numbers, initialised to 0
        .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0      # int numbers[10] = {0};