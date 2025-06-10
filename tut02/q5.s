# Squares a number, unless it is too big for a 32-bit register.
# If it is too big, prints an error message instead.

# Constant
SQUARE_MAX = 46340

	.text
main:
	# x, y in $t0, $t1

	la	$a0, prompt_str		# printf()
	li	$v0, 4
	syscall

	li	$v0, 5			# scanf()
	syscall
	move	$t0, $v0

	bgt	$t0, SQUARE_MAX, x_gt_square_max	# if (x > SQUARE_MAX) goto x_gt_square_max

	mul	$t1, $t0, $t0		# y = x * x

	move	$a0, $t1		# printf(y)
	li	$v0, 1
	syscall

	li	$a0, '\n'		# printf('\n')
	li	$v0, 11
	syscall
	b	epilogue

x_gt_square_max:
	la	$a0, too_big_str	# printf()
	li	$v0, 4
	syscall

epilogue:
	li	$v0, 0
	jr      $ra                         # return from main
			
	.data
prompt_str:
	.asciiz "Enter a number: "

too_big_str:
	.asciiz "square too big for 32 bits\n"