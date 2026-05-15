# 10. Leia um vetor com 10 números inteiros. Escreva os elementos do vetor eliminando
#     elementos repetidos. Faça a alteração diretamente no vetor original, sem uso de
#     vetores auxiliares.

# incompleto

.data
A:	.word 0,0,0,0,0,0,0,0,0,0

.text
main:
	la $7, A			# la = (Load Address) carrega o endereço de uma variável declarada no .data - faz a mesma coisa que o lui
	add $8, $0, $7			# cópia do $7 que possa ser alterado
	addi $10, $0, 10


entrada:
	beq $10, $0, copiar
	addi $2, $0, 5
	syscall
	sw $2, 0($8)
	addi $8, $8, 4
	addi $10, $10, -1
	j entrada


copiar:
	addi $20, $0, 0		# i = 0 (percorre original)

laco:
	slti $15, $20, 10	# slti = compação com constante     $a > b = $x -> 0 // $a < b = $x -> 1
	beq $15, $0, imprimir	# i >= 10

	sll $25, $20, 2		# $20 * 4 => indice de A
	add $25, $7, $25
	lw $22, 0($25)		# $22 = A[i]
	
elemcomp:	
	addi $21, $21, 1	# contador da comp
	sll $25, $21, 2
	add $25, $7, $25
	lw $23, 0($25)		# $23 = A[j]
	
	slti $14, $21, 10	# $a > b = $x -> 0 // $a < b = $x -> 1
	beq $14, $0, fim	# i >= 10

comp:
	bne $22, $23, nigual
	
igual:
	#mudança de posiçã0

		
	
nigual:
	j elemcomp

#----------IMPRESSÃO----------
imprimir:
    addi $20, $0, 0             # i = 0

imp:
    beq $20, 10, fim

    sll $25, $20, 2
    add $25, $13, $25
    lw $4, 0($25)               # $4 = Aux[i]

    addi $v0, $0, 1
    syscall

    addi $4, $0, ' '
    addi $v0, $0, 11
    syscall

    addi $20, $20, 1
    j imp

fim:
    addi $v0, $0, 10
    syscall
