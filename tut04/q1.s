# This program prints out a danish flag, by
# looping through the rows and columns of the flag.
# Each element inside the flag is a single character.
# (i.e., 1 byte).
#
# (Dette program udskriver et dansk flag, ved at
# sløjfe gennem rækker og kolonner i flaget.)
#

# Constants
FLAG_ROWS = 6
FLAG_COLS = 12

.text

main:

main_row_init:
	li	$t0, 0

main_row_cond:
	bge	$t0, FLAG_ROWS, main_row_term

main_row_body:

main_col_init:
	li	$t1, 0

main_col_cond:
	bge	$t1, FLAG_COLS, main_col_term

main_col_body:
	li	$t2, flag
	mul	$t3, $t0, FLAG_COLS
	add	$t3, $t3, $t1			# row * FLAG_COLS + cols
	
	add	$t3, $t3, $t2
	lb	$a0, ($t3)			# printf("%c", flag[row][col])
	li	$v0, 11
	syscall


main_col_iter:
	addi	$t1, $t1, 1
	b	main_col_cond
main_col_term:
	li	$v0, 11
	li	$a0, '\n'
	syscall

main_row_iter:
	addi	$t0, $t0, 1
	b	main_row_cond

main_row_term:

main__epilogue:
	jr	$ra

.data
# This label inside the data region refers to the bytes of the flag.
# Note that even thought the bytes are listed on separate lines,
# they are actually stored as a single contiguous chunk or 'string' in memory.
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'