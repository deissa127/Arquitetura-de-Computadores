# 1. Faça um programa para ler um número inteiro e imprimir o dobro desse número.

.text
main: 	addi $2,$0,5
	syscall
	
	add $4,$2,$2
	
	addi $2,$0,1
	syscall
	
	addi $2, $0, 10
	syscall	