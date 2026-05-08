# 05. Faça um programa que leia um vetor com 10 posições. Em seguida deverá ser
#     impresso o maior e o menor elemento do vetor.

.text
main:
	lui $7, 0x1001
	addi $9, $0, 10
	
	add $8, $0, $7
	add $10, $0, $9
ent:
	beq $10, $0, laco
	addi $2, $0, 5
	syscall
	sw $2, 0($8)
	addi $8, $8, 4
	addi $10, $10, -1
	j ent
	
laco:	
	lw $25, 0($7)	# maior
	lw $24, 0($7)	# menor
	
	addi $9, $9, -1
	addi $7, $7, 4
	
teste:
	beq $9, $0, fim

maior:
	lw $23, 0($7)
	slt $20, $23, $25	# $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $20, $0, menor
	add $25, $0, $23
	j prox

menor:
	slt $20, $23, $24	# $a > $b = $x -> 0 // $a < $b = $x -> 1
	bne $20, $0, prox
	add $24, $0, $23

prox:	
	addi $7, $7, 4
	addi $9, $9, -1
	j teste
	
fim:
	add $4, $0, $25
	addi $2, $0, 1
	syscall
	
	add $4, $0, 10
	addi $2, $0, 11
	syscall
	
	add $4, $0, $24
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall