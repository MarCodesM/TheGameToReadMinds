.data

maxRandLen:	.word	7
counter:	.word	1
one:		.word	1
two:		.word	2
three:		.word	3
four:		.word	4
five:		.word	5
six:		.word	6


# Prints whatever string passed 
.macro print_str (%str)
	.data
	myLabel:	.asciiz	%str
	.text
	li 		$v0, 4
	la 		$a0, myLabel
	syscall
.end_macro 

# Prints whatever integer passed
.macro print_int(%x)
	li 		$v0, 1
	add		$a0, $zero, %x
	syscall
.end_macro 

# gets random number (I am not sure this works yet lol)
.macro get_rand_num(%gen, %register, %max)
	li		$a0, %gen
	move	$a1, %max
	li		$v0, 42
	syscall
	move	%register, $a0
.end_macro

# Creates random number between 1-6 stores it $t1
.macro rand_six()
	li	$a1, 6
	li	$v0,	42
	syscall
	add $a0, $a0, 1
	move $t1, $a0
.end_macro

.text
	lw 	$t9, counter
	lw	$t8, maxRandLen
	

cardLoop:
	beq	$t9, $t8, exit

	rand_six()
	
	bne	$t1, $t2, history
	beq	$t1, $t2, cardLoop
	
	
	history:
	move $t2, $t1
	print_int($t2)
	addi $t9, $t9, 1
	j cardLoop
	

exit: 
	li	$v0, 10
	syscall

	
