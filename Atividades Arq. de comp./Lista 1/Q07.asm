# 7. Faça um programa que leia um número entre 0 e 9999 e imprima cada algarismo em
#    uma linha diferente. Ex.: 3219 imprime
#    9
#    1
#    2
#    3
#    Ex.: 123
#    3
#    2
#    1
#    0

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
	mflo $14
	
	add $4,$0,$11
	addi $2,$0,1
	syscall
	
	add $4,$0,'\n'
	addi $2,$0,11
	syscall
	
	add $4,$0,$12
	addi $2,$0,1
	syscall
	
	add $4,$0,'\n'
	addi $2,$0,11
	syscall
	
	add $4,$0,$13
	addi $2,$0,1
	syscall
	
	add $4,$0,'\n'
	addi $2,$0,11
	syscall
	
	add $4,$0,$14
	addi $2,$0,1
	syscall
	
	addi $2, $0, 10
	syscall