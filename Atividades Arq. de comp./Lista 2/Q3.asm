# 3. Escreva um programa para ler dois números inteiros e mostrar na tela o maior deles,
# bem como a diferença entre eles (a diferença é sempre um valor positivo).

.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	slt $10, $8, $9 # $a > $b = $x -> 0 // $a < $b = $x -> 1
	beq $10, $0, i0
	
d1:	add $4, $0, $9
	addi $2,$0, 1
	syscall
	
	add $4, $0, '\n'
	addi $2,$0, 11
	syscall
	
	sub $4, $9, $8
	addi $2,$0, 1
	syscall
	
	j fim
	
i0:	add $4, $0, $8
	addi $2,$0, 1
	syscall
	
	add $4, $0, '\n'
	addi $2,$0, 11
	syscall
	
	sub $4, $8, $9
	addi $2,$0, 1
	syscall

fim:	addi $2, $0, 10
	syscall