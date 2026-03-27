# 4. Faça um programa que leia dois números e escreva a relação de grandeza entre eles.
# Ex. 345 e 23 gera a saída 345>23. Ex.: 24 e 38 gera a saída 24<38. Ex.: 12 e 12 gera a saída 12=12.

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	beq $8, $9, vdd
	
	slt $10, $8, $9  # $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $10, $0, igual0  
	
difer0:	add $4, $0, $8
	addi $2,$0, 1
	syscall
	
	add $4, $0, '<'
	addi $2,$0, 11
	syscall
	
	add $4, $0, $9
	addi $2,$0, 1
	syscall
	
	j fim

igual0:	add $4, $0, $8
	addi $2,$0, 1
	syscall
	
	add $4, $0, '>'
	addi $2,$0, 11
	syscall
	
	add $4, $0, $9
	addi $2,$0, 1
	syscall
	
	j fim
	
vdd:	add $4, $0, $8
	addi $2,$0, 1
	syscall
	
	add $4, $0, '='
	addi $2,$0, 11
	syscall

	add $4, $0, $9
	addi $2,$0, 1
	syscall

fim:	addi $2, $0, 10
	syscall