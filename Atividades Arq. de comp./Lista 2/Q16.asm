# 16. Faça um programa que leia um número com 9 algarismos e informe os dois
#     algarismos seguintes que devem formar um CPF válido.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	# dismembrando os 9 dígitos
	
	addi $10, $0, 10
	
	div $8, $10 
	mfhi $11	
	mflo $8
	
	div $8, $10
	mfhi $12	
	mflo $8
	
	div $8, $10
	mfhi $13	
	mflo $8
	
	div $8, $10
	mfhi $14
	mflo $8
	
	div $8, $10 
	mfhi $15	
	mflo $8
	
	div $8, $10
	mfhi $16
	mflo $8
	
	div $8, $10
	mfhi $17	
	mflo $8
	
	div $8, $10
	mfhi $18
	mflo $19
	
	# PRIMEIRO DIGITO
	
	# multiplicando por 10($19 * 10) até 2 ($11 * 2)
	
	addi $20, $0, 2
	
	mul $21, $11, $20
	addi $20, $20, 1
	
	mul $22, $12, $20
	add $22, $22, $21
	addi $20, $20, 1
	
	mul $21, $13, $20
	add $22, $22, $21
	addi $20, $20, 1
	
	mul $21, $14, $20
	add $22, $22, $21
	addi $20, $20, 1
	
	mul $22, $15, $20
	add $22, $22, $21
	addi $20, $20, 1
	
	mul $21, $16, $20
	add $22, $22, $21
	addi $20, $20, 1
	
	mul $21, $17, $20
	add $22, $22, $21
	addi $20, $20, 1
	
	mul $21, $18, $20
	add $22, $22, $21
	addi $20, $20, 1
	
	mul $21, $19, $20
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 11
	
	# div por 11
	
	div $22, $20
	mfhi $25
	
	
	addi $2, $0, 10
	syscall
	