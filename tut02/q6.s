# A simple program demonstrating how to represent a implementing an && in an
# if-statement in MIPS.
# This version: MIPS.

main:

	la	$a0, prompt_str		# printf()
	li	$v0, 4
	syscall

	li	$v0, 5			# scanf()
	syscall
	move	$t0, $v0		# x = $t0

	ble	$t0, 100, else		# if (x <= 100) goto else
	bge	$t0, 1000, else		# if (x >= 1000) goto else

	li	$v0, 4			# printf("medium\n");
	la	$a0, medium_str
	syscall
	b	epilogue


else:
	li	$v0, 4			#printf("small/big\n");
	la	$a0, small_big_str
	syscall

epilogue:
	jr	$ra

	.data
prompt_str:
	.asciiz "Enter a number: "
			
medium_str:
	.asciiz "medium\n"
			
small_big_str:
	.asciiz "small/big\n"