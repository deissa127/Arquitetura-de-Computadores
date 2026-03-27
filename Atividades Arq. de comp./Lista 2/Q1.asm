# 1. Faça um programa para ler dois números e informe qual deles é o maior.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	slt $10, $8, $9
	beq $10, $0, igual0
	
difer0:	add $4, $0, $9
	addi $2,$0, 1
	syscall
	j fim

igual0:	add $4, $0, $8
	addi $2,$0, 1
	syscall

fim:	addi $2, $0, 10
	syscall