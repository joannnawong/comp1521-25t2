# Recursive maximum of array function

max:
	# EXAMPLE OF HOW TO FILL OUT HEADER COMMENT
	# Frame:    [$ra, $s0] - anything getting pushed/popped (e.g $ra, $s0)
	# Uses:     [$ra, $s0, $a0, $a1, $v0, $t0] - any register used in the function (frame + clobbers)
	# Clobbers: [$a0, $a1, $v0, $t0] - any register not pushed/popped 
	#
	# Locals:
	#   - $t0 - contains max_so_far
	#   - $s0 - contains first_element
	#
	# Structure:
	#   max
	#   -> [prologue]
	#       -> body
	#	-> if_length_one
	#	-> else_length
	#	-> return_max_so_far
	#   -> [epilogue]

.text

max__prologue:
	begin
	push	$ra
	push	$s0
max__body:
	lw	$s0, ($a0)

max_if_length_one:
	bne	$a1, 1, max_else_length
	move	$v0, $s0
	b	max__epilogue

max_else_length:
	add	$a0, $a0, 4
	sub	$a1, $a1, 1
	jal	max

	move	$t0, $v0

	ble	$s0, $t0, max_return_max_so_far
	move	$t0, $s0

max_return_max_so_far:
	move	$v0, $t0	# return max_so_far

max__epilogue:
	pop	$s0
	pop	$ra
	end

	jr	$ra

main:
main_prologue:
	push	$ra
main_body:
	la	$a0, array
	li	$a1, 10
	jal	max

	move	$a0, $v0
	li	$v0, 1
	syscall

main_epilogue:
	pop	$ra

	jr	$ra
.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1