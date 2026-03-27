# 6. Faça um programa que leia a idade (em anos) e o tempo de serviço de um trabalhador.
# Informe se ele pode se aposentar (imprima S se sim, e N se não). As condições para
# aposentadoria são: 1) ter, ao menos, 65 anos; OU 2) ter trabalhado 40 anos; OU ter
# pelo menos 60 anos e mais de 35 anos.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2 # idade em anos
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2 # t de contribuição
	
	addi $25, $0, 1 # atribuindo para comparar no beq
	
	addi $10, $0, 65
	slt $11, $8, $10 # $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $11, $25, menor65
	
maior65:
	addi $4, $0,'S'
	addi $2,$0, 11
	syscall
	j fim

menor65: # continua o código para a possíbilidade de t de contrib. > 40
	addi $12, $0, 40
	slt $13, $9, $12 # $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $13, $25, menor40 # TRABALHO

maior40:
	addi $4, $0,'S'
	addi $2,$0, 11
	syscall
	j fim
	
menor40: # continua o código para a possíbilidade de idade > 60 E t de contrib. > 35
	addi $14, $0, 60
	slt $15, $8, $14 # $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $15, $25, menor # IDADE
	
maior60:
	addi $16, $0, 36
	slt $17, $9, $16 # $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $17, $25, menor # TRABALHO
	
maior35:
	addi $4, $0,'S'
	addi $2,$0, 11
	syscall
	j fim
	
menor:
	addi $4, $0,'N'
	addi $2,$0, 11
	syscall
	j fim

fim:	addi $2, $0, 10
	syscall