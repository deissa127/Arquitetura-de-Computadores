# 18. Faça um programa que receba um inteiro (entre 0 e 999) e imprima o binário correspondente.

.text
main:	
    addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $9, $0, 2
	
    
	div $8, $9
	mfhi $11
	mflo $10
	
	div $10, $9
	mfhi $12
	mflo $10
	
	div $10, $9
	mfhi $13
	mflo $10
	
	div $10, $9
	mfhi $14
	mflo $10
	
	div $10, $9
	mfhi $15
	mflo $10
	
	div $10, $9
	mfhi $16
	mflo $10
	
	div $10, $9
	mfhi $17
	mflo $10
	
	div $10, $9
	mfhi $18
	mflo $10
	
	div $10, $9
	mfhi $19
	mflo $10
	
	
	add $4, $0, $10
	addi $2, $0, 1
	syscall
	
	add $4, $0, $19
	addi $2, $0, 1
	syscall
	
	add $4, $0, $18
	addi $2, $0, 1
	syscall
	
	add $4, $0, $17
	addi $2, $0, 1
	syscall
	
	add $4, $0, $16
	addi $2, $0, 1
	syscall
	
	add $4, $0, $15
	addi $2, $0, 1
	syscall
	
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