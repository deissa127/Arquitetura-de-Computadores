# 5. Faça um programa que receba três notas (entre 0 e 100) e calcule a média ponderada
#    dessas notas com pesos 1, 2 e 3. Informe a média e se o aluno foi aprovado, escreva
#    após a média o a letra A. Caso o aluno seja reprovado, informe, após a média, a letra R. 
#    A média para aprovação é 60.

.text
main:	# entrada notas

	addi $2, $0, 5
	syscall
	add $8, $0, $2 # nota1
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2 # nota2
	
	addi $2, $0, 5
	syscall
	add $10, $0, $2 # nota3
	
	# add pesos
	
	addi $25, $0, 1
	addi $24, $0, 2
	addi $23, $0, 3
	
	# calculo média ponderada
	
	mul $11, $8, $25 #1
	mul $12, $9, $24 #2
	mul $13, $10, $23 #3
	
	add $14, $11, $12
	add $15, $14, $13 #soma da mul $15
	
	add $22, $25, $24
	add $21, $22, $23 #soma pesos $21
	
	div $15, $21
	mflo $4
	
	addi $2, $0, 1
	syscall  # saida da nota
	
	addi $17, $0, 60
	slt $18, $4, $17 # $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $18, $0, igual0
	
difer0:	add $4, $0, '\n'
	addi $2,$0, 11
	syscall

	add $4, $0, 'A'
	addi $2,$0, 11
	syscall
	j fim

igual0:	add $4, $0, '\n'
	addi $2,$0, 11
	syscall
	
	add $4, $0, 'R'
	addi $2,$0, 11
	syscall
	
fim:	addi $2, $0, 10
	syscall