# Sum 4 numbers using function calls.

.text

main:
main_prologue:
	begin
	push	$ra

main_body:
	li	$a0, 11
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4

	move	$t0, $v0

	move	$a0, $v0
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

	li	$v0, 0
main__epilogue:
	pop	$ra
	end

	jr	$ra

sum4:
sum4_prologue:
	begin
	push	$ra
	push	$s0
	push	$s1
	push	$s2

sum4_body:
	move	$s0, $a2		# $s0 = c
	move	$s1, $a3		# $s1 = d

	jal	sum2
	move	$s2, $v0		# $s2 = res1

	move	$a0, $s0
	move	$a1, $s1

	jal	sum2

	move	$s1, $v0		# $s1 = res2

	move	$a0, $s2
	move	$a1, $s1
	jal	sum2

sum4_epilogue:
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	end

	jr	$ra

sum2:
sum2_prologue:
sum2_main:
	add	$v0, $a0, $a1		# return x + y

sum2_epilogue:
	jr	$ra