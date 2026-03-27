# 2. Faça um programa para ler um número inteiro e imprimir o quadrado desse número.

.text
main: 	addi $2,$0,5
	syscall
	
	mul $4,$2,$2
	
	addi $2,$0,1
	syscall

	addi $2, $0, 10
	syscall