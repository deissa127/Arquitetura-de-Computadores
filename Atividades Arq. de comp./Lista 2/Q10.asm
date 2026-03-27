# 10. Faça um programa que leia três números e informa a média aritmética simples desses
#     três números, arredondando o resultado para o inteiro mais próximo (a partir 0,5
#     arredonda para o próximo inteiro maior).

.text
main:	
    addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	add $11, $8, $9
	add $12, $11, $10
	
	addi $25, $0, 3
	div $12, $25

	mfhi $13
	mflo $4
	addi $14, $0, 2
	bne $13, $14, imp

	addi $4, $4, 1

imp:	
    addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall