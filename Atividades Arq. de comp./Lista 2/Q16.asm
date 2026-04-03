# 16. Faça um programa que leia um número com 9 algarismos e informe os dois
#     algarismos seguintes que devem formar um CPF válido.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	# dismembrando os 9 dígitos
	
	addi $10, $0, 10
	
	div $8, $10 
	mfhi $11	
	mflo $8
	
	div $8, $10
	mfhi $12	
	mflo $8
	
	div $8, $10
	mfhi $13	
	mflo $8
	
	div $8, $10
	mfhi $14
	mflo $8
	
	div $8, $10 
	mfhi $15	
	mflo $8
	
	div $8, $10
	mfhi $16
	mflo $8
	
	div $8, $10
	mfhi $17	
	mflo $8
	
	div $8, $10
	mfhi $18
	mflo $19
	
	# PRIMEIRO DIGITO
	
	# multiplicando por 10($19 * 10) até 2 ($11 * 2)
	
	addi $20, $0, 2
	
	mul $21, $11, $20 # *2
	addi $20, $20, 1 # $20 -> 3
	
	mul $22, $12, $20 # *3
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 4
	
	mul $21, $13, $20 # *4
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 5
	
	mul $21, $14, $20 # *5
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 6
	
	mul $21, $15, $20 # *6
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 7
	
	mul $21, $16, $20 # *7
	add $22, $22, $21
	addi $20, $20, 1 # # $20 -> 8
	
	mul $21, $17, $20 # *8
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 9
	
	mul $21, $18, $20 # *9
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 10
	
	mul $21, $19, $20 # *10
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 11
	
	# div por 11
	
	div $22, $20
	mfhi $25
	
	# regra: resto menor que 2 => 0 / maior que 2 => 11 - resto
	addi $9, $0, 2
	slt $9, $9, $25  # $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $9, $0, menorq2 
	
maiorq2:
	sub $25, $20, $25
	j prox
	
menorq2:
	addi $25, $0, 0
	j prox
	
prox:
	# SEGUNDO DIGITO
	
	# multiplicando por 10($19 * 11) até 2 ($25 * 2)
	
	addi $20, $0, 2
	
	mul $21, $25, $20 # *2
	addi $20, $20, 1 # $20 -> 3
	
	mul $22, $11, $20 # *3
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 4
	
	mul $21, $12, $20 # *4
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 5
	
	mul $21, $13, $20 # *5
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 6
	
	mul $21, $14, $20 # *6
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 6
	
	mul $21, $15, $20 # *7
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 8
	
	mul $21, $16, $20 # *8
	add $22, $22, $21
	addi $20, $20, 1 # # $20 -> 9
	
	mul $21, $17, $20 # *9
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 10
	
	mul $21, $18, $20 # *10
	add $22, $22, $21
	addi $20, $20, 1 # $20 -> 11
	
	mul $21, $19, $20 # *11
	add $22, $22, $21
	
	# div por 11
	
	div $22, $20
	mfhi $24
	
	# regra: resto menor que 2 => 0 / maior que 2 => 11 - resto
	addi $9, $0, 2
	slt $9, $9, $24  # $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $9, $0, menq2 
	
maiq2:
	sub $24, $20, $24
	j fim
	
menq2:
	addi $24, $0, 0
	j fim
	
fim:
	add $4, $0, $25
	addi $2, $0, 1
	syscall
	
	add $4, $0, $24
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall