# 5. Faça um programa que leia 10 valores e imprima a sua soma.

.text
main:
	addi $9, $0, 1
	addi $10, $0, 11
	
teste:	beq $10, $9, fim
#----------CORPO DO LAÇO--------------
	add $2, $0, 5
	syscall
	add $8, $8, $2

#-------FIM DO CORPO DO LAÇO--------------      
prox:	addi $9, $9, 1	# i++
	j teste
	
fim:	add $4, $0, $8
	add $2, $0, 1
	syscall
	
	add $2, $0, 10
	syscall