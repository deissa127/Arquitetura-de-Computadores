# 9. Faça um programa que leia um número inteiro, representando a duração em segundos
#    de um experimento científico e imprima o tempo decorrido nesse experimento no
#    formato h:m:s.
#    Exemplo: 3755 gera uma saída 1:2:35

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $25, $0, 3600
	addi $24, $0, 60
	
	div $8, $25
	mflo $9
	mfhi $23
	
	div $23, $24
	mflo $10
	mfhi $11
	
	add $4, $0, $9
	addi $2, $0, 1
	syscall
	
	add $4, $0, ':'
	addi $2, $0, 11
	syscall
	
	add $4, $0, $10
	addi $2, $0, 1
	syscall
	
	add $4, $0, ':'
	addi $2, $0, 11
	syscall
	
	add $4, $0, $11
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall