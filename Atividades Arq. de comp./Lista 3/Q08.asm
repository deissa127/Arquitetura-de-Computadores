# 8. Faça um programa que leia números inteiros diferentes de zero e encontre o menor
#    valor digitado e o maior valor digitado. O programa informa o maior e o menor, um em
#    cada linha, quando o usuário digitar um 0.

# obs.; o mips não guarda uma lista, então é preciso comparar toda vez que entrar um novo número.
# erro - o menor número consta como 0


.text
main:
	addi $10, $0, 1 # menor numero
#----------CORPO DO LAÇO--------------
laco:	
	add $2, $0, 5
	syscall
	add $8, $0, $2 # maior numero até então

teste:	# é maior que 0 ?
	slt $9, $8, $10		# $a > $b = $x -> 0 // $a < $b = $x -> 1
	bne $9, $0, fim		# nao é maior que 0 - fim

comp:	# era maior que 0
	slt $25, $8, $10	# $a > $b = $x -> 0 // $a < $b = $x -> 1 // 0 = maior, 1 = menor
	beq $25, $0, maior
	
menor:
	add $19, $0, $8	# menor numero
maior:
	add $18, $0, $8	# maior numero
#-------FIM DO CORPO DO LAÇO--------------      
prox:	
	j laco 
	
fim:	
	add $4, $0, $18
	add $2, $0, 1
	syscall
	
	add $4, $0, ' '
	add $2, $0, 11
	syscall
	
	add $4, $0, $19
	add $2, $0, 1
	syscall
	
	add $2, $0, 10
	syscall