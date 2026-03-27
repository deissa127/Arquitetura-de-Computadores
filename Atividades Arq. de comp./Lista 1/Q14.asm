# 14. Faça um programa que leia um número inteiro e imprima 1 se o valor for ímpar e 0 se
#     o valor for par.

.text
main: 	addi $11,$0,2

	addi $2,$0,5
	syscall
	
	div $2,$11
	mfhi $4
	
	addi $2,$0,1
	syscall
	
	addi $2, $0, 10
	syscall
