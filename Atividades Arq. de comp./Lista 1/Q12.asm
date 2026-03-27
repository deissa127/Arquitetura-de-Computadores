# 12. Faça um programa que calcule uma média ponderada de três números inteiros, com
#     pesos 3, 9 e 15, sem usar a operação de multiplicação.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	add $11, $8, $8
	add $11, $11, $8
	
	add $12, $9, $9
	add $12, $12, $12
	add $12, $12, $12
	add $12, $12, $9
	
	add $13, $10, $10
	add $13, $13, $13
	add $13, $13, $13
	add $13, $13, $13
	sub $13, $13, $10
	
	add $14, $11, $12
	add $14, $14, $13
	
	addi $15, $0, 27
		
	div $14, $15
	mflo $4
	
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall
