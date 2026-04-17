# 5. Faça um programa que leia um número inteiro entre 0 e 999 e imprima a soma dos
#    algarismos desse número. Ex.: 358 gera uma saída de 16, pois 3+5+8 = 16

.text
main: 	addi $2,$0,5
	syscall
	add $8,$0,$2
	
	addi $10,$0,10
	
	div $8,$10
	mfhi $11
	mflo $8
	
	div $8,$10
	mfhi $12
	mflo $8
	
	div $8,$10
	mfhi $13
	
	add $4,$11,$12
	add $4,$4,$13
	
	addi $2,$0,1
	syscall