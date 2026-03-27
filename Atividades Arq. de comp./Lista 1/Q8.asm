# 8. Faça um programa que leia três números inteiros, representando a duração em horas,
#    minutos e segundos de um experimento científico e informe essa duração em
#    segundos.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	addi $25, $0, 3600
	addi $24, $0, 60
	
	mul $11, $8, $25
	mul $12, $9, $24
	
	add $13, $11, $12
	add $4, $13, $10
	
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall
