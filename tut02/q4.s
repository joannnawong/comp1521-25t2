
	.text
main:
	
	# x,y in $t0, $t1

	la	$a0, prompt_str			# printf("Enter a number: ")
	li	$v0, 4
	syscall

	li	$v0, 5				# scanf()
	syscall
	move	$t0, $v0			# $t0 = $v0 -- x = $v0

	mul	$t1, $t0, $t0

	move	$a0, $t1			# printf("%d", y)
	li	$v0, 1
	syscall

	li	$a0, '\n'			# printf("\n")
	li	$v0, 11
	syscall 

	li	$v0, 0
	jr	$ra
	
	.data
prompt_str:
	.asciiz "Enter a number: "