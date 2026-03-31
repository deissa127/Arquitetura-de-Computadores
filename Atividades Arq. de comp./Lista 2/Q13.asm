# 13. Faça um programa que leia um número inteiro (entre 0 e 9999) e imprima esse
#     número com 4 caracteres, sendo o número alinhado à direita.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $10, $0, 10
	
	div $8, $10 
	mfhi $11	# unidade
	mflo $8
	
	div $8, $10
	mfhi $12	# dezena
	mflo $8
	
	div $8, $10
	mfhi $13	# centena
	mflo $8
	
	div $8, $10
	mfhi $14	# milhar
	
	add $4, $0, $14
	addi $2, $0, 1
	syscall
	
	add $4, $0, $13
	addi $2, $0, 1
	syscall
	
	add $4, $0, $12
	addi $2, $0, 1
	syscall
	
	add $4, $0, $11
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall


# addi $10, $0, 1
# slt $11, $9, $8  # $a > $b = $x -> 0 // $a < $b = $x -> 1
# beq $11, $12, x