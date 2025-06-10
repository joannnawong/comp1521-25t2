# Prints every 3rd number from 24 to 42

main: 

loop_init:
	li	$t0, 24		# x = 24

loop_cond:
	bge	$t0, 42, loop_term

loop_body:
	move	$a0, $t0	# printf(x)
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

loop_step:
	add	$t0, $t0, 3	# $t0 = $t0 + 3
	b	loop_cond

loop_term:

epilogue:
	jr	$ra
