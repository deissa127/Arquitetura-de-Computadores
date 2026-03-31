# 12. Faça um programa que leia as duas notas (entre 0 e 100) e as faltas de um aluno em
#     uma disciplina. A média do aluno é calculada ponderadamente, com pesos 2 e 3. A
#     cada 5 faltas o aluno perde 10 pontos. O programa deve informar a média, a
#     penalidade e a média final, uma em cada linha.

.text
main:	addi $2, $0, 5	# entrada nota 1
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5	# entrada nota 2
	syscall
	add $9, $0, $2
	
	addi $2, $0, 5 # entrada falta
	syscall
	add $10, $0, $2
	
	# add pesos
	
	addi $11, $0, 2
	addi $12, $0, 3
	
	# cálculo média ponderada
	
	mul $13, $8, $11 #1
	mul $14, $9, $12 #2
	
	add $15, $13, $14 #soma mul
	
	add $16, $11, $12 #soma pesos
	
	div $15, $16
	mflo $20
	
	add $4, $0, $20
	addi $2, $0, 1
	syscall  # saida da média
	
	# espaço
	
	add $4, $0, '\n'
	addi $2,$0, 11
	syscall
	
	# cálculo faltas
	
	addi $25, $0, 5
	
	div $10, $25
	mflo $24
	
	addi $23, $0, 10
	
	mul $22, $24, $23 # penalidade por faltas
	
	# cálculo média final
	
	sub $21, $20, $22 # média final
	
	add $4, $0, $22
	
	addi $2, $0, 1
	syscall # saída penalidade
	
	# espaço
	
	add $4, $0, '\n'
	addi $2,$0, 11
	syscall
	
	add $4, $0, $21
	
	addi $2, $0, 1
	syscall # saída média final
	
	addi $2, $0, 10
	syscall