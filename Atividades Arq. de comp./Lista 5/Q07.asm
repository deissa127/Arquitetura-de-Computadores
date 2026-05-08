# 07. Faça um programa que preencha um vetor com 10 números, calcule e mostre a
#     quantidade de números negativos e a soma dos números positivos desse vetor.


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
	
	slt $15, $0, $25	# $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $15, $0, neg
	
pos:
	add $16, $16, $25
	j teste

neg:
	addi $14, $14, 1
	j teste
	
fim:
	addi $4, $0, 'n'
	addi $2, $0, 11
	syscall
	
	addi $4, $0, '='
	addi $2, $0, 11
	syscall
	
	add $4, $0, $14
	addi $2, $0, 1
	syscall
	
	addi $4, $0, 10
	addi $2, $0, 11
	syscall
	
	addi $4, $0, 'p'
	addi $2, $0, 11
	syscall
	
	addi $4, $0, '='
	addi $2, $0, 11
	syscall
	
	add $4, $0, $16
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall