# 12. Escreva um programa que leia números inteiros no intervalo [0,50] e os armazene em
#     um vetor com 10 posições. Preencha um segundo vetor apenas com os números
#     ímpares do primeiro vetor. Imprima os dois vetores, 2 elementos por linha.

# falta saída

.data
A:	.word 0 0 0 0 0 0 0 0 0 0
I:	.word 0 0 0 0 0 0 0 0 0 0

.text
main:
	lui $7, 0x1001
	
	add $17, $0, $7
	add $8, $0, $7	# cópia
	addi $10, 0, 10
	la $18, I
	addi $20, $0, 0
	
entrada:
	slt $9, $10, $0	# $a > b = $x -> 0 // $a < b = $x -> 1
	bne $9, $0, comp
	
	addi $2, $0, 5
	syscall
interv:
	slt $15, $2, $0		# $a > b = $x -> 0 // $a < b = $x -> 1
	bne $15, $0, ent
	
	slti $15, $2, 51	# $a > b = $x -> 0 // $a < b = $x -> 1
	beq $15, $0, ent
	
add:
	sw $2, 0($8)
	addi $8, $8, 4	# prox posição da memória
	addi $10, $10, -1
ent:	j entrada
	
comp:
	addi $20, $20, 1
	slti $21, $20, 10	# $a > b = $x -> 0 // $a < b = $x -> 1
	beq $21, $0, fim
	
	addi $6, $0, 2
	
	lw $11, 0($17)
	addi $17, $17, 4
	div $11, $6
	mfhi $12
	bne $12, $0, impar
par:
	j comp
impar:
	sw $11, 0($18)	# ponteiro de memória $8
	addi $18, $18, 4
	addi $25, $25, 1
	j comp
	
fim: