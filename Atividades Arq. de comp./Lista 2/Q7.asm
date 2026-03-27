# 7. Faça um programa que leia um ano e informe se esse ano é bissexto.
#    regras do ano bissexto: São bissextos os anos divisíveis por 4 que não são séculos inteiros. 
#    São bissextos os anos que são séculos inteiros (ex: 2000, 1900) e são divisíveis por 400.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $25, $0, 100
	div $8, $25
	mfhi $9
	beq $9, $0, div400
	
div4:	addi $23, $0, 4
	div $8, $23
	mfhi $11
	beq $11, $0, sim
	j nao

div400:	addi $24, $0, 400
	div $8, $24
	mfhi $10
	beq $10, $0, sim
	
nao:	addi $4, $0, 'N'
	addi $2, $0, 11
	syscall
	j fim
	
sim:	addi $4, $0, 'S'
	addi $2, $0, 11
	syscall
	j fim

fim:	addi $2, $0, 10
	syscall