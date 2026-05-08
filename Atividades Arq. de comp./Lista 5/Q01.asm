# 01. Faça um programa que possua um vetor (apelide de A) que armazene 6 números
#     inteiros. O programa deve executar os seguintes passos:
#   a) Atribua os seguintes valores a esse vetor: 1, 0, 5, -2, -5, 7.
#   b) Armazene em uma variável inteira (simples) a soma entre os valores das posições
#     A[0], A[1] e A[5] do vetor e mostre na tela esta soma.
#   c) Modifique o vetor na posição 4, atribuindo a esta posição o valor 100.
#   d) Mostre na tela cada valor do vetor A, um em cada linha.

.data
.word 1 0 5 -2 -5 7	# vetor A

.text
main:
	lui $8, 0x1001
	lw $10, 0($8)
	lw $11, 4($8)
	lw $12, 20($8)
	
	add $4, $10, $11
	add $4, $4, $12
	addi $2, $0, 1
	syscall
	
	addi $4, $0, 10	# pula linha
	addi $2, $0, 11
	syscall
	
	addi $9, $0, 100
	sw $9, 16($8)	# A[4]
	
	addi $25, $0, 6
laco:
	beq $25, $0, fim
	lw $4, 0($8)
	addi $2, $0, 1
	syscall
	
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	
	addi $8, $8, 4
	addi $25, $25, -1
	j laco
	
fim:
	addi $2, $0, 10
	syscall