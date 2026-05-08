# 04. Faça um programa que leia um vetor de 10 posições. Contar e escrever quantos valores pares ele possui.

.text
main:
	lui $7, 0x1001
	addi $9, $0, 10
	
	add $8, $0, $7
	add $10, $0, $9
ent:
	beq $10, $0, teste
	addi $2, $0, 5
	syscall
	sw $2, 0($8)
	addi $8, $8, 4
	addi $10, $10, -1
	j ent
	
teste:	
	beq $9, $0, fim

	lw $25, 0($7)
	andi $10, $25, 1  # termina com 0 = par, termina com 1 = impar
	bne $10, $0, prox    # != 0 = impar, vai pra prox
	addi $12, $12, 1
	
prox:	
	addi $7, $7, 4
	addi $9, $9, -1
	j teste
	
fim:
	add $4, $0, $12
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall