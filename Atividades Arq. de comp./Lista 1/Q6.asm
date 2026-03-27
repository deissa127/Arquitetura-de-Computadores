# 6. Faça um programa que leia um número inteiro entre 0 e 999 e imprima esse número
#    com 3 algarismos. Ex.: 23 gera uma saída 023. 8 gera uma saída 008.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $10, $0, 10
	
	div $8, $10
	mfhi $11
	mflo $8
	
	div $8, $10
	mfhi $12
	mflo $8
	
	div $8, $10
	mfhi $13
	
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