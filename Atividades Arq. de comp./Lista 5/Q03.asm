# 03. Faça um programa que leia um vetor de 8 posições e, em seguida, leia também dois
#     valores X e Y quaisquer correspondentes a duas posições (índices) no vetor. Ao final
#     seu programa deverá escrever a soma dos valores encontrados nas respectivas
#     posições X e Y.

.text
main:
	lui $8, 0x1001
	addi $25, $0, 8	#contador
	
entradas:
	beq $25, $0, prox
	addi $2, $0, 5
	syscall
	sw $2, 0($8)
	addi $8, $8, 4
	addi $25, $25, -1
	j entradas
	
prox:	# X e Y serão contados apartir de 0 que é o primeiro indice => A[0] ---> A[7]
	lui $8, 0x1001
	
	addi $2, $0, 5	# X
	syscall
	add $10, $0, $2
	
	addi $2, $0, 5	# Y
	syscall
	add $11, $0, $2
	
	sll $25, $10, 2	# X * 4
	sll $24, $11, 2	# Y * 4
	
	add $25, $8, $25	# indice de X
	lw $20, 0($25)
	
	add $24, $8, $24	# indice de y
	lw $21, 0($24)
	
	add $4, $20, $21
	addi $2, $0, 1
	syscall
	
fim:
	addi $2, $0, 10
	syscall