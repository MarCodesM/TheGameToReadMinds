.data

maxRandLen:	.word	6

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
	move		$a1, %max
	li		$v0, 42
	syscall
	move		%register, $a0
.end_macro



.text

	
