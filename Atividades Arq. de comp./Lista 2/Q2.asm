# 2. Faça um programa para ler um número inteiro. Se o número for positivo, imprima o
# dobro do número, se for negativo, imprima o quadrado do número.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
 	srl $9, $8, 31 #positivo (0) ou negativo (1)
 	beq $9, $0, pos
 	
 neg:	mul $4, $8, $8
 	addi $2, $0, 1
 	syscall
 	j fim
 
 pos:	addi $10, $0, 2
 	mul $4, $8, $10
 	addi $2, $0, 1
 	syscall
 
 fim:	addi $2, $0, 10
 	syscall
