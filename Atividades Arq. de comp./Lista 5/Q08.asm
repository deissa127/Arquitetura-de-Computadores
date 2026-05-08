# 08. Faça um programa que leia um vetor de 10 posições e verifique se existem valores
#     iguais e os escreva na tela.

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
	addi $9, $9, -1
	
	lw $25, 0($7)
	addi $7, $7, 4
	
	add $17, $0, $7
	add $19, $0, $9
	
comp:	
	beq $19, $0, teste
	addi $19, $19, -1
	
	lw $24, 0($17)
	addi $17, $17, 4
	
	beq $25, $24, print
	
	
	j teste
	
print:
	add $4, $0, $24
	addi $2, $0, 1
	syscall
	
	j comp
	
fim:
	addi $2, $0, 10
	syscall