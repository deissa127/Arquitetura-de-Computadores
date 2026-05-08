# 02. Crie um programa que lê 6 valores inteiros e, em seguida, mostre na tela os valores lidos.

.text
main:
	lui $8, 0x1001
	addi $25, $0, 6	# contador
	
entradas:
	beq $25, $0, prox
	addi $2, $0, 5
	syscall
	sw $2, 0($8)
	addi $8, $8, 4
	addi $25, $25, -1
	j entradas
	
prox:		
	lui $8, 0x1001  # restaura $8
    addi $25, $0, 6	# restaura contador
	
p:
	beq $25, $0, fim
	lw $4, 0($8)
	addi $2, $0, 1
	syscall
	
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	
	addi $8, $8, 4
	addi $25, $25, -1
	j p
	
fim:
	addi $2, $0, 10
	syscall