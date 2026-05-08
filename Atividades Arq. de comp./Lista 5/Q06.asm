# 06. Crie um programa que leia 6 valores inteiros pares, descartando qualquer entrada
#     ímpar, e, em seguida, mostre na tela os valores lidos na ordem inversa.

# rotina:
# entrada = $20
# saida = $12
# usa sem preservar = $ 11

.text
main:
	lui $7, 0x1001
	addi $9, $0, 6
	
	addi $10, $0, 6

ent:
	beq $9, $0, fim
	addi $2, $0, 5
	syscall
	add $20, $0, $2
	
	jal teste	# vai para o teste de par ou impar
	
	beq $12, $0, ent	# se for impar = 0 => nova entrada
	sw $20, 0($7)	# guarda número par
	addi $7, $7, 4
	addi $9, $9, -1	# contador
	j ent

fim:	
	beq $10, $0, f	# contador saídas
	
	addi $7, $7, -4

	lw $4, 0($7)
	addi $2, $0, 1
	syscall
	
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	
	addi $10, $10, -1	# contador saídas
	
	j fim
	
f:
	addi $2, $0, 10
	syscall

teste:	
	addi $12, $0, 0
	andi $11, $20, 1  # termina com 0 = par, termina com 1 = impar
	bne $11, $0, prox    # != 0 = impar, vai pra prox
	addi $12, $0, 1
	
prox:
	jr $31